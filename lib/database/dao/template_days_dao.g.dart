// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_days_dao.dart';

// ignore_for_file: type=lint
mixin _$TemplateDaysDaoMixin on DatabaseAccessor<AppDatabase> {
  $ScheduleTemplatesTable get scheduleTemplates =>
      attachedDatabase.scheduleTemplates;
  $TemplateDaysTable get templateDays => attachedDatabase.templateDays;
  TemplateDaysDaoManager get managers => TemplateDaysDaoManager(this);
}

class TemplateDaysDaoManager {
  final _$TemplateDaysDaoMixin _db;
  TemplateDaysDaoManager(this._db);
  $$ScheduleTemplatesTableTableManager get scheduleTemplates =>
      $$ScheduleTemplatesTableTableManager(
        _db.attachedDatabase,
        _db.scheduleTemplates,
      );
  $$TemplateDaysTableTableManager get templateDays =>
      $$TemplateDaysTableTableManager(_db.attachedDatabase, _db.templateDays);
}
