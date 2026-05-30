import 'package:drift/drift.dart';

import 'package:scheduling_assistant/database/database.dart';
import 'package:scheduling_assistant/database/tables.dart';

part 'settings_dao.g.dart';

@DriftAccessor(tables: [Settings])
class SettingsDao extends DatabaseAccessor<AppDatabase>
    with _$SettingsDaoMixin {
  SettingsDao(super.db);

  // --- 查---
  Future<Setting> getSettings() {
    return select(settings).getSingle();
  }

  // --- 改 ---
  Future<void> updateSettings({
    int? defaultTemplateId,
    bool? showLunar,
    bool? showSolarTerm,
    bool? showColor,
    int? notifyBeforeMinutes,
  }) {
    return (update(settings)..where((t) => t.id.equals(1))).write(
      SettingsCompanion(
        defaultTemplateId: defaultTemplateId == null
            ? Value.absent()
            : Value(defaultTemplateId),
        showLunar: showLunar == null ? Value.absent() : Value(showLunar),
        showSolarTerm: showSolarTerm == null
            ? Value.absent()
            : Value(showSolarTerm),
        showColor: showColor == null ? Value.absent() : Value(showColor),
        notifyBeforeMinutes: notifyBeforeMinutes == null
            ? Value.absent()
            : Value(notifyBeforeMinutes),
      ),
    );
  }
}
