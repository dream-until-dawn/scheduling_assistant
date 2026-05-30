import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:scheduling_assistant/database/tables.dart';
// dao
import 'package:scheduling_assistant/database/dao/shifts_dao.dart';
import 'package:scheduling_assistant/database/dao/schedule_templates_dao.dart';
import 'package:scheduling_assistant/database/dao/template_days_dao.dart';
import 'package:scheduling_assistant/database/dao/template_day_shifts_dao.dart';
import 'package:scheduling_assistant/database/dao/schedule_anchors_dao.dart';
import 'package:scheduling_assistant/database/dao/settings_dao.dart';

part 'database.g.dart';

// build the database
// dart run build_runner build -d

@DriftDatabase(
  tables: [
    Shifts,
    ScheduleTemplates,
    TemplateDays,
    TemplateDayShifts,
    ScheduleAnchors,
    ScheduleOverrides,
    ScheduleOverrideShifts,
    Settings,
  ],
  daos: [
    ShiftsDao,
    ScheduleTemplatesDao,
    TemplateDaysDao,
    TemplateDayShiftsDao,
    ScheduleAnchorsDao,
    SettingsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await into(settings).insert(SettingsCompanion.insert());
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'schedule.db'));
    print('数据库连接路径: ${file.path}');
    return NativeDatabase(file);
  });
}
