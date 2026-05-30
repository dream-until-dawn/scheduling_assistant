import 'package:drift/drift.dart';

import 'package:scheduling_assistant/database/database.dart';
import 'package:scheduling_assistant/database/tables.dart';

part 'schedule_anchors_dao.g.dart';

@DriftAccessor(tables: [ScheduleAnchors])
class ScheduleAnchorsDao extends DatabaseAccessor<AppDatabase>
    with _$ScheduleAnchorsDaoMixin {
  ScheduleAnchorsDao(super.db);

  // --- 增 ---
  Future<int> addScheduleAnchors(
    int templateId,
    DateTime anchorDate,
    int cycleDay,
  ) {
    return into(scheduleAnchors).insert(
      ScheduleAnchorsCompanion.insert(
        templateId: templateId,
        anchorDate: anchorDate,
        cycleDay: cycleDay,
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }

  // --- 删 ---
  Future<int> deleteScheduleAnchors(int id) {
    return (delete(scheduleAnchors)..where((t) => t.id.equals(id))).go();
  }

  // --- 改 ---
  Future<int> updateScheduleAnchors(
    int id, {
    DateTime? anchorDate,
    int? cycleDay,
  }) {
    return (update(scheduleAnchors)..where((t) => t.id.equals(id))).write(
      ScheduleAnchorsCompanion(
        anchorDate: anchorDate == null ? Value.absent() : Value(anchorDate),
        cycleDay: cycleDay == null ? Value.absent() : Value(cycleDay),
      ),
    );
  }
}
