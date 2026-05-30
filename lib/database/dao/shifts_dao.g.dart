// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shifts_dao.dart';

// ignore_for_file: type=lint
mixin _$ShiftsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ShiftsTable get shifts => attachedDatabase.shifts;
  ShiftsDaoManager get managers => ShiftsDaoManager(this);
}

class ShiftsDaoManager {
  final _$ShiftsDaoMixin _db;
  ShiftsDaoManager(this._db);
  $$ShiftsTableTableManager get shifts =>
      $$ShiftsTableTableManager(_db.attachedDatabase, _db.shifts);
}
