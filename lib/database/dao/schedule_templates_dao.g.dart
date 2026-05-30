// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_templates_dao.dart';

// ignore_for_file: type=lint
mixin _$ScheduleTemplatesDaoMixin on DatabaseAccessor<AppDatabase> {
  $ScheduleTemplatesTable get scheduleTemplates =>
      attachedDatabase.scheduleTemplates;
  $TemplateDaysTable get templateDays => attachedDatabase.templateDays;
  $ShiftsTable get shifts => attachedDatabase.shifts;
  $TemplateDayShiftsTable get templateDayShifts =>
      attachedDatabase.templateDayShifts;
  $ScheduleAnchorsTable get scheduleAnchors => attachedDatabase.scheduleAnchors;
  ScheduleTemplatesDaoManager get managers => ScheduleTemplatesDaoManager(this);
}

class ScheduleTemplatesDaoManager {
  final _$ScheduleTemplatesDaoMixin _db;
  ScheduleTemplatesDaoManager(this._db);
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
  $$ScheduleAnchorsTableTableManager get scheduleAnchors =>
      $$ScheduleAnchorsTableTableManager(
        _db.attachedDatabase,
        _db.scheduleAnchors,
      );
}
