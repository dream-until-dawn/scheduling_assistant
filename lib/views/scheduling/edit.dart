import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:bot_toast/bot_toast.dart';

import 'package:scheduling_assistant/providers/settings_provider.dart';
import 'package:scheduling_assistant/providers/calendar_provider.dart';

import 'package:scheduling_assistant/database/database.dart' show Shift;
import 'package:scheduling_assistant/models/template_detail.dart';

// === 1. 定义表单使用的可变中间状态类 ===
class MutableShift {
  String name = '';
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String? remark;
  String? colorHex;
  // 辅助方法：将 TimeOfDay 转换为分钟数
  int? get startMinute =>
      startTime != null ? startTime!.hour * 60 + startTime!.minute : null;
  int? get endMinute =>
      endTime != null ? endTime!.hour * 60 + endTime!.minute : null;
}

class MutableDay {
  List<MutableShift> shifts = [];
}

class SchedulingEditPage extends ConsumerWidget {
  SchedulingEditPage({super.key});

  final GlobalKey<TemplateFormPageState> _childKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(settingsProvider);
    final calendarAsync = ref.watch(calendarProvider);
    if (settingsAsync.hasError || calendarAsync.hasError) {
      return Center(
        child: Text(
          '加载失败: ${settingsAsync.error ?? calendarAsync.error ?? '未知错误'}',
        ),
      );
    }
    if (settingsAsync.isLoading || calendarAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    // final settingData = settingsAsync.value!;
    // final calendarData = calendarAsync.value!;

    void submitForm() async {
      final templateDetail = _childKey.currentState?.submitForm();
      if (templateDetail == null) return; // 表单校验不通过，返回
      // print('最终组装的 TemplateDetail 对象:');
      // print('模板ID: ${templateDetail.templateId}');
      // print('模板名称: ${templateDetail.name}');
      // print('锚点日期: ${templateDetail.anchor?.date}');
      // print('锚点对应周期天数: ${templateDetail.anchor?.cycleDay}');
      // for (var day in templateDetail.days) {
      //   print('第 ${day.dayIndex} 天:');
      //   for (var shift in day.shifts) {
      //     print('  班次名称: ${shift.name}');
      //     print('  开始时间（分钟数）: ${shift.startMinute}');
      //     print('  结束时间（分钟数）: ${shift.endMinute}');
      //   }
      // }
      // 保存排班模板到数据库
      final isSuccess = await ref
          .read(calendarProvider.notifier)
          .addTemplate(templateDetail);
      if (isSuccess) {
        // 保存成功
        BotToast.showText(
          text: '排班模板已保存',
          duration: const Duration(seconds: 2),
        );
        if (context.mounted) {
          context.go('/scheduling'); // 跳转回排班列表页
        }
      } else {
        // 保存失败
        BotToast.showText(
          text: '排班模板保存失败',
          duration: const Duration(seconds: 2),
        );
      }
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '新建排班',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                // 1. 灰色文字按钮 (次要操作，如：取消、重置)
                TextButton(
                  onPressed: () {
                    context.go('/scheduling');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey[600], // 文字和水波纹颜色
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24), // 8像素圆角，看起来更精致
                    ),
                  ),
                  child: const Text(
                    '放弃',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),

                const SizedBox(width: 8), // 两个按钮之间的间距
                // 2. 主色文字按钮 (主要操作，如：新建、保存)
                TextButton(
                  onPressed: submitForm,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blueAccent, // 主色调
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    '保存',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 6),

        Text(
          '创建新的排班模板',
          style: TextStyle(fontSize: 15, color: Colors.grey[120]),
        ),

        const SizedBox(height: 24),

        TemplateFormPage(key: _childKey),
      ],
    );
  }
}

// === 2. 表单页面 UI ===
class TemplateFormPage extends StatefulWidget {
  const TemplateFormPage({super.key});

  @override
  State<TemplateFormPage> createState() => TemplateFormPageState();
}

class TemplateFormPageState extends State<TemplateFormPage> {
  final _formKey = GlobalKey<FormState>();

  // 基础信息
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _remarkCtrl = TextEditingController();

  // 锚点信息
  bool _enableAnchor = false;
  DateTime? _anchorDate;
  int _anchorCycleDay = 1;
  // 周期排班列表（默认1天，没有班次）
  final List<MutableDay> _days = [MutableDay()];
  // === 3. 数据组装逻辑 ===
  TemplateDetail? submitForm() {
    if (!_formKey.currentState!.validate()) return null; // 表单校验不通过，返回 null
    // 简单校验：班次时间是否已填
    for (var day in _days) {
      for (var shift in day.shifts) {
        // 未填开始时间，默认 00:00 (0分钟)
        shift.startTime ??= const TimeOfDay(hour: 0, minute: 0);
        // 未填结束时间，默认 23:59 (1439分钟)
        shift.endTime ??= const TimeOfDay(hour: 23, minute: 59);
      }
    }
    // 组装最终对象
    final templateDetail = TemplateDetail(
      templateId: DateTime.now().millisecondsSinceEpoch, // 任意伪造ID
      name: _nameCtrl.text,
      remark: _remarkCtrl.text.isEmpty ? null : _remarkCtrl.text,
      anchor: _enableAnchor && _anchorDate != null
          ? AnchorDetail(date: _anchorDate!, cycleDay: _anchorCycleDay)
          : null,
      days: _days.asMap().entries.map((entry) {
        final dayIndex = entry.key + 1; // 自动计算，从1开始
        final dayData = entry.value;
        return TemplateDayDetail(
          dayIndex: dayIndex,
          shifts: dayData.shifts
              .map(
                (s) => Shift(
                  id: DateTime.now().microsecondsSinceEpoch, // 任意伪造ID
                  name: s.name,
                  startMinute: s.startMinute!,
                  endMinute: s.endMinute!,
                  remark: s.remark,
                  colorHex: s.colorHex,
                ),
              )
              .toList(),
        );
      }).toList(),
    );
    return templateDetail; // 返回最终的 TemplateDetail 对象
  }

