import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:scheduling_assistant/database/database.dart';

/// ---------------------------
/// Model（保持简单）
/// ---------------------------
class SettingsModel {
  final int? defaultTemplateId;
  final bool showLunar;
  final bool showSolarTerm;
  final bool showColor;
  final int notifyBeforeMinutes;

  SettingsModel({
    this.defaultTemplateId,
    required this.showLunar,
    required this.showSolarTerm,
    required this.showColor,
    required this.notifyBeforeMinutes,
  });

  SettingsModel copyWith({
    int? defaultTemplateId,
    bool? showLunar,
    bool? showSolarTerm,
    bool? showColor,
    int? notifyBeforeMinutes,
  }) {
    return SettingsModel(
      defaultTemplateId: defaultTemplateId ?? this.defaultTemplateId,
      showLunar: showLunar ?? this.showLunar,
      showSolarTerm: showSolarTerm ?? this.showSolarTerm,
      showColor: showColor ?? this.showColor,
      notifyBeforeMinutes: notifyBeforeMinutes ?? this.notifyBeforeMinutes,
    );
  }
}

/// ---------------------------
/// Provider
/// ---------------------------
final settingsProvider = AsyncNotifierProvider<SettingsNotifier, SettingsModel>(
  SettingsNotifier.new,
);

/// ---------------------------
/// Notifier
/// ---------------------------
class SettingsNotifier extends AsyncNotifier<SettingsModel> {
  final AppDatabase db = AppDatabase();

  /// 初始化加载（确保 id=1 存在）
  @override
  FutureOr<SettingsModel> build() async {
    final settings = await _ensureSettings();
    return SettingsModel(
      defaultTemplateId: settings.defaultTemplateId,
      showLunar: settings.showLunar,
      showSolarTerm: settings.showSolarTerm,
      showColor: settings.showColor,
      notifyBeforeMinutes: settings.notifyBeforeMinutes,
    );
  }

  /// ---------------------------
  /// 获取当前配置
  /// ---------------------------
  Future<Setting> _ensureSettings() async {
    return await db.settingsDao.getSettings();
  }

  /// ---------------------------
  /// 刷新
  /// ---------------------------
  Future<void> refresh() async {
    final settings = await db.settingsDao.getSettings();
    state = AsyncData(
      SettingsModel(
        defaultTemplateId: settings.defaultTemplateId,
        showLunar: settings.showLunar,
        showSolarTerm: settings.showSolarTerm,
        showColor: settings.showColor,
        notifyBeforeMinutes: settings.notifyBeforeMinutes,
      ),
    );
  }

  /// ---------------------------
  /// 更新（核心方法）
  /// ---------------------------
  Future<void> updateSettings({
    int? defaultTemplateId,
    bool? showLunar,
    bool? showSolarTerm,
    bool? showColor,
    int? notifyBeforeMinutes,
  }) async {
    await db.settingsDao.updateSettings(
      defaultTemplateId: defaultTemplateId,
      showLunar: showLunar,
      showSolarTerm: showSolarTerm,
      showColor: showColor,
      notifyBeforeMinutes: notifyBeforeMinutes,
    );
    final updated = state.value!.copyWith(
      defaultTemplateId: defaultTemplateId,
      showLunar: showLunar,
      showSolarTerm: showSolarTerm,
      showColor: showColor,
      notifyBeforeMinutes: notifyBeforeMinutes,
    );
    state = AsyncData(updated);
  }

  /// ---------------------------
  /// 快捷 toggle 方法（UI 很好用）
  /// ---------------------------
  Future<void> toggleLunar() async {
    await updateSettings(showLunar: !state.value!.showLunar);
  }

  Future<void> toggleSolarTerm() async {
    await updateSettings(showSolarTerm: !state.value!.showSolarTerm);
  }

  Future<void> toggleColor() async {
    await updateSettings(showColor: !state.value!.showColor);
  }

  /// ---------------------------
  /// 通知时间更新
  /// ---------------------------
  Future<void> setNotifyBeforeMinutes(int minutes) async {
    await updateSettings(notifyBeforeMinutes: minutes);
  }

  /// ---------------------------
  /// 模板设置
  /// ---------------------------
  Future<void> setDefaultTemplate(int? templateId) async {
    await updateSettings(defaultTemplateId: templateId);
  }
}
