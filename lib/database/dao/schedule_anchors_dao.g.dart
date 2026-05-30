// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_anchors_dao.dart';

// ignore_for_file: type=lint
mixin _$ScheduleAnchorsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ScheduleTemplatesTable get scheduleTemplates =>
      attachedDatabase.scheduleTemplates;
  $ScheduleAnchorsTable get scheduleAnchors => attachedDatabase.scheduleAnchors;
  ScheduleAnchorsDaoManager get managers => ScheduleAnchorsDaoManager(this);
}

class ScheduleAnchorsDaoManager {
  final _$ScheduleAnchorsDaoMixin _db;
  ScheduleAnchorsDaoManager(this._db);
  $$ScheduleTemplatesTableTableManager get scheduleTemplates =>
      $$ScheduleTemplatesTableTableManager(
        _db.attachedDatabase,
        _db.scheduleTemplates,
      );
  $$ScheduleAnchorsTableTableManager get scheduleAnchors =>
      $$ScheduleAnchorsTableTableManager(
        _db.attachedDatabase,
        _db.scheduleAnchors,
      );
}
