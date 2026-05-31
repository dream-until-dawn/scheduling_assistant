import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:scheduling_assistant/database/database.dart';
import 'package:scheduling_assistant/models/template_detail.dart';

class CalendarModel {
  final TemplateDetail? curTemplateDetails;
  final List<ScheduleTemplate> templateList;

  CalendarModel({this.curTemplateDetails, required this.templateList});

  CalendarModel copyWith({
    TemplateDetail? curTemplateDetails,
    List<ScheduleTemplate>? templateList,
  }) {
    return CalendarModel(
      curTemplateDetails: curTemplateDetails ?? this.curTemplateDetails,
      templateList: templateList ?? this.templateList,
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
    final templateList = await db.scheduleTemplatesDao.getAllTemplates();
    return CalendarModel(curTemplateDetails: null, templateList: templateList);
  }
}
