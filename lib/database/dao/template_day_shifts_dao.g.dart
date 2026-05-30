// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_day_shifts_dao.dart';

// ignore_for_file: type=lint
mixin _$TemplateDayShiftsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ScheduleTemplatesTable get scheduleTemplates =>
      attachedDatabase.scheduleTemplates;
  $TemplateDaysTable get templateDays => attachedDatabase.templateDays;
  $ShiftsTable get shifts => attachedDatabase.shifts;
  $TemplateDayShiftsTable get templateDayShifts =>
      attachedDatabase.templateDayShifts;
  TemplateDayShiftsDaoManager get managers => TemplateDayShiftsDaoManager(this);
}

class TemplateDayShiftsDaoManager {
  final _$TemplateDayShiftsDaoMixin _db;
  TemplateDayShiftsDaoManager(this._db);
  $$ScheduleTemplatesTableTableManager get scheduleTemplates =>
      $$ScheduleTemplatesTableTableManager(
        _db.attachedDatabase,
        _db.scheduleTemplates,
      );
  $$TemplateDaysTableTableManager get templateDays =>
      $$TemplateDaysTableTableManager(_db.attachedDatabase, _db.templateDays);
  $$ShiftsTableTableManager get shifts =>
      $$ShiftsTableTableManager(_db.attachedDatabase, _db.shifts);
  $$TemplateDayShiftsTableTableManager get templateDayShifts =>
      $$TemplateDayShiftsTableTableManager(
        _db.attachedDatabase,
        _db.templateDayShifts,
      );
}
