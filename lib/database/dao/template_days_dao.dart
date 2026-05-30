import 'package:drift/drift.dart';

import 'package:scheduling_assistant/database/database.dart';
import 'package:scheduling_assistant/database/tables.dart';

part 'template_days_dao.g.dart';

@DriftAccessor(tables: [TemplateDays])
class TemplateDaysDao extends DatabaseAccessor<AppDatabase>
    with _$TemplateDaysDaoMixin {
  TemplateDaysDao(super.db);

  // --- 增 ---
  Future<int> addTemplateDays(int templateId, int dayIndex) {
    return into(templateDays).insert(
      TemplateDaysCompanion.insert(templateId: templateId, dayIndex: dayIndex),
      mode: InsertMode.insertOrIgnore,
    );
  }

  // --- 删 ---
  Future<int> deleteTemplateDays(int id) {
    return (delete(templateDays)..where((t) => t.id.equals(id))).go();
  }

  // --- 改 ---
  Future<int> updateTemplateDays(int id, {int? dayIndex}) {
    return (update(templateDays)..where((t) => t.id.equals(id))).write(
      TemplateDaysCompanion(
        dayIndex: dayIndex == null ? Value.absent() : Value(dayIndex),
      ),
    );
  }
}
