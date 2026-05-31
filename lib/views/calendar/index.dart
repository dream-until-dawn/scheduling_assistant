import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:lunar/lunar.dart';
import 'package:intl/intl.dart';

import 'package:scheduling_assistant/providers/calendar_provider.dart';

import 'package:scheduling_assistant/models/template_detail.dart';
import 'package:scheduling_assistant/database/database.dart' show Shift;

class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarAsync = ref.watch(calendarProvider);
    if (calendarAsync.hasError) {
      return Center(child: Text('加载失败: ${calendarAsync.error ?? '未知错误'}'));
    }
    if (calendarAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    final calendarData = calendarAsync.value!;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      children: [
        (calendarData.curTemplateDetails != null)
            ? TemplateCalendarView(template: calendarData.curTemplateDetails!)
            : const Text("请先指定一个排班模板"),
      ],
    );
  }
}

class TemplateCalendarView extends StatefulWidget {
  final TemplateDetail template;

  const TemplateCalendarView({super.key, required this.template});

  @override
  State<TemplateCalendarView> createState() => _TemplateCalendarViewState();
}

class _TemplateCalendarViewState extends State<TemplateCalendarView> {
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now(); // 仅保留聚焦月份控制
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,

        // 💡 调整 1：彻底移除 selectedDayPredicate 和 onDaySelected（不再响应选中状态）
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },

        // 💡 调整 3：设置周一为一周的开始，周六日自然就在第 6、7 列
        startingDayOfWeek: StartingDayOfWeek.monday,

        rowHeight: 64,
        daysOfWeekHeight: 32,
        locale: 'zh_CN', // 中文本地化
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) =>
              _buildCalendarCell(day, false),
          todayBuilder: (context, day, focusedDay) =>
              _buildCalendarCell(day, true), // 今日
          outsideBuilder: (context, day, focusedDay) =>
              _buildCalendarCell(day, false, isOutside: true),
        ),
      ),
    );
  }

  /// ================= 计算日期对应的班次信息 =================
  TemplateDayDetail? _getShiftDetailForDate(DateTime date) {
    if (widget.template.anchor == null || widget.template.days.isEmpty)
      return null;

    final anchor = widget.template.anchor!;
    final anchorDate = DateTime(
      anchor.date.year,
      anchor.date.month,
      anchor.date.day,
    );
    final targetDate = DateTime(date.year, date.month, date.day);

    final differenceInDays = targetDate.difference(anchorDate).inDays;
    final cycleLength = widget.template.days.length;

    final anchorIndex0 = anchor.cycleDay - 1;
    int targetIndex0 = (anchorIndex0 + differenceInDays) % cycleLength;
    if (targetIndex0 < 0) {
      targetIndex0 += cycleLength;
    }

    return widget.template.days.firstWhere(
      (d) => d.dayIndex == (targetIndex0 + 1),
      orElse: () => TemplateDayDetail(dayIndex: targetIndex0 + 1, shifts: []),
    );
  }

  /// ================= 动态边框算法 (常规天数：同轮无边) =================
  Border _buildCellBorder(int currentCycleIdx, int cycleLength) {
    const borderSide = BorderSide(color: Color(0xFFEFEFEF), width: 1);
    BorderSide left = borderSide;
    BorderSide right = borderSide;
    BorderSide top = borderSide;
    BorderSide bottom = borderSide;

    if (currentCycleIdx > 1) left = BorderSide.none;
    if (currentCycleIdx < cycleLength) right = BorderSide.none;

    return Border(top: top, bottom: bottom, left: left, right: right);
  }

  /// ================= 获取农历、节气、节日文本 =================
  Map<String, dynamic> _getLunarTextAndColor(DateTime date) {
    final solar = Solar.fromYmd(date.year, date.month, date.day);
    final lunar = solar.getLunar();

    final solarFestivals = solar.getFestivals();
    if (solarFestivals.isNotEmpty)
      return {'text': solarFestivals.first, 'isHighlight': true};

    final lunarFestivals = lunar.getFestivals();
    if (lunarFestivals.isNotEmpty)
      return {'text': lunarFestivals.first, 'isHighlight': true};

    final jieQi = lunar.getJieQi();
    if (jieQi.isNotEmpty) return {'text': jieQi, 'isHighlight': true};

    if (lunar.getDay() == 1)
      return {'text': '${lunar.getMonthInChinese()}月', 'isHighlight': false};
    return {'text': lunar.getDayInChinese(), 'isHighlight': false};
  }

  /// ================= 渲染：单个日历格子 =================
  Widget _buildCalendarCell(
    DateTime date,
    bool isToday, {
    bool isOutside = false,
  }) {
    final dayDetail = _getShiftDetailForDate(date);
    final currentCycleIdx = dayDetail?.dayIndex ?? 1;
    final cycleLength = widget.template.days.length;

    final lunarInfo = _getLunarTextAndColor(date);
    final shifts = dayDetail?.shifts ?? [];

    return Container(
      decoration: BoxDecoration(
        // 普通日子浅灰/白色背景，今天是淡淡的红晕底色
        color: isToday
            ? const Color(0xFFFFF1F0)
            : (isOutside ? const Color(0xFFFAFAFA) : Colors.white),

        // 💡 调整 2：粗暴高亮今日边框！如果是今天，直接无视“同轮无边”规则，强行画一个 3px 的红色闭合全边框
        border: isToday
            ? Border.all(color: const Color(0xFFFF4D4F), width: 3)
            : _buildCellBorder(currentCycleIdx, cycleLength),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 如果是今天，因为边框变粗了，顶部稍微收缩 1px 防止整体错位
          SizedBox(height: isToday ? 2 : 4),
          // 1、日期数
          Text(
            '${date.day}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isToday ? 15 : 14, // 今天数字稍微放大
              fontWeight: FontWeight.bold,
              color: isToday
                  ? const Color(0xFFFF4D4F) // 今天日期直接变成标志红
                  : (isOutside ? Colors.black : Colors.black87),
            ),
          ),
          // 2、节气节日或农历
          Text(
            lunarInfo['text'],
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 9,
              color: lunarInfo['isHighlight']
                  ? Colors.redAccent
                  : (isToday
                        ? const Color(0xFFFF4D4F).withOpacity(0.7)
                        : Colors.grey[400]),
              fontWeight: lunarInfo['isHighlight'] || isToday
                  ? FontWeight.w600
                  : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          // 3、今日班次（完美保留，正常清爽显示）
          Expanded(
            child: shifts.isEmpty
                ? Center(
                    child: Text(
                      '休',
                      style: TextStyle(
                        fontSize: 11,
                        color: isToday
                            ? const Color(0xFFFF4D4F).withOpacity(0.5)
                            : Colors.grey[400],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: shifts.length,
                    itemBuilder: (context, index) {
                      final shift = shifts[index];
                      final shiftColor = shift.colorHex != null
                          ? Color(
                              int.parse(
                                shift.colorHex!.replaceFirst('#', '0xFF'),
                              ),
                            )
                          : const Color(0xFF1677FF);

                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                          color: shiftColor.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          shift.name,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            color: shiftColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