  // === 4. UI 构建 ===
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F9),
      // 由于外层 SchedulingEditPage 是 ListView，如果有内边距冲突，可以适当调整这里的 padding
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildBasicInfoCard(),
            const SizedBox(height: 12),
            _buildAnchorCard(),
            const SizedBox(height: 12),
            _buildDaysList(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // 构建基础信息卡片
  Widget _buildBasicInfoCard() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TextFormField(
            controller: _nameCtrl,
            decoration: const InputDecoration(
              labelText: '模板名称',
              border: InputBorder.none,
            ),
            validator: (v) => v!.isEmpty ? '请输入模板名称' : null,
          ),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          TextFormField(
            controller: _remarkCtrl,
            decoration: const InputDecoration(
              labelText: '备注 (选填)',
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  // 构建锚点信息卡片
  Widget _buildAnchorCard() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SwitchListTile(
            title: const Text('绑定日期锚点', style: TextStyle(fontSize: 16)),
            subtitle: const Text(
              '将某一天指定为排班周期中的第N天',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            value: _enableAnchor,
            activeThumbColor: Colors.blueAccent,
            onChanged: (val) => setState(() => _enableAnchor = val),
          ),
          if (_enableAnchor) ...[
            const Divider(height: 1, color: Color(0xFFEEEEEE)),
            ListTile(
              title: const Text('基准日期'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _anchorDate != null
                        ? "${_anchorDate!.year}-${_anchorDate!.month}-${_anchorDate!.day}"
                        : "请选择",
                    style: TextStyle(
                      color: _anchorDate != null ? Colors.black87 : Colors.grey,
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (date != null) setState(() => _anchorDate = date);
              },
            ),
            const Divider(height: 1, color: Color(0xFFEEEEEE)),
            ListTile(
              title: const Text('对应周期天数'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("第 $_anchorCycleDay 天"),
                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
              onTap: () {
                // 这里用一个简单的对话框代替滑动Picker
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    // 👈 弹窗的 context 命名为 ctx
                    title: const Text('选择天数'),
                    content: SizedBox(
                      width: double.maxFinite,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _days.length,
                        itemBuilder: (c, i) => ListTile(
                          title: Text('第 ${i + 1} 天'),
                          onTap: () {
                            setState(() => _anchorCycleDay = i + 1);
                            Navigator.of(ctx).pop();
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }

  // 构建排班天数列表
  Widget _buildDaysList() {
    return Column(
      children: [
        ..._days.asMap().entries.map((entry) {
          final index = entry.key;
          final day = entry.value;
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 天数 Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '第 ${index + 1} 天',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (_days.length > 1) // 保留至少一天
                        InkWell(
                          onTap: () => setState(() => _days.removeAt(index)),
                          child: const Text(
                            '删除此天',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 14,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const Divider(height: 1, color: Color(0xFFEEEEEE)),

                // 班次列表
                ...day.shifts.asMap().entries.map((shiftEntry) {
                  return _buildShiftItem(day, shiftEntry.key, shiftEntry.value);
                }),

                // 添加班次按钮
                InkWell(
                  onTap: () => setState(() => day.shifts.add(MutableShift())),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    child: const Text(
                      '+ 添加班次',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),

        // 添加一天按钮
        GestureDetector(
          onTap: () => setState(() => _days.add(MutableDay())),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blueAccent),
            ),
            alignment: Alignment.center,
            child: const Text(
              '+ 增加排班天数',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 单个班次卡片 UI
  Widget _buildShiftItem(MutableDay day, int shiftIndex, MutableShift shift) {
    String formatTime(TimeOfDay? time) {
      if (time == null) return '请选择';
      final h = time.hour.toString().padLeft(2, '0');
      final m = time.minute.toString().padLeft(2, '0');
      return '$h:$m';
    }

    return Container(
      color: const Color(0xFFFAFAFA), // 班次背景稍微区分
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: shift.name,
                  decoration: InputDecoration(
                    labelText: '班次名称 (如: 早班)',
                    border: const UnderlineInputBorder(),
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (v) => shift.name = v,
                  validator: (v) => v!.isEmpty ? '必填' : null,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: Colors.redAccent,
                ),
                onPressed: () =>
                    setState(() => day.shifts.removeAt(shiftIndex)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: const TimeOfDay(hour: 8, minute: 0),
                    );
                    if (time != null) setState(() => shift.startTime = time);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '开始时间',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        formatTime(shift.startTime),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const Text('—', style: TextStyle(color: Colors.grey)),
              const SizedBox(width: 16),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: const TimeOfDay(hour: 17, minute: 0),
                    );
                    if (time != null) setState(() => shift.endTime = time);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '结束时间',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        formatTime(shift.endTime),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
