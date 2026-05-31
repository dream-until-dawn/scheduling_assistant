import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:scheduling_assistant/providers/settings_provider.dart';
import 'package:scheduling_assistant/providers/calendar_provider.dart';

import 'package:scheduling_assistant/models/template_detail.dart';

import 'package:go_router/go_router.dart';

class SchedulingPage extends ConsumerWidget {
  const SchedulingPage({super.key});

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
    final calendarData = calendarAsync.value!;

    void removeTemplate(int templateId) async {
      await ref.read(calendarProvider.notifier).removeTemplate(templateId);
    }

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '排班',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    ref.read(calendarProvider.notifier).refresh();
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
                    '刷新',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.go('/scheduling/edit/new');
                  },
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
                    '新建排班',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 6),

        Text(
          calendarData.curTemplateDetails == null
              ? '已有的排班模板'
              : "当前排班模板: ${calendarData.curTemplateDetails!.name}",
          style: TextStyle(fontSize: 15, color: Colors.grey[120]),
        ),

        const SizedBox(height: 24),

        ...(calendarData.templateDetailList.map(
          (detail) =>
              TemplateCard(template: detail, removeTemplate: removeTemplate),
        )),
      ],
    );
  }
}

class TemplateCard extends StatelessWidget {
  final TemplateDetail template;
  final Function(int) removeTemplate; // 传递删除模板的回调函数

  const TemplateCard({
    super.key,
    required this.template,
    required this.removeTemplate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8), // AntD 常用圆角
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ================= 头部：标题与周期标签 =================
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // ✅ 修复1：给 Text 套上 Expanded，这样它就知道剩余空间有多大，ellipsis 才会生效！
                      Expanded(
                        child: Text(
                          template.name,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF333333),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      _buildTag('${template.days.length}天周期'),
                    ],
                  ),
                ),

                const SizedBox(width: 12), // ✅ 建议加一点间距，防止按钮和标签贴得太近
                // ✅ 修复2：微调高度和字号，防止文字被完全裁剪
                SizedBox(
                  height: 30, // 24 实在太小了，30 是一个比较舒适且紧凑的高度
                  child: TextButton(
                    onPressed: () {
                      removeTemplate(template.templateId); // 传递模板ID给回调函数
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fixedSize: const Size(64, 30), // 宽度可以根据 "删除" 两个字稍微收缩到 64
                      padding: EdgeInsets.zero, // 直接写 EdgeInsets.zero 更简洁
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      '删除',
                      style: TextStyle(
                        fontSize: 14, // 配合紧凑型按钮，14号字更协调
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, color: Color(0xFFEEEEEE)),

          // ================= 内容区：备注与锚点 =================
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 备注信息
                if (template.remark != null && template.remark!.isNotEmpty) ...[
                  Text(
                    template.remark!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF999999),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                ],

                // 锚定基准日 (如果有)
                if (template.anchor != null) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 14,
                          color: Color(0xFF999999),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '基准日: ${_formatDate(template.anchor!.date)} (第${template.anchor!.cycleDay}天)',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                // ================= 班次摘要简览 =================
                _buildShiftsSummary(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建 AntD 风格的浅色背景主色文字标签
  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F4FF), // AntD Primary-1
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFF91CAFF)), // AntD Primary-3
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF1677FF), // AntD Primary-6
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// 构建班次摘要（避免列表过长，最多显示前3天）
  Widget _buildShiftsSummary() {
    if (template.days.isEmpty) {
      return const Text(
        '暂无排班数据',
        style: TextStyle(fontSize: 13, color: Color(0xFFCCCCCC)),
      );
    }

    final maxDisplay = 3;
    final displayDays = template.days.take(maxDisplay).toList();
    final hasMore = template.days.length > maxDisplay;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...displayDays.map((day) {
          final shiftNames = day.shifts.isEmpty
              ? '无班次'
              : day.shifts
                    .map(
                      (s) =>
                          "${s.name}[${formatMinutesToTime(s.startMinute)}-${formatMinutesToTime(s.endMinute)}]",
                    )
                    .join('、'); // 假设 Shift 对象有 name 属性

          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '第${day.dayIndex}天：',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF999999),
                  ),
                ),
                Expanded(
                  child: Text(
                    shiftNames,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF333333),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        }),
        if (hasMore)
          const Text(
            '...',
            style: TextStyle(fontSize: 13, color: Color(0xFF999999)),
          ),
      ],
    );
  }

  /// 简单的日期格式化辅助函数
  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  // 分钟数 -> 时间字符串
  String? formatMinutesToTime(int? totalMinutes) {
    if (totalMinutes == null) return null;

    // 1. 计算小时和分钟
    final int hour = totalMinutes ~/ 60; // 使用 ~/ 进行整除
    final int minute = totalMinutes % 60; // 使用 % 取余数

    // 2. 格式化为两位数 (不足两位前面补0)
    final String hourStr = hour.toString().padLeft(2, '0');
    final String minuteStr = minute.toString().padLeft(2, '0');

    // 3. 拼接并返回
    return '$hourStr:$minuteStr';
  }
}
