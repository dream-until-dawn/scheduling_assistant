import 'package:drift/drift.dart';

import 'package:scheduling_assistant/database/database.dart';
import 'package:scheduling_assistant/database/tables.dart';

part 'shifts_dao.g.dart';

@DriftAccessor(tables: [Shifts])
class ShiftsDao extends DatabaseAccessor<AppDatabase> with _$ShiftsDaoMixin {
  ShiftsDao(super.db);

  // --- 增 ---
  Future<int> addShift(
    String name,
    int startMinute,
    int endMinute,
    String? colorHex,
    String? remark,
  ) {
    return into(shifts).insert(
      ShiftsCompanion.insert(
        name: name,
        startMinute: startMinute,
        endMinute: endMinute,
        colorHex: colorHex == null ? Value.absent() : Value(colorHex),
        remark: remark == null ? Value.absent() : Value(remark),
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }

  // --- 删 ---
  Future<int> deleteShift(int id) {
    return (delete(shifts)..where((t) => t.id.equals(id))).go();
  }

  // --- 改 ---
  Future<int> updateShift(
    int id, {
    String? name,
    int? startMinute,
    int? endMinute,
    String? colorHex,
    String? remark,
  }) {
    return (update(shifts)..where((t) => t.id.equals(id))).write(
      ShiftsCompanion(
        name: name == null ? Value.absent() : Value(name),
        startMinute: startMinute == null ? Value.absent() : Value(startMinute),
        endMinute: endMinute == null ? Value.absent() : Value(endMinute),
        colorHex: colorHex == null ? Value.absent() : Value(colorHex),
        remark: remark == null ? Value.absent() : Value(remark),
      ),
    );
  }
}
