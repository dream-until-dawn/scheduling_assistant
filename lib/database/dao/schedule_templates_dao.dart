import 'package:drift/drift.dart';

import 'package:scheduling_assistant/database/database.dart';
import 'package:scheduling_assistant/database/tables.dart';
// model
import 'package:scheduling_assistant/models/template_detail.dart';

part 'schedule_templates_dao.g.dart';

@DriftAccessor(
  tables: [
    ScheduleTemplates,
    TemplateDays,
    TemplateDayShifts,
    ScheduleAnchors,
    Shifts,
  ],
)
class ScheduleTemplatesDao extends DatabaseAccessor<AppDatabase>
    with _$ScheduleTemplatesDaoMixin {
  ScheduleTemplatesDao(super.db);

  // --- 增 ---
  Future<int> addScheduleTemplates(String name, String? remark) {
    return into(scheduleTemplates).insert(
      ScheduleTemplatesCompanion.insert(
        name: name,
        remark: remark == null ? Value.absent() : Value(remark),
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }

  // --- 删 ---
  Future<int> deleteScheduleTemplates(int id) {
    return (delete(scheduleTemplates)..where((t) => t.id.equals(id))).go();
  }

  // --- 改 ---
  Future<int> updateScheduleTemplates(int id, {String? name, String? remark}) {
    return (update(scheduleTemplates)..where((t) => t.id.equals(id))).write(
      ScheduleTemplatesCompanion(
        name: name == null ? Value.absent() : Value(name),
        remark: remark == null ? Value.absent() : Value(remark),
      ),
    );
  }

  // --- 查 ---

  // 全部模板列表
  Future<List<ScheduleTemplate>> getAllTemplates() {
    return select(scheduleTemplates).get();
  }

  // 模板详情
  Future<TemplateDetail?> getTemplateDetail(int templateId) async {
    // 取模板表-基础信息
    final template = await (select(
      scheduleTemplates,
    )..where((t) => t.id.equals(templateId))).getSingleOrNull();
    if (template == null) {
      return null;
    }
    // 取模板天表-该模板涉及天数
    final dayList =
        await (select(templateDays)
              ..where((t) => t.templateId.equals(templateId))
              ..orderBy([(t) => OrderingTerm.asc(t.dayIndex)]))
            .get();
    final details = <TemplateDayDetail>[];
    for (final day in dayList) {
      // 取模板天表-该模板涉及天数对应的shift表-该天涉及的shift
      final shiftsQuery =
          select(shifts).join([
              innerJoin(
                templateDayShifts,
                templateDayShifts.shiftId.equalsExp(shifts.id),
              ),
            ])
            ..where(templateDayShifts.templateDayId.equals(day.id))
            ..orderBy([OrderingTerm.asc(shifts.startMinute)]);
      final shiftRows = await shiftsQuery.get();
      details.add(
        TemplateDayDetail(
          dayIndex: day.dayIndex,
          shifts: shiftRows.map((e) => e.readTable(shifts)).toList(),
        ),
      );
    }
    // 取锚点表-该模板对应的锚点信息（如果有）
    final anchor = await (select(
      scheduleAnchors,
    )..where((t) => t.templateId.equals(templateId))).getSingleOrNull();
    // 组装返回
    return TemplateDetail(
      templateId: template.id,
      name: template.name,
      remark: template.remark,
      days: details,
      anchor: anchor == null
          ? null
          : AnchorDetail(date: anchor.anchorDate, cycleDay: anchor.cycleDay),
    );
  }

  // 增 --- 整套模板
  Future<int> createTemplate(TemplateDetail td) async {
    return transaction(() async {
      // 1.先创模板-得到模板ID
      final templateId = await into(scheduleTemplates).insert(
        ScheduleTemplatesCompanion.insert(
          name: td.name,
          remark: td.remark == null ? Value.absent() : Value(td.remark),
        ),
      );
      // 2.再创模板天表-得到模板天ID
      for (final day in td.days) {
        final dayId = await into(templateDays).insert(
          TemplateDaysCompanion.insert(
            templateId: templateId,
            dayIndex: day.dayIndex,
          ),
        );
        // 3.再创shift表-得到shiftID后插入模板天对应表
        for (final shift in day.shifts) {
          final shiftId = await into(shifts).insert(
            ShiftsCompanion.insert(
              name: shift.name,
              startMinute: shift.startMinute,
              endMinute: shift.endMinute,
              colorHex: shift.colorHex == null
                  ? Value.absent()
                  : Value(shift.colorHex),
              remark: shift.remark == null
                  ? Value.absent()
                  : Value(shift.remark),
            ),
          );
          await into(templateDayShifts).insert(
            TemplateDayShiftsCompanion.insert(
              templateDayId: dayId,
              shiftId: shiftId,
            ),
          );
        }
      }
      // 4.最后创锚点表（如果有）
      if (td.anchor != null &&
          td.anchor?.date != null &&
          td.anchor?.cycleDay != null) {
        await into(scheduleAnchors).insert(
          ScheduleAnchorsCompanion.insert(
            templateId: templateId,
            anchorDate: td.anchor!.date,
            cycleDay: td.anchor!.cycleDay,
          ),
        );
      }
      return templateId;
    });
  }
}
