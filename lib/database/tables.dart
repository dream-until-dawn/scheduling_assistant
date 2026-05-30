import 'package:drift/drift.dart';

// 排班表
class Shifts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get startMinute => integer()(); // 排班开始时间 0点开始的分钟数
  IntColumn get endMinute => integer()(); // 排班结束时间 0点开始的分钟数
  TextColumn get colorHex => text().nullable()();
  TextColumn get remark => text().nullable()();
}

// 排班模板表
class ScheduleTemplates extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get remark => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// 模板天表
class TemplateDays extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get templateId => integer().references(
    ScheduleTemplates,
    #id,
    onDelete: KeyAction.cascade,
  )(); // 模板ID
  IntColumn get dayIndex => integer()(); // 模板中的第几天，从0开始

  @override
  List<Set<Column>> get uniqueKeys => [
    {templateId, dayIndex},
  ];
}

// 模板天排班表
class TemplateDayShifts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get templateDayId => integer().references(
    TemplateDays,
    #id,
    onDelete: KeyAction.cascade,
  )(); // 模板天ID
  IntColumn get shiftId =>
      integer().references(Shifts, #id, onDelete: KeyAction.cascade)(); // 排班ID
}

// 锚点表
class ScheduleAnchors extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get templateId => integer().references(
    ScheduleTemplates,
    #id,
    onDelete: KeyAction.cascade,
  )(); // 模板ID
  DateTimeColumn get anchorDate => dateTime()(); // 锚点日期
  IntColumn get cycleDay => integer()(); // 锚点所在模板中的第几天，从0开始
  BoolColumn get active =>
      boolean().withDefault(const Constant(true))(); // 是否激活
}

// 排班覆盖表
enum OverrideType { replace, add, remove }

class ScheduleOverrides extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()(); // 覆盖日期
  IntColumn get type => integer()(); // 覆盖类型，replace: 替换，add: 添加，remove: 移除
  TextColumn get remark => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// 覆盖排班表
class ScheduleOverrideShifts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get overrideId => integer().references(
    ScheduleOverrides,
    #id,
    onDelete: KeyAction.cascade,
  )(); // 覆盖ID
  IntColumn get shiftId =>
      integer().references(Shifts, #id, onDelete: KeyAction.cascade)(); // 排班ID
}

// 应用设置表
class Settings extends Table {
  IntColumn get id => integer().clientDefault(() => 1)();
  IntColumn get defaultTemplateId => integer().nullable()(); // 默认模板ID
  BoolColumn get showLunar =>
      boolean().withDefault(const Constant(true))(); // 是否显示农历
  BoolColumn get showSolarTerm =>
      boolean().withDefault(const Constant(true))(); // 是否显示节气
  BoolColumn get showColor =>
      boolean().withDefault(const Constant(true))(); // 是否显示颜色
  IntColumn get notifyBeforeMinutes =>
      integer().withDefault(const Constant(30))(); // 通知前分钟数
  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => ['CHECK(id = 1)'];
}
