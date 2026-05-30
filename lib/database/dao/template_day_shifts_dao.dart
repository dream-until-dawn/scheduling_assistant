import 'package:drift/drift.dart';

import 'package:scheduling_assistant/database/database.dart';
import 'package:scheduling_assistant/database/tables.dart';

part 'template_day_shifts_dao.g.dart';

@DriftAccessor(tables: [TemplateDayShifts])
class TemplateDayShiftsDao extends DatabaseAccessor<AppDatabase>
    with _$TemplateDayShiftsDaoMixin {
  TemplateDayShiftsDao(super.db);

  // --- 增 ---
  Future<int> addTemplateDayShifts(int templateDayId, int shiftId) {
    return into(templateDayShifts).insert(
      TemplateDayShiftsCompanion.insert(
        templateDayId: templateDayId,
        shiftId: shiftId,
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }

  // --- 删 ---
  Future<int> deleteTemplateDayShifts(int id) {
    return (delete(templateDayShifts)..where((t) => t.id.equals(id))).go();
  }

  // --- 改 ---
  Future<int> updateTemplateDayShifts(int id, {int? shiftId}) {
    return (update(templateDayShifts)..where((t) => t.id.equals(id))).write(
      TemplateDayShiftsCompanion(
        shiftId: shiftId == null ? Value.absent() : Value(shiftId),
      ),
    );
  }
}
