import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:scheduling_assistant/database/database.dart';
import 'package:scheduling_assistant/models/template_detail.dart';
// providers
import 'package:scheduling_assistant/providers/settings_provider.dart';

class CalendarModel {
  final TemplateDetail? curTemplateDetails;
  final List<ScheduleTemplate> templateList;
  final List<TemplateDetail> templateDetailList;

  CalendarModel({
    this.curTemplateDetails,
    required this.templateList,
    required this.templateDetailList,
  });

  CalendarModel copyWith({
    TemplateDetail? curTemplateDetails,
    List<ScheduleTemplate>? templateList,
    List<TemplateDetail>? templateDetailList,
  }) {
    return CalendarModel(
      curTemplateDetails: curTemplateDetails,
      templateList: templateList ?? this.templateList,
      templateDetailList: templateDetailList ?? this.templateDetailList,
    );
  }
}

/// ---------------------------
/// Provider
/// ---------------------------
final calendarProvider = AsyncNotifierProvider<CalendarNotifier, CalendarModel>(
  CalendarNotifier.new,
);

/// ---------------------------
/// Notifier
/// ---------------------------
class CalendarNotifier extends AsyncNotifier<CalendarModel> {
  final AppDatabase db = AppDatabase();

  /// 初始化加载
  @override
  FutureOr<CalendarModel> build() async {
    final settingAsync = await ref.watch(settingsProvider.future); // 确保设置加载完成
    final templateList = await db.scheduleTemplatesDao.getAllTemplates();
    var templateDetailList = <TemplateDetail>[]; // 模板详情列表
    for (final template in templateList) {
      final templateDetail = await db.scheduleTemplatesDao.getTemplateDetail(
        template.id,
      );
      if (templateDetail != null) {
        templateDetailList.add(templateDetail);
      }
    } // 获取模板详情
    final defaultTemplateId = settingAsync.defaultTemplateId;
    if (defaultTemplateId == null) {
      return CalendarModel(
        curTemplateDetails: null,
        templateList: templateList,
        templateDetailList: templateDetailList,
      );
    }
    return CalendarModel(
      curTemplateDetails: templateDetailList
          .where((detail) => detail.templateId == defaultTemplateId)
          .firstOrNull,
      templateList: templateList,
      templateDetailList: templateDetailList,
    );
  }

  // 刷新
  Future<void> refresh() async {
    final settingAsync = await ref.watch(settingsProvider.future); // 确保设置加载完成
    final templateList = await db.scheduleTemplatesDao.getAllTemplates();
    var templateDetailList = <TemplateDetail>[]; // 模板详情列表
    for (final template in templateList) {
      final templateDetail = await db.scheduleTemplatesDao.getTemplateDetail(
        template.id,
      );
      if (templateDetail != null) {
        templateDetailList.add(templateDetail);
      }
    } // 获取模板详情
    final defaultTemplateId = settingAsync.defaultTemplateId;
    if (defaultTemplateId == null) {
      state = AsyncData(
        state.value!.copyWith(
          curTemplateDetails: null,
          templateList: templateList,
          templateDetailList: templateDetailList,
        ),
      );
    } else {
      state = AsyncData(
        state.value!.copyWith(
          curTemplateDetails: templateDetailList
              .where((detail) => detail.templateId == defaultTemplateId)
              .firstOrNull,
          templateList: templateList,
          templateDetailList: templateDetailList,
        ),
      );
    }
  }

  /// 添加模板
  Future<bool> addTemplate(TemplateDetail templateDetail) async {
    try {
      await db.scheduleTemplatesDao.createTemplate(templateDetail);
      await refresh(); // 刷新
      return true;
    } catch (e) {
      return false;
    }
  }

  // 移除指定模板
  Future<bool> removeTemplate(int templateId) async {
    final settingAsync = await ref.watch(settingsProvider.future); // 确保设置加载完成
    await db.scheduleTemplatesDao.deleteScheduleTemplates(templateId);
    if (settingAsync.defaultTemplateId == templateId) {
      ref.read(settingsProvider.notifier).setDefaultTemplate(null);
    }
    await refresh(); // 刷新
    return true;
  }
}
