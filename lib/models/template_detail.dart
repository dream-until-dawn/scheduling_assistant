import 'package:scheduling_assistant/database/database.dart' show Shift;

class TemplateDetail {
  const TemplateDetail({
    required this.templateId,
    required this.name,
    required this.remark,
    required this.days,
    this.anchor,
  });

  final int templateId;
  final String name;
  final String? remark;
  final List<TemplateDayDetail> days;
  final AnchorDetail? anchor;
}

class TemplateDayDetail {
  const TemplateDayDetail({required this.dayIndex, required this.shifts});

  final int dayIndex;
  final List<Shift> shifts;
}

class AnchorDetail {
  const AnchorDetail({required this.date, required this.cycleDay});

  final DateTime date;
  final int cycleDay;
}
