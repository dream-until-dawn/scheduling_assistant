// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ShiftsTable extends Shifts with TableInfo<$ShiftsTable, Shift> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShiftsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startMinuteMeta = const VerificationMeta(
    'startMinute',
  );
  @override
  late final GeneratedColumn<int> startMinute = GeneratedColumn<int>(
    'start_minute',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endMinuteMeta = const VerificationMeta(
    'endMinute',
  );
  @override
  late final GeneratedColumn<int> endMinute = GeneratedColumn<int>(
    'end_minute',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorHexMeta = const VerificationMeta(
    'colorHex',
  );
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
    'color_hex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    startMinute,
    endMinute,
    colorHex,
    remark,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shifts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Shift> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('start_minute')) {
      context.handle(
        _startMinuteMeta,
        startMinute.isAcceptableOrUnknown(
          data['start_minute']!,
          _startMinuteMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_startMinuteMeta);
    }
    if (data.containsKey('end_minute')) {
      context.handle(
        _endMinuteMeta,
        endMinute.isAcceptableOrUnknown(data['end_minute']!, _endMinuteMeta),
      );
    } else if (isInserting) {
      context.missing(_endMinuteMeta);
    }
    if (data.containsKey('color_hex')) {
      context.handle(
        _colorHexMeta,
        colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Shift map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Shift(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      startMinute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_minute'],
      )!,
      endMinute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_minute'],
      )!,
      colorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_hex'],
      ),
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
    );
  }

  @override
  $ShiftsTable createAlias(String alias) {
    return $ShiftsTable(attachedDatabase, alias);
  }
}

class Shift extends DataClass implements Insertable<Shift> {
  final int id;
  final String name;
  final int startMinute;
  final int endMinute;
  final String? colorHex;
  final String? remark;
  const Shift({
    required this.id,
    required this.name,
    required this.startMinute,
    required this.endMinute,
    this.colorHex,
    this.remark,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['start_minute'] = Variable<int>(startMinute);
    map['end_minute'] = Variable<int>(endMinute);
    if (!nullToAbsent || colorHex != null) {
      map['color_hex'] = Variable<String>(colorHex);
    }
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    return map;
  }

  ShiftsCompanion toCompanion(bool nullToAbsent) {
    return ShiftsCompanion(
      id: Value(id),
      name: Value(name),
      startMinute: Value(startMinute),
      endMinute: Value(endMinute),
      colorHex: colorHex == null && nullToAbsent
          ? const Value.absent()
          : Value(colorHex),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
    );
  }

  factory Shift.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Shift(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      startMinute: serializer.fromJson<int>(json['startMinute']),
      endMinute: serializer.fromJson<int>(json['endMinute']),
      colorHex: serializer.fromJson<String?>(json['colorHex']),
      remark: serializer.fromJson<String?>(json['remark']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'startMinute': serializer.toJson<int>(startMinute),
      'endMinute': serializer.toJson<int>(endMinute),
      'colorHex': serializer.toJson<String?>(colorHex),
      'remark': serializer.toJson<String?>(remark),
    };
  }

  Shift copyWith({
    int? id,
    String? name,
    int? startMinute,
    int? endMinute,
    Value<String?> colorHex = const Value.absent(),
    Value<String?> remark = const Value.absent(),
  }) => Shift(
    id: id ?? this.id,
    name: name ?? this.name,
    startMinute: startMinute ?? this.startMinute,
    endMinute: endMinute ?? this.endMinute,
    colorHex: colorHex.present ? colorHex.value : this.colorHex,
    remark: remark.present ? remark.value : this.remark,
  );
  Shift copyWithCompanion(ShiftsCompanion data) {
    return Shift(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      startMinute: data.startMinute.present
          ? data.startMinute.value
          : this.startMinute,
      endMinute: data.endMinute.present ? data.endMinute.value : this.endMinute,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      remark: data.remark.present ? data.remark.value : this.remark,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Shift(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('startMinute: $startMinute, ')
          ..write('endMinute: $endMinute, ')
          ..write('colorHex: $colorHex, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, startMinute, endMinute, colorHex, remark);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shift &&
          other.id == this.id &&
          other.name == this.name &&
          other.startMinute == this.startMinute &&
          other.endMinute == this.endMinute &&
          other.colorHex == this.colorHex &&
          other.remark == this.remark);
}

class ShiftsCompanion extends UpdateCompanion<Shift> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> startMinute;
  final Value<int> endMinute;
  final Value<String?> colorHex;
  final Value<String?> remark;
  const ShiftsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.startMinute = const Value.absent(),
    this.endMinute = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.remark = const Value.absent(),
  });
  ShiftsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int startMinute,
    required int endMinute,
    this.colorHex = const Value.absent(),
    this.remark = const Value.absent(),
  }) : name = Value(name),
       startMinute = Value(startMinute),
       endMinute = Value(endMinute);
  static Insertable<Shift> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? startMinute,
    Expression<int>? endMinute,
    Expression<String>? colorHex,
    Expression<String>? remark,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (startMinute != null) 'start_minute': startMinute,
      if (endMinute != null) 'end_minute': endMinute,
      if (colorHex != null) 'color_hex': colorHex,
      if (remark != null) 'remark': remark,
    });
  }

  ShiftsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? startMinute,
    Value<int>? endMinute,
    Value<String?>? colorHex,
    Value<String?>? remark,
  }) {
    return ShiftsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      startMinute: startMinute ?? this.startMinute,
      endMinute: endMinute ?? this.endMinute,
      colorHex: colorHex ?? this.colorHex,
      remark: remark ?? this.remark,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (startMinute.present) {
      map['start_minute'] = Variable<int>(startMinute.value);
    }
    if (endMinute.present) {
      map['end_minute'] = Variable<int>(endMinute.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShiftsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('startMinute: $startMinute, ')
          ..write('endMinute: $endMinute, ')
          ..write('colorHex: $colorHex, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }
}

class $ScheduleTemplatesTable extends ScheduleTemplates
    with TableInfo<$ScheduleTemplatesTable, ScheduleTemplate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduleTemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, remark, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedule_templates';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScheduleTemplate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduleTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduleTemplate(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ScheduleTemplatesTable createAlias(String alias) {
    return $ScheduleTemplatesTable(attachedDatabase, alias);
  }
}

class ScheduleTemplate extends DataClass
    implements Insertable<ScheduleTemplate> {
  final int id;
  final String name;
  final String? remark;
  final DateTime createdAt;
  const ScheduleTemplate({
    required this.id,
    required this.name,
    this.remark,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ScheduleTemplatesCompanion toCompanion(bool nullToAbsent) {
    return ScheduleTemplatesCompanion(
      id: Value(id),
      name: Value(name),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      createdAt: Value(createdAt),
    );
  }

  factory ScheduleTemplate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduleTemplate(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      remark: serializer.fromJson<String?>(json['remark']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'remark': serializer.toJson<String?>(remark),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ScheduleTemplate copyWith({
    int? id,
    String? name,
    Value<String?> remark = const Value.absent(),
    DateTime? createdAt,
  }) => ScheduleTemplate(
    id: id ?? this.id,
    name: name ?? this.name,
    remark: remark.present ? remark.value : this.remark,
    createdAt: createdAt ?? this.createdAt,
  );
  ScheduleTemplate copyWithCompanion(ScheduleTemplatesCompanion data) {
    return ScheduleTemplate(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      remark: data.remark.present ? data.remark.value : this.remark,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleTemplate(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('remark: $remark, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, remark, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleTemplate &&
          other.id == this.id &&
          other.name == this.name &&
          other.remark == this.remark &&
          other.createdAt == this.createdAt);
}

class ScheduleTemplatesCompanion extends UpdateCompanion<ScheduleTemplate> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> remark;
  final Value<DateTime> createdAt;
  const ScheduleTemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.remark = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ScheduleTemplatesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.remark = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<ScheduleTemplate> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? remark,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (remark != null) 'remark': remark,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ScheduleTemplatesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? remark,
    Value<DateTime>? createdAt,
  }) {
    return ScheduleTemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      remark: remark ?? this.remark,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('remark: $remark, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TemplateDaysTable extends TemplateDays
    with TableInfo<$TemplateDaysTable, TemplateDay> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TemplateDaysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _templateIdMeta = const VerificationMeta(
    'templateId',
  );
  @override
  late final GeneratedColumn<int> templateId = GeneratedColumn<int>(
    'template_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES schedule_templates (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dayIndexMeta = const VerificationMeta(
    'dayIndex',
  );
  @override
  late final GeneratedColumn<int> dayIndex = GeneratedColumn<int>(
    'day_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, templateId, dayIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'template_days';
  @override
  VerificationContext validateIntegrity(
    Insertable<TemplateDay> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('template_id')) {
      context.handle(
        _templateIdMeta,
        templateId.isAcceptableOrUnknown(data['template_id']!, _templateIdMeta),
      );
    } else if (isInserting) {
      context.missing(_templateIdMeta);
    }
    if (data.containsKey('day_index')) {
      context.handle(
        _dayIndexMeta,
        dayIndex.isAcceptableOrUnknown(data['day_index']!, _dayIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_dayIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {templateId, dayIndex},
  ];
  @override
  TemplateDay map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TemplateDay(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      templateId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}template_id'],
      )!,
      dayIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_index'],
      )!,
    );
  }

  @override
  $TemplateDaysTable createAlias(String alias) {
    return $TemplateDaysTable(attachedDatabase, alias);
  }
}

class TemplateDay extends DataClass implements Insertable<TemplateDay> {
  final int id;
  final int templateId;
  final int dayIndex;
  const TemplateDay({
    required this.id,
    required this.templateId,
    required this.dayIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['template_id'] = Variable<int>(templateId);
    map['day_index'] = Variable<int>(dayIndex);
    return map;
  }

  TemplateDaysCompanion toCompanion(bool nullToAbsent) {
    return TemplateDaysCompanion(
      id: Value(id),
      templateId: Value(templateId),
      dayIndex: Value(dayIndex),
    );
  }

  factory TemplateDay.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TemplateDay(
      id: serializer.fromJson<int>(json['id']),
      templateId: serializer.fromJson<int>(json['templateId']),
      dayIndex: serializer.fromJson<int>(json['dayIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'templateId': serializer.toJson<int>(templateId),
      'dayIndex': serializer.toJson<int>(dayIndex),
    };
  }

  TemplateDay copyWith({int? id, int? templateId, int? dayIndex}) =>
      TemplateDay(
        id: id ?? this.id,
        templateId: templateId ?? this.templateId,
        dayIndex: dayIndex ?? this.dayIndex,
      );
  TemplateDay copyWithCompanion(TemplateDaysCompanion data) {
    return TemplateDay(
      id: data.id.present ? data.id.value : this.id,
      templateId: data.templateId.present
          ? data.templateId.value
          : this.templateId,
      dayIndex: data.dayIndex.present ? data.dayIndex.value : this.dayIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TemplateDay(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('dayIndex: $dayIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, templateId, dayIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TemplateDay &&
          other.id == this.id &&
          other.templateId == this.templateId &&
          other.dayIndex == this.dayIndex);
}

class TemplateDaysCompanion extends UpdateCompanion<TemplateDay> {
  final Value<int> id;
  final Value<int> templateId;
  final Value<int> dayIndex;
  const TemplateDaysCompanion({
    this.id = const Value.absent(),
    this.templateId = const Value.absent(),
    this.dayIndex = const Value.absent(),
  });
  TemplateDaysCompanion.insert({
    this.id = const Value.absent(),
    required int templateId,
    required int dayIndex,
  }) : templateId = Value(templateId),
       dayIndex = Value(dayIndex);
  static Insertable<TemplateDay> custom({
    Expression<int>? id,
    Expression<int>? templateId,
    Expression<int>? dayIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (templateId != null) 'template_id': templateId,
      if (dayIndex != null) 'day_index': dayIndex,
    });
  }

  TemplateDaysCompanion copyWith({
    Value<int>? id,
    Value<int>? templateId,
    Value<int>? dayIndex,
  }) {
    return TemplateDaysCompanion(
      id: id ?? this.id,
      templateId: templateId ?? this.templateId,
      dayIndex: dayIndex ?? this.dayIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<int>(templateId.value);
    }
    if (dayIndex.present) {
      map['day_index'] = Variable<int>(dayIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemplateDaysCompanion(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('dayIndex: $dayIndex')
          ..write(')'))
        .toString();
  }
}

class $TemplateDayShiftsTable extends TemplateDayShifts
    with TableInfo<$TemplateDayShiftsTable, TemplateDayShift> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TemplateDayShiftsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _templateDayIdMeta = const VerificationMeta(
    'templateDayId',
  );
  @override
  late final GeneratedColumn<int> templateDayId = GeneratedColumn<int>(
    'template_day_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES template_days (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _shiftIdMeta = const VerificationMeta(
    'shiftId',
  );
  @override
  late final GeneratedColumn<int> shiftId = GeneratedColumn<int>(
    'shift_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shifts (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, templateDayId, shiftId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'template_day_shifts';
  @override
  VerificationContext validateIntegrity(
    Insertable<TemplateDayShift> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('template_day_id')) {
      context.handle(
        _templateDayIdMeta,
        templateDayId.isAcceptableOrUnknown(
          data['template_day_id']!,
          _templateDayIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_templateDayIdMeta);
    }
    if (data.containsKey('shift_id')) {
      context.handle(
        _shiftIdMeta,
        shiftId.isAcceptableOrUnknown(data['shift_id']!, _shiftIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shiftIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TemplateDayShift map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TemplateDayShift(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      templateDayId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}template_day_id'],
      )!,
      shiftId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shift_id'],
      )!,
    );
  }

  @override
  $TemplateDayShiftsTable createAlias(String alias) {
    return $TemplateDayShiftsTable(attachedDatabase, alias);
  }
}

class TemplateDayShift extends DataClass
    implements Insertable<TemplateDayShift> {
  final int id;
  final int templateDayId;
  final int shiftId;
  const TemplateDayShift({
    required this.id,
    required this.templateDayId,
    required this.shiftId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['template_day_id'] = Variable<int>(templateDayId);
    map['shift_id'] = Variable<int>(shiftId);
    return map;
  }

  TemplateDayShiftsCompanion toCompanion(bool nullToAbsent) {
    return TemplateDayShiftsCompanion(
      id: Value(id),
      templateDayId: Value(templateDayId),
      shiftId: Value(shiftId),
    );
  }

  factory TemplateDayShift.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TemplateDayShift(
      id: serializer.fromJson<int>(json['id']),
      templateDayId: serializer.fromJson<int>(json['templateDayId']),
      shiftId: serializer.fromJson<int>(json['shiftId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'templateDayId': serializer.toJson<int>(templateDayId),
      'shiftId': serializer.toJson<int>(shiftId),
    };
  }

  TemplateDayShift copyWith({int? id, int? templateDayId, int? shiftId}) =>
      TemplateDayShift(
        id: id ?? this.id,
        templateDayId: templateDayId ?? this.templateDayId,
        shiftId: shiftId ?? this.shiftId,
      );
  TemplateDayShift copyWithCompanion(TemplateDayShiftsCompanion data) {
    return TemplateDayShift(
      id: data.id.present ? data.id.value : this.id,
      templateDayId: data.templateDayId.present
          ? data.templateDayId.value
          : this.templateDayId,
      shiftId: data.shiftId.present ? data.shiftId.value : this.shiftId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TemplateDayShift(')
          ..write('id: $id, ')
          ..write('templateDayId: $templateDayId, ')
          ..write('shiftId: $shiftId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, templateDayId, shiftId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TemplateDayShift &&
          other.id == this.id &&
          other.templateDayId == this.templateDayId &&
          other.shiftId == this.shiftId);
}

class TemplateDayShiftsCompanion extends UpdateCompanion<TemplateDayShift> {
  final Value<int> id;
  final Value<int> templateDayId;
  final Value<int> shiftId;
  const TemplateDayShiftsCompanion({
    this.id = const Value.absent(),
    this.templateDayId = const Value.absent(),
    this.shiftId = const Value.absent(),
  });
  TemplateDayShiftsCompanion.insert({
    this.id = const Value.absent(),
    required int templateDayId,
    required int shiftId,
  }) : templateDayId = Value(templateDayId),
       shiftId = Value(shiftId);
  static Insertable<TemplateDayShift> custom({
    Expression<int>? id,
    Expression<int>? templateDayId,
    Expression<int>? shiftId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (templateDayId != null) 'template_day_id': templateDayId,
      if (shiftId != null) 'shift_id': shiftId,
    });
  }

  TemplateDayShiftsCompanion copyWith({
    Value<int>? id,
    Value<int>? templateDayId,
    Value<int>? shiftId,
  }) {
    return TemplateDayShiftsCompanion(
      id: id ?? this.id,
      templateDayId: templateDayId ?? this.templateDayId,
      shiftId: shiftId ?? this.shiftId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (templateDayId.present) {
      map['template_day_id'] = Variable<int>(templateDayId.value);
    }
    if (shiftId.present) {
      map['shift_id'] = Variable<int>(shiftId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemplateDayShiftsCompanion(')
          ..write('id: $id, ')
          ..write('templateDayId: $templateDayId, ')
          ..write('shiftId: $shiftId')
          ..write(')'))
        .toString();
  }
}

class $ScheduleAnchorsTable extends ScheduleAnchors
    with TableInfo<$ScheduleAnchorsTable, ScheduleAnchor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduleAnchorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _templateIdMeta = const VerificationMeta(
    'templateId',
  );
  @override
  late final GeneratedColumn<int> templateId = GeneratedColumn<int>(
    'template_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES schedule_templates (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _anchorDateMeta = const VerificationMeta(
    'anchorDate',
  );
  @override
  late final GeneratedColumn<DateTime> anchorDate = GeneratedColumn<DateTime>(
    'anchor_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cycleDayMeta = const VerificationMeta(
    'cycleDay',
  );
  @override
  late final GeneratedColumn<int> cycleDay = GeneratedColumn<int>(
    'cycle_day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    templateId,
    anchorDate,
    cycleDay,
    active,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedule_anchors';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScheduleAnchor> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('template_id')) {
      context.handle(
        _templateIdMeta,
        templateId.isAcceptableOrUnknown(data['template_id']!, _templateIdMeta),
      );
    } else if (isInserting) {
      context.missing(_templateIdMeta);
    }
    if (data.containsKey('anchor_date')) {
      context.handle(
        _anchorDateMeta,
        anchorDate.isAcceptableOrUnknown(data['anchor_date']!, _anchorDateMeta),
      );
    } else if (isInserting) {
      context.missing(_anchorDateMeta);
    }
    if (data.containsKey('cycle_day')) {
      context.handle(
        _cycleDayMeta,
        cycleDay.isAcceptableOrUnknown(data['cycle_day']!, _cycleDayMeta),
      );
    } else if (isInserting) {
      context.missing(_cycleDayMeta);
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduleAnchor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduleAnchor(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      templateId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}template_id'],
      )!,
      anchorDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}anchor_date'],
      )!,
      cycleDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cycle_day'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
    );
  }

  @override
  $ScheduleAnchorsTable createAlias(String alias) {
    return $ScheduleAnchorsTable(attachedDatabase, alias);
  }
}

class ScheduleAnchor extends DataClass implements Insertable<ScheduleAnchor> {
  final int id;
  final int templateId;
  final DateTime anchorDate;
  final int cycleDay;
  final bool active;
  const ScheduleAnchor({
    required this.id,
    required this.templateId,
    required this.anchorDate,
    required this.cycleDay,
    required this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['template_id'] = Variable<int>(templateId);
    map['anchor_date'] = Variable<DateTime>(anchorDate);
    map['cycle_day'] = Variable<int>(cycleDay);
    map['active'] = Variable<bool>(active);
    return map;
  }

  ScheduleAnchorsCompanion toCompanion(bool nullToAbsent) {
    return ScheduleAnchorsCompanion(
      id: Value(id),
      templateId: Value(templateId),
      anchorDate: Value(anchorDate),
      cycleDay: Value(cycleDay),
      active: Value(active),
    );
  }

  factory ScheduleAnchor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduleAnchor(
      id: serializer.fromJson<int>(json['id']),
      templateId: serializer.fromJson<int>(json['templateId']),
      anchorDate: serializer.fromJson<DateTime>(json['anchorDate']),
      cycleDay: serializer.fromJson<int>(json['cycleDay']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'templateId': serializer.toJson<int>(templateId),
      'anchorDate': serializer.toJson<DateTime>(anchorDate),
      'cycleDay': serializer.toJson<int>(cycleDay),
      'active': serializer.toJson<bool>(active),
    };
  }

  ScheduleAnchor copyWith({
    int? id,
    int? templateId,
    DateTime? anchorDate,
    int? cycleDay,
    bool? active,
  }) => ScheduleAnchor(
    id: id ?? this.id,
    templateId: templateId ?? this.templateId,
    anchorDate: anchorDate ?? this.anchorDate,
    cycleDay: cycleDay ?? this.cycleDay,
    active: active ?? this.active,
  );
  ScheduleAnchor copyWithCompanion(ScheduleAnchorsCompanion data) {
    return ScheduleAnchor(
      id: data.id.present ? data.id.value : this.id,
      templateId: data.templateId.present
          ? data.templateId.value
          : this.templateId,
      anchorDate: data.anchorDate.present
          ? data.anchorDate.value
          : this.anchorDate,
      cycleDay: data.cycleDay.present ? data.cycleDay.value : this.cycleDay,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleAnchor(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('anchorDate: $anchorDate, ')
          ..write('cycleDay: $cycleDay, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, templateId, anchorDate, cycleDay, active);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleAnchor &&
          other.id == this.id &&
          other.templateId == this.templateId &&
          other.anchorDate == this.anchorDate &&
          other.cycleDay == this.cycleDay &&
          other.active == this.active);
}

class ScheduleAnchorsCompanion extends UpdateCompanion<ScheduleAnchor> {
  final Value<int> id;
  final Value<int> templateId;
  final Value<DateTime> anchorDate;
  final Value<int> cycleDay;
  final Value<bool> active;
  const ScheduleAnchorsCompanion({
    this.id = const Value.absent(),
    this.templateId = const Value.absent(),
    this.anchorDate = const Value.absent(),
    this.cycleDay = const Value.absent(),
    this.active = const Value.absent(),
  });
  ScheduleAnchorsCompanion.insert({
    this.id = const Value.absent(),
    required int templateId,
    required DateTime anchorDate,
    required int cycleDay,
    this.active = const Value.absent(),
  }) : templateId = Value(templateId),
       anchorDate = Value(anchorDate),
       cycleDay = Value(cycleDay);
  static Insertable<ScheduleAnchor> custom({
    Expression<int>? id,
    Expression<int>? templateId,
    Expression<DateTime>? anchorDate,
    Expression<int>? cycleDay,
    Expression<bool>? active,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (templateId != null) 'template_id': templateId,
      if (anchorDate != null) 'anchor_date': anchorDate,
      if (cycleDay != null) 'cycle_day': cycleDay,
      if (active != null) 'active': active,
    });
  }

  ScheduleAnchorsCompanion copyWith({
    Value<int>? id,
    Value<int>? templateId,
    Value<DateTime>? anchorDate,
    Value<int>? cycleDay,
    Value<bool>? active,
  }) {
    return ScheduleAnchorsCompanion(
      id: id ?? this.id,
      templateId: templateId ?? this.templateId,
      anchorDate: anchorDate ?? this.anchorDate,
      cycleDay: cycleDay ?? this.cycleDay,
      active: active ?? this.active,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<int>(templateId.value);
    }
    if (anchorDate.present) {
      map['anchor_date'] = Variable<DateTime>(anchorDate.value);
    }
    if (cycleDay.present) {
      map['cycle_day'] = Variable<int>(cycleDay.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleAnchorsCompanion(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('anchorDate: $anchorDate, ')
          ..write('cycleDay: $cycleDay, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }
}

class $ScheduleOverridesTable extends ScheduleOverrides
    with TableInfo<$ScheduleOverridesTable, ScheduleOverride> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduleOverridesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, type, remark, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedule_overrides';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScheduleOverride> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduleOverride map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduleOverride(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}type'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ScheduleOverridesTable createAlias(String alias) {
    return $ScheduleOverridesTable(attachedDatabase, alias);
  }
}

class ScheduleOverride extends DataClass
    implements Insertable<ScheduleOverride> {
  final int id;
  final DateTime date;
  final int type;
  final String? remark;
  final DateTime createdAt;
  const ScheduleOverride({
    required this.id,
    required this.date,
    required this.type,
    this.remark,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['type'] = Variable<int>(type);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ScheduleOverridesCompanion toCompanion(bool nullToAbsent) {
    return ScheduleOverridesCompanion(
      id: Value(id),
      date: Value(date),
      type: Value(type),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      createdAt: Value(createdAt),
    );
  }

  factory ScheduleOverride.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduleOverride(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      type: serializer.fromJson<int>(json['type']),
      remark: serializer.fromJson<String?>(json['remark']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'type': serializer.toJson<int>(type),
      'remark': serializer.toJson<String?>(remark),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ScheduleOverride copyWith({
    int? id,
    DateTime? date,
    int? type,
    Value<String?> remark = const Value.absent(),
    DateTime? createdAt,
  }) => ScheduleOverride(
    id: id ?? this.id,
    date: date ?? this.date,
    type: type ?? this.type,
    remark: remark.present ? remark.value : this.remark,
    createdAt: createdAt ?? this.createdAt,
  );
  ScheduleOverride copyWithCompanion(ScheduleOverridesCompanion data) {
    return ScheduleOverride(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      type: data.type.present ? data.type.value : this.type,
      remark: data.remark.present ? data.remark.value : this.remark,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleOverride(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('remark: $remark, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, type, remark, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleOverride &&
          other.id == this.id &&
          other.date == this.date &&
          other.type == this.type &&
          other.remark == this.remark &&
          other.createdAt == this.createdAt);
}

class ScheduleOverridesCompanion extends UpdateCompanion<ScheduleOverride> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> type;
  final Value<String?> remark;
  final Value<DateTime> createdAt;
  const ScheduleOverridesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
    this.remark = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ScheduleOverridesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required int type,
    this.remark = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : date = Value(date),
       type = Value(type);
  static Insertable<ScheduleOverride> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? type,
    Expression<String>? remark,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (type != null) 'type': type,
      if (remark != null) 'remark': remark,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ScheduleOverridesCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<int>? type,
    Value<String?>? remark,
    Value<DateTime>? createdAt,
  }) {
    return ScheduleOverridesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      type: type ?? this.type,
      remark: remark ?? this.remark,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleOverridesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('remark: $remark, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ScheduleOverrideShiftsTable extends ScheduleOverrideShifts
    with TableInfo<$ScheduleOverrideShiftsTable, ScheduleOverrideShift> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduleOverrideShiftsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _overrideIdMeta = const VerificationMeta(
    'overrideId',
  );
  @override
  late final GeneratedColumn<int> overrideId = GeneratedColumn<int>(
    'override_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES schedule_overrides (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _shiftIdMeta = const VerificationMeta(
    'shiftId',
  );
  @override
  late final GeneratedColumn<int> shiftId = GeneratedColumn<int>(
    'shift_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shifts (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, overrideId, shiftId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedule_override_shifts';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScheduleOverrideShift> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('override_id')) {
      context.handle(
        _overrideIdMeta,
        overrideId.isAcceptableOrUnknown(data['override_id']!, _overrideIdMeta),
      );
    } else if (isInserting) {
      context.missing(_overrideIdMeta);
    }
    if (data.containsKey('shift_id')) {
      context.handle(
        _shiftIdMeta,
        shiftId.isAcceptableOrUnknown(data['shift_id']!, _shiftIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shiftIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduleOverrideShift map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduleOverrideShift(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      overrideId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}override_id'],
      )!,
      shiftId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shift_id'],
      )!,
    );
  }

  @override
  $ScheduleOverrideShiftsTable createAlias(String alias) {
    return $ScheduleOverrideShiftsTable(attachedDatabase, alias);
  }
}

class ScheduleOverrideShift extends DataClass
    implements Insertable<ScheduleOverrideShift> {
  final int id;
  final int overrideId;
  final int shiftId;
  const ScheduleOverrideShift({
    required this.id,
    required this.overrideId,
    required this.shiftId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['override_id'] = Variable<int>(overrideId);
    map['shift_id'] = Variable<int>(shiftId);
    return map;
  }

  ScheduleOverrideShiftsCompanion toCompanion(bool nullToAbsent) {
    return ScheduleOverrideShiftsCompanion(
      id: Value(id),
      overrideId: Value(overrideId),
      shiftId: Value(shiftId),
    );
  }

  factory ScheduleOverrideShift.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduleOverrideShift(
      id: serializer.fromJson<int>(json['id']),
      overrideId: serializer.fromJson<int>(json['overrideId']),
      shiftId: serializer.fromJson<int>(json['shiftId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'overrideId': serializer.toJson<int>(overrideId),
      'shiftId': serializer.toJson<int>(shiftId),
    };
  }

  ScheduleOverrideShift copyWith({int? id, int? overrideId, int? shiftId}) =>
      ScheduleOverrideShift(
        id: id ?? this.id,
        overrideId: overrideId ?? this.overrideId,
        shiftId: shiftId ?? this.shiftId,
      );
  ScheduleOverrideShift copyWithCompanion(
    ScheduleOverrideShiftsCompanion data,
  ) {
    return ScheduleOverrideShift(
      id: data.id.present ? data.id.value : this.id,
      overrideId: data.overrideId.present
          ? data.overrideId.value
          : this.overrideId,
      shiftId: data.shiftId.present ? data.shiftId.value : this.shiftId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleOverrideShift(')
          ..write('id: $id, ')
          ..write('overrideId: $overrideId, ')
          ..write('shiftId: $shiftId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, overrideId, shiftId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleOverrideShift &&
          other.id == this.id &&
          other.overrideId == this.overrideId &&
          other.shiftId == this.shiftId);
}

class ScheduleOverrideShiftsCompanion
    extends UpdateCompanion<ScheduleOverrideShift> {
  final Value<int> id;
  final Value<int> overrideId;
  final Value<int> shiftId;
  const ScheduleOverrideShiftsCompanion({
    this.id = const Value.absent(),
    this.overrideId = const Value.absent(),
    this.shiftId = const Value.absent(),
  });
  ScheduleOverrideShiftsCompanion.insert({
    this.id = const Value.absent(),
    required int overrideId,
    required int shiftId,
  }) : overrideId = Value(overrideId),
       shiftId = Value(shiftId);
  static Insertable<ScheduleOverrideShift> custom({
    Expression<int>? id,
    Expression<int>? overrideId,
    Expression<int>? shiftId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (overrideId != null) 'override_id': overrideId,
      if (shiftId != null) 'shift_id': shiftId,
    });
  }

  ScheduleOverrideShiftsCompanion copyWith({
    Value<int>? id,
    Value<int>? overrideId,
    Value<int>? shiftId,
  }) {
    return ScheduleOverrideShiftsCompanion(
      id: id ?? this.id,
      overrideId: overrideId ?? this.overrideId,
      shiftId: shiftId ?? this.shiftId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (overrideId.present) {
      map['override_id'] = Variable<int>(overrideId.value);
    }
    if (shiftId.present) {
      map['shift_id'] = Variable<int>(shiftId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleOverrideShiftsCompanion(')
          ..write('id: $id, ')
          ..write('overrideId: $overrideId, ')
          ..write('shiftId: $shiftId')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 1,
  );
  static const VerificationMeta _defaultTemplateIdMeta = const VerificationMeta(
    'defaultTemplateId',
  );
  @override
  late final GeneratedColumn<int> defaultTemplateId = GeneratedColumn<int>(
    'default_template_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _showLunarMeta = const VerificationMeta(
    'showLunar',
  );
  @override
  late final GeneratedColumn<bool> showLunar = GeneratedColumn<bool>(
    'show_lunar',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("show_lunar" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _showSolarTermMeta = const VerificationMeta(
    'showSolarTerm',
  );
  @override
  late final GeneratedColumn<bool> showSolarTerm = GeneratedColumn<bool>(
    'show_solar_term',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("show_solar_term" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _showColorMeta = const VerificationMeta(
    'showColor',
  );
  @override
  late final GeneratedColumn<bool> showColor = GeneratedColumn<bool>(
    'show_color',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("show_color" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _notifyBeforeMinutesMeta =
      const VerificationMeta('notifyBeforeMinutes');
  @override
  late final GeneratedColumn<int> notifyBeforeMinutes = GeneratedColumn<int>(
    'notify_before_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(30),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    defaultTemplateId,
    showLunar,
    showSolarTerm,
    showColor,
    notifyBeforeMinutes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Setting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('default_template_id')) {
      context.handle(
        _defaultTemplateIdMeta,
        defaultTemplateId.isAcceptableOrUnknown(
          data['default_template_id']!,
          _defaultTemplateIdMeta,
        ),
      );
    }
    if (data.containsKey('show_lunar')) {
      context.handle(
        _showLunarMeta,
        showLunar.isAcceptableOrUnknown(data['show_lunar']!, _showLunarMeta),
      );
    }
    if (data.containsKey('show_solar_term')) {
      context.handle(
        _showSolarTermMeta,
        showSolarTerm.isAcceptableOrUnknown(
          data['show_solar_term']!,
          _showSolarTermMeta,
        ),
      );
    }
    if (data.containsKey('show_color')) {
      context.handle(
        _showColorMeta,
        showColor.isAcceptableOrUnknown(data['show_color']!, _showColorMeta),
      );
    }
    if (data.containsKey('notify_before_minutes')) {
      context.handle(
        _notifyBeforeMinutesMeta,
        notifyBeforeMinutes.isAcceptableOrUnknown(
          data['notify_before_minutes']!,
          _notifyBeforeMinutesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      defaultTemplateId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_template_id'],
      ),
      showLunar: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}show_lunar'],
      )!,
      showSolarTerm: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}show_solar_term'],
      )!,
      showColor: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}show_color'],
      )!,
      notifyBeforeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}notify_before_minutes'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final int id;
  final int? defaultTemplateId;
  final bool showLunar;
  final bool showSolarTerm;
  final bool showColor;
  final int notifyBeforeMinutes;
  const Setting({
    required this.id,
    this.defaultTemplateId,
    required this.showLunar,
    required this.showSolarTerm,
    required this.showColor,
    required this.notifyBeforeMinutes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || defaultTemplateId != null) {
      map['default_template_id'] = Variable<int>(defaultTemplateId);
    }
    map['show_lunar'] = Variable<bool>(showLunar);
    map['show_solar_term'] = Variable<bool>(showSolarTerm);
    map['show_color'] = Variable<bool>(showColor);
    map['notify_before_minutes'] = Variable<int>(notifyBeforeMinutes);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      defaultTemplateId: defaultTemplateId == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultTemplateId),
      showLunar: Value(showLunar),
      showSolarTerm: Value(showSolarTerm),
      showColor: Value(showColor),
      notifyBeforeMinutes: Value(notifyBeforeMinutes),
    );
  }

  factory Setting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      id: serializer.fromJson<int>(json['id']),
      defaultTemplateId: serializer.fromJson<int?>(json['defaultTemplateId']),
      showLunar: serializer.fromJson<bool>(json['showLunar']),
      showSolarTerm: serializer.fromJson<bool>(json['showSolarTerm']),
      showColor: serializer.fromJson<bool>(json['showColor']),
      notifyBeforeMinutes: serializer.fromJson<int>(
        json['notifyBeforeMinutes'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'defaultTemplateId': serializer.toJson<int?>(defaultTemplateId),
      'showLunar': serializer.toJson<bool>(showLunar),
      'showSolarTerm': serializer.toJson<bool>(showSolarTerm),
      'showColor': serializer.toJson<bool>(showColor),
      'notifyBeforeMinutes': serializer.toJson<int>(notifyBeforeMinutes),
    };
  }

  Setting copyWith({
    int? id,
    Value<int?> defaultTemplateId = const Value.absent(),
    bool? showLunar,
    bool? showSolarTerm,
    bool? showColor,
    int? notifyBeforeMinutes,
  }) => Setting(
    id: id ?? this.id,
    defaultTemplateId: defaultTemplateId.present
        ? defaultTemplateId.value
        : this.defaultTemplateId,
    showLunar: showLunar ?? this.showLunar,
    showSolarTerm: showSolarTerm ?? this.showSolarTerm,
    showColor: showColor ?? this.showColor,
    notifyBeforeMinutes: notifyBeforeMinutes ?? this.notifyBeforeMinutes,
  );
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      id: data.id.present ? data.id.value : this.id,
      defaultTemplateId: data.defaultTemplateId.present
          ? data.defaultTemplateId.value
          : this.defaultTemplateId,
      showLunar: data.showLunar.present ? data.showLunar.value : this.showLunar,
      showSolarTerm: data.showSolarTerm.present
          ? data.showSolarTerm.value
          : this.showSolarTerm,
      showColor: data.showColor.present ? data.showColor.value : this.showColor,
      notifyBeforeMinutes: data.notifyBeforeMinutes.present
          ? data.notifyBeforeMinutes.value
          : this.notifyBeforeMinutes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('id: $id, ')
          ..write('defaultTemplateId: $defaultTemplateId, ')
          ..write('showLunar: $showLunar, ')
          ..write('showSolarTerm: $showSolarTerm, ')
          ..write('showColor: $showColor, ')
          ..write('notifyBeforeMinutes: $notifyBeforeMinutes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    defaultTemplateId,
    showLunar,
    showSolarTerm,
    showColor,
    notifyBeforeMinutes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.id == this.id &&
          other.defaultTemplateId == this.defaultTemplateId &&
          other.showLunar == this.showLunar &&
          other.showSolarTerm == this.showSolarTerm &&
          other.showColor == this.showColor &&
          other.notifyBeforeMinutes == this.notifyBeforeMinutes);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<int> id;
  final Value<int?> defaultTemplateId;
  final Value<bool> showLunar;
  final Value<bool> showSolarTerm;
  final Value<bool> showColor;
  final Value<int> notifyBeforeMinutes;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.defaultTemplateId = const Value.absent(),
    this.showLunar = const Value.absent(),
    this.showSolarTerm = const Value.absent(),
    this.showColor = const Value.absent(),
    this.notifyBeforeMinutes = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    this.defaultTemplateId = const Value.absent(),
    this.showLunar = const Value.absent(),
    this.showSolarTerm = const Value.absent(),
    this.showColor = const Value.absent(),
    this.notifyBeforeMinutes = const Value.absent(),
  });
  static Insertable<Setting> custom({
    Expression<int>? id,
    Expression<int>? defaultTemplateId,
    Expression<bool>? showLunar,
    Expression<bool>? showSolarTerm,
    Expression<bool>? showColor,
    Expression<int>? notifyBeforeMinutes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (defaultTemplateId != null) 'default_template_id': defaultTemplateId,
      if (showLunar != null) 'show_lunar': showLunar,
      if (showSolarTerm != null) 'show_solar_term': showSolarTerm,
      if (showColor != null) 'show_color': showColor,
      if (notifyBeforeMinutes != null)
        'notify_before_minutes': notifyBeforeMinutes,
    });
  }

  SettingsCompanion copyWith({
    Value<int>? id,
    Value<int?>? defaultTemplateId,
    Value<bool>? showLunar,
    Value<bool>? showSolarTerm,
    Value<bool>? showColor,
    Value<int>? notifyBeforeMinutes,
  }) {
    return SettingsCompanion(
      id: id ?? this.id,
      defaultTemplateId: defaultTemplateId ?? this.defaultTemplateId,
      showLunar: showLunar ?? this.showLunar,
      showSolarTerm: showSolarTerm ?? this.showSolarTerm,
      showColor: showColor ?? this.showColor,
      notifyBeforeMinutes: notifyBeforeMinutes ?? this.notifyBeforeMinutes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (defaultTemplateId.present) {
      map['default_template_id'] = Variable<int>(defaultTemplateId.value);
    }
    if (showLunar.present) {
      map['show_lunar'] = Variable<bool>(showLunar.value);
    }
    if (showSolarTerm.present) {
      map['show_solar_term'] = Variable<bool>(showSolarTerm.value);
    }
    if (showColor.present) {
      map['show_color'] = Variable<bool>(showColor.value);
    }
    if (notifyBeforeMinutes.present) {
      map['notify_before_minutes'] = Variable<int>(notifyBeforeMinutes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('defaultTemplateId: $defaultTemplateId, ')
          ..write('showLunar: $showLunar, ')
          ..write('showSolarTerm: $showSolarTerm, ')
          ..write('showColor: $showColor, ')
          ..write('notifyBeforeMinutes: $notifyBeforeMinutes')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ShiftsTable shifts = $ShiftsTable(this);
  late final $ScheduleTemplatesTable scheduleTemplates =
      $ScheduleTemplatesTable(this);
  late final $TemplateDaysTable templateDays = $TemplateDaysTable(this);
  late final $TemplateDayShiftsTable templateDayShifts =
      $TemplateDayShiftsTable(this);
  late final $ScheduleAnchorsTable scheduleAnchors = $ScheduleAnchorsTable(
    this,
  );
  late final $ScheduleOverridesTable scheduleOverrides =
      $ScheduleOverridesTable(this);
  late final $ScheduleOverrideShiftsTable scheduleOverrideShifts =
      $ScheduleOverrideShiftsTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final ShiftsDao shiftsDao = ShiftsDao(this as AppDatabase);
  late final ScheduleTemplatesDao scheduleTemplatesDao = ScheduleTemplatesDao(
    this as AppDatabase,
  );
  late final TemplateDaysDao templateDaysDao = TemplateDaysDao(
    this as AppDatabase,
  );
  late final TemplateDayShiftsDao templateDayShiftsDao = TemplateDayShiftsDao(
    this as AppDatabase,
  );
  late final ScheduleAnchorsDao scheduleAnchorsDao = ScheduleAnchorsDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    shifts,
    scheduleTemplates,
    templateDays,
    templateDayShifts,
    scheduleAnchors,
    scheduleOverrides,
    scheduleOverrideShifts,
    settings,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'schedule_templates',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('template_days', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'template_days',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('template_day_shifts', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'shifts',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('template_day_shifts', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'schedule_templates',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('schedule_anchors', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'schedule_overrides',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('schedule_override_shifts', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'shifts',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('schedule_override_shifts', kind: UpdateKind.delete),
      ],
    ),
  ]);
}

typedef $$ShiftsTableCreateCompanionBuilder =
    ShiftsCompanion Function({
      Value<int> id,
      required String name,
      required int startMinute,
      required int endMinute,
      Value<String?> colorHex,
      Value<String?> remark,
    });
typedef $$ShiftsTableUpdateCompanionBuilder =
    ShiftsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> startMinute,
      Value<int> endMinute,
      Value<String?> colorHex,
      Value<String?> remark,
    });

final class $$ShiftsTableReferences
    extends BaseReferences<_$AppDatabase, $ShiftsTable, Shift> {
  $$ShiftsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TemplateDayShiftsTable, List<TemplateDayShift>>
  _templateDayShiftsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.templateDayShifts,
        aliasName: $_aliasNameGenerator(
          db.shifts.id,
          db.templateDayShifts.shiftId,
        ),
      );

  $$TemplateDayShiftsTableProcessedTableManager get templateDayShiftsRefs {
    final manager = $$TemplateDayShiftsTableTableManager(
      $_db,
      $_db.templateDayShifts,
    ).filter((f) => f.shiftId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _templateDayShiftsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ScheduleOverrideShiftsTable,
    List<ScheduleOverrideShift>
  >
  _scheduleOverrideShiftsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.scheduleOverrideShifts,
        aliasName: $_aliasNameGenerator(
          db.shifts.id,
          db.scheduleOverrideShifts.shiftId,
        ),
      );

  $$ScheduleOverrideShiftsTableProcessedTableManager
  get scheduleOverrideShiftsRefs {
    final manager = $$ScheduleOverrideShiftsTableTableManager(
      $_db,
      $_db.scheduleOverrideShifts,
    ).filter((f) => f.shiftId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _scheduleOverrideShiftsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ShiftsTableFilterComposer
    extends Composer<_$AppDatabase, $ShiftsTable> {
  $$ShiftsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startMinute => $composableBuilder(
    column: $table.startMinute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endMinute => $composableBuilder(
    column: $table.endMinute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> templateDayShiftsRefs(
    Expression<bool> Function($$TemplateDayShiftsTableFilterComposer f) f,
  ) {
    final $$TemplateDayShiftsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.templateDayShifts,
      getReferencedColumn: (t) => t.shiftId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TemplateDayShiftsTableFilterComposer(
            $db: $db,
            $table: $db.templateDayShifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> scheduleOverrideShiftsRefs(
    Expression<bool> Function($$ScheduleOverrideShiftsTableFilterComposer f) f,
  ) {
    final $$ScheduleOverrideShiftsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.scheduleOverrideShifts,
          getReferencedColumn: (t) => t.shiftId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScheduleOverrideShiftsTableFilterComposer(
                $db: $db,
                $table: $db.scheduleOverrideShifts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ShiftsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShiftsTable> {
  $$ShiftsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startMinute => $composableBuilder(
    column: $table.startMinute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endMinute => $composableBuilder(
    column: $table.endMinute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShiftsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShiftsTable> {
  $$ShiftsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get startMinute => $composableBuilder(
    column: $table.startMinute,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endMinute =>
      $composableBuilder(column: $table.endMinute, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  Expression<T> templateDayShiftsRefs<T extends Object>(
    Expression<T> Function($$TemplateDayShiftsTableAnnotationComposer a) f,
  ) {
    final $$TemplateDayShiftsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.templateDayShifts,
          getReferencedColumn: (t) => t.shiftId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TemplateDayShiftsTableAnnotationComposer(
                $db: $db,
                $table: $db.templateDayShifts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> scheduleOverrideShiftsRefs<T extends Object>(
    Expression<T> Function($$ScheduleOverrideShiftsTableAnnotationComposer a) f,
  ) {
    final $$ScheduleOverrideShiftsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.scheduleOverrideShifts,
          getReferencedColumn: (t) => t.shiftId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScheduleOverrideShiftsTableAnnotationComposer(
                $db: $db,
                $table: $db.scheduleOverrideShifts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ShiftsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShiftsTable,
          Shift,
          $$ShiftsTableFilterComposer,
          $$ShiftsTableOrderingComposer,
          $$ShiftsTableAnnotationComposer,
          $$ShiftsTableCreateCompanionBuilder,
          $$ShiftsTableUpdateCompanionBuilder,
          (Shift, $$ShiftsTableReferences),
          Shift,
          PrefetchHooks Function({
            bool templateDayShiftsRefs,
            bool scheduleOverrideShiftsRefs,
          })
        > {
  $$ShiftsTableTableManager(_$AppDatabase db, $ShiftsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShiftsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShiftsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShiftsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> startMinute = const Value.absent(),
                Value<int> endMinute = const Value.absent(),
                Value<String?> colorHex = const Value.absent(),
                Value<String?> remark = const Value.absent(),
              }) => ShiftsCompanion(
                id: id,
                name: name,
                startMinute: startMinute,
                endMinute: endMinute,
                colorHex: colorHex,
                remark: remark,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int startMinute,
                required int endMinute,
                Value<String?> colorHex = const Value.absent(),
                Value<String?> remark = const Value.absent(),
              }) => ShiftsCompanion.insert(
                id: id,
                name: name,
                startMinute: startMinute,
                endMinute: endMinute,
                colorHex: colorHex,
                remark: remark,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$ShiftsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                templateDayShiftsRefs = false,
                scheduleOverrideShiftsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (templateDayShiftsRefs) db.templateDayShifts,
                    if (scheduleOverrideShiftsRefs) db.scheduleOverrideShifts,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (templateDayShiftsRefs)
                        await $_getPrefetchedData<
                          Shift,
                          $ShiftsTable,
                          TemplateDayShift
                        >(
                          currentTable: table,
                          referencedTable: $$ShiftsTableReferences
                              ._templateDayShiftsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShiftsTableReferences(
                                db,
                                table,
                                p0,
                              ).templateDayShiftsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.shiftId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (scheduleOverrideShiftsRefs)
                        await $_getPrefetchedData<
                          Shift,
                          $ShiftsTable,
                          ScheduleOverrideShift
                        >(
                          currentTable: table,
                          referencedTable: $$ShiftsTableReferences
                              ._scheduleOverrideShiftsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShiftsTableReferences(
                                db,
                                table,
                                p0,
                              ).scheduleOverrideShiftsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.shiftId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ShiftsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShiftsTable,
      Shift,
      $$ShiftsTableFilterComposer,
      $$ShiftsTableOrderingComposer,
      $$ShiftsTableAnnotationComposer,
      $$ShiftsTableCreateCompanionBuilder,
      $$ShiftsTableUpdateCompanionBuilder,
      (Shift, $$ShiftsTableReferences),
      Shift,
      PrefetchHooks Function({
        bool templateDayShiftsRefs,
        bool scheduleOverrideShiftsRefs,
      })
    >;
typedef $$ScheduleTemplatesTableCreateCompanionBuilder =
    ScheduleTemplatesCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> remark,
      Value<DateTime> createdAt,
    });
typedef $$ScheduleTemplatesTableUpdateCompanionBuilder =
    ScheduleTemplatesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> remark,
      Value<DateTime> createdAt,
    });

final class $$ScheduleTemplatesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ScheduleTemplatesTable,
          ScheduleTemplate
        > {
  $$ScheduleTemplatesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TemplateDaysTable, List<TemplateDay>>
  _templateDaysRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.templateDays,
    aliasName: $_aliasNameGenerator(
      db.scheduleTemplates.id,
      db.templateDays.templateId,
    ),
  );

  $$TemplateDaysTableProcessedTableManager get templateDaysRefs {
    final manager = $$TemplateDaysTableTableManager(
      $_db,
      $_db.templateDays,
    ).filter((f) => f.templateId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_templateDaysRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ScheduleAnchorsTable, List<ScheduleAnchor>>
  _scheduleAnchorsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.scheduleAnchors,
    aliasName: $_aliasNameGenerator(
      db.scheduleTemplates.id,
      db.scheduleAnchors.templateId,
    ),
  );

  $$ScheduleAnchorsTableProcessedTableManager get scheduleAnchorsRefs {
    final manager = $$ScheduleAnchorsTableTableManager(
      $_db,
      $_db.scheduleAnchors,
    ).filter((f) => f.templateId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _scheduleAnchorsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ScheduleTemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduleTemplatesTable> {
  $$ScheduleTemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> templateDaysRefs(
    Expression<bool> Function($$TemplateDaysTableFilterComposer f) f,
  ) {
    final $$TemplateDaysTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.templateDays,
      getReferencedColumn: (t) => t.templateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TemplateDaysTableFilterComposer(
            $db: $db,
            $table: $db.templateDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> scheduleAnchorsRefs(
    Expression<bool> Function($$ScheduleAnchorsTableFilterComposer f) f,
  ) {
    final $$ScheduleAnchorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduleAnchors,
      getReferencedColumn: (t) => t.templateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleAnchorsTableFilterComposer(
            $db: $db,
            $table: $db.scheduleAnchors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ScheduleTemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduleTemplatesTable> {
  $$ScheduleTemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ScheduleTemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduleTemplatesTable> {
  $$ScheduleTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> templateDaysRefs<T extends Object>(
    Expression<T> Function($$TemplateDaysTableAnnotationComposer a) f,
  ) {
    final $$TemplateDaysTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.templateDays,
      getReferencedColumn: (t) => t.templateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TemplateDaysTableAnnotationComposer(
            $db: $db,
            $table: $db.templateDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> scheduleAnchorsRefs<T extends Object>(
    Expression<T> Function($$ScheduleAnchorsTableAnnotationComposer a) f,
  ) {
    final $$ScheduleAnchorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduleAnchors,
      getReferencedColumn: (t) => t.templateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleAnchorsTableAnnotationComposer(
            $db: $db,
            $table: $db.scheduleAnchors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ScheduleTemplatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScheduleTemplatesTable,
          ScheduleTemplate,
          $$ScheduleTemplatesTableFilterComposer,
          $$ScheduleTemplatesTableOrderingComposer,
          $$ScheduleTemplatesTableAnnotationComposer,
          $$ScheduleTemplatesTableCreateCompanionBuilder,
          $$ScheduleTemplatesTableUpdateCompanionBuilder,
          (ScheduleTemplate, $$ScheduleTemplatesTableReferences),
          ScheduleTemplate,
          PrefetchHooks Function({
            bool templateDaysRefs,
            bool scheduleAnchorsRefs,
          })
        > {
  $$ScheduleTemplatesTableTableManager(
    _$AppDatabase db,
    $ScheduleTemplatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduleTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScheduleTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScheduleTemplatesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ScheduleTemplatesCompanion(
                id: id,
                name: name,
                remark: remark,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> remark = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ScheduleTemplatesCompanion.insert(
                id: id,
                name: name,
                remark: remark,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ScheduleTemplatesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({templateDaysRefs = false, scheduleAnchorsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (templateDaysRefs) db.templateDays,
                    if (scheduleAnchorsRefs) db.scheduleAnchors,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (templateDaysRefs)
                        await $_getPrefetchedData<
                          ScheduleTemplate,
                          $ScheduleTemplatesTable,
                          TemplateDay
                        >(
                          currentTable: table,
                          referencedTable: $$ScheduleTemplatesTableReferences
                              ._templateDaysRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ScheduleTemplatesTableReferences(
                                db,
                                table,
                                p0,
                              ).templateDaysRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.templateId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (scheduleAnchorsRefs)
                        await $_getPrefetchedData<
                          ScheduleTemplate,
                          $ScheduleTemplatesTable,
                          ScheduleAnchor
                        >(
                          currentTable: table,
                          referencedTable: $$ScheduleTemplatesTableReferences
                              ._scheduleAnchorsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ScheduleTemplatesTableReferences(
                                db,
                                table,
                                p0,
                              ).scheduleAnchorsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.templateId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ScheduleTemplatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScheduleTemplatesTable,
      ScheduleTemplate,
      $$ScheduleTemplatesTableFilterComposer,
      $$ScheduleTemplatesTableOrderingComposer,
      $$ScheduleTemplatesTableAnnotationComposer,
      $$ScheduleTemplatesTableCreateCompanionBuilder,
      $$ScheduleTemplatesTableUpdateCompanionBuilder,
      (ScheduleTemplate, $$ScheduleTemplatesTableReferences),
      ScheduleTemplate,
      PrefetchHooks Function({bool templateDaysRefs, bool scheduleAnchorsRefs})
    >;
typedef $$TemplateDaysTableCreateCompanionBuilder =
    TemplateDaysCompanion Function({
      Value<int> id,
      required int templateId,
      required int dayIndex,
    });
typedef $$TemplateDaysTableUpdateCompanionBuilder =
    TemplateDaysCompanion Function({
      Value<int> id,
      Value<int> templateId,
      Value<int> dayIndex,
    });

final class $$TemplateDaysTableReferences
    extends BaseReferences<_$AppDatabase, $TemplateDaysTable, TemplateDay> {
  $$TemplateDaysTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ScheduleTemplatesTable _templateIdTable(_$AppDatabase db) =>
      db.scheduleTemplates.createAlias(
        $_aliasNameGenerator(
          db.templateDays.templateId,
          db.scheduleTemplates.id,
        ),
      );

  $$ScheduleTemplatesTableProcessedTableManager get templateId {
    final $_column = $_itemColumn<int>('template_id')!;

    final manager = $$ScheduleTemplatesTableTableManager(
      $_db,
      $_db.scheduleTemplates,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_templateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TemplateDayShiftsTable, List<TemplateDayShift>>
  _templateDayShiftsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.templateDayShifts,
        aliasName: $_aliasNameGenerator(
          db.templateDays.id,
          db.templateDayShifts.templateDayId,
        ),
      );

  $$TemplateDayShiftsTableProcessedTableManager get templateDayShiftsRefs {
    final manager = $$TemplateDayShiftsTableTableManager(
      $_db,
      $_db.templateDayShifts,
    ).filter((f) => f.templateDayId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _templateDayShiftsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TemplateDaysTableFilterComposer
    extends Composer<_$AppDatabase, $TemplateDaysTable> {
  $$TemplateDaysTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dayIndex => $composableBuilder(
    column: $table.dayIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$ScheduleTemplatesTableFilterComposer get templateId {
    final $$ScheduleTemplatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.templateId,
      referencedTable: $db.scheduleTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleTemplatesTableFilterComposer(
            $db: $db,
            $table: $db.scheduleTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> templateDayShiftsRefs(
    Expression<bool> Function($$TemplateDayShiftsTableFilterComposer f) f,
  ) {
    final $$TemplateDayShiftsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.templateDayShifts,
      getReferencedColumn: (t) => t.templateDayId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TemplateDayShiftsTableFilterComposer(
            $db: $db,
            $table: $db.templateDayShifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TemplateDaysTableOrderingComposer
    extends Composer<_$AppDatabase, $TemplateDaysTable> {
  $$TemplateDaysTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayIndex => $composableBuilder(
    column: $table.dayIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$ScheduleTemplatesTableOrderingComposer get templateId {
    final $$ScheduleTemplatesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.templateId,
      referencedTable: $db.scheduleTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleTemplatesTableOrderingComposer(
            $db: $db,
            $table: $db.scheduleTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TemplateDaysTableAnnotationComposer
    extends Composer<_$AppDatabase, $TemplateDaysTable> {
  $$TemplateDaysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dayIndex =>
      $composableBuilder(column: $table.dayIndex, builder: (column) => column);

  $$ScheduleTemplatesTableAnnotationComposer get templateId {
    final $$ScheduleTemplatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.templateId,
          referencedTable: $db.scheduleTemplates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScheduleTemplatesTableAnnotationComposer(
                $db: $db,
                $table: $db.scheduleTemplates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> templateDayShiftsRefs<T extends Object>(
    Expression<T> Function($$TemplateDayShiftsTableAnnotationComposer a) f,
  ) {
    final $$TemplateDayShiftsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.templateDayShifts,
          getReferencedColumn: (t) => t.templateDayId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TemplateDayShiftsTableAnnotationComposer(
                $db: $db,
                $table: $db.templateDayShifts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$TemplateDaysTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TemplateDaysTable,
          TemplateDay,
          $$TemplateDaysTableFilterComposer,
          $$TemplateDaysTableOrderingComposer,
          $$TemplateDaysTableAnnotationComposer,
          $$TemplateDaysTableCreateCompanionBuilder,
          $$TemplateDaysTableUpdateCompanionBuilder,
          (TemplateDay, $$TemplateDaysTableReferences),
          TemplateDay,
          PrefetchHooks Function({bool templateId, bool templateDayShiftsRefs})
        > {
  $$TemplateDaysTableTableManager(_$AppDatabase db, $TemplateDaysTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TemplateDaysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TemplateDaysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TemplateDaysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> templateId = const Value.absent(),
                Value<int> dayIndex = const Value.absent(),
              }) => TemplateDaysCompanion(
                id: id,
                templateId: templateId,
                dayIndex: dayIndex,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int templateId,
                required int dayIndex,
              }) => TemplateDaysCompanion.insert(
                id: id,
                templateId: templateId,
                dayIndex: dayIndex,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TemplateDaysTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({templateId = false, templateDayShiftsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (templateDayShiftsRefs) db.templateDayShifts,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (templateId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.templateId,
                                    referencedTable:
                                        $$TemplateDaysTableReferences
                                            ._templateIdTable(db),
                                    referencedColumn:
                                        $$TemplateDaysTableReferences
                                            ._templateIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (templateDayShiftsRefs)
                        await $_getPrefetchedData<
                          TemplateDay,
                          $TemplateDaysTable,
                          TemplateDayShift
                        >(
                          currentTable: table,
                          referencedTable: $$TemplateDaysTableReferences
                              ._templateDayShiftsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TemplateDaysTableReferences(
                                db,
                                table,
                                p0,
                              ).templateDayShiftsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.templateDayId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TemplateDaysTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TemplateDaysTable,
      TemplateDay,
      $$TemplateDaysTableFilterComposer,
      $$TemplateDaysTableOrderingComposer,
      $$TemplateDaysTableAnnotationComposer,
      $$TemplateDaysTableCreateCompanionBuilder,
      $$TemplateDaysTableUpdateCompanionBuilder,
      (TemplateDay, $$TemplateDaysTableReferences),
      TemplateDay,
      PrefetchHooks Function({bool templateId, bool templateDayShiftsRefs})
    >;
typedef $$TemplateDayShiftsTableCreateCompanionBuilder =
    TemplateDayShiftsCompanion Function({
      Value<int> id,
      required int templateDayId,
      required int shiftId,
    });
typedef $$TemplateDayShiftsTableUpdateCompanionBuilder =
    TemplateDayShiftsCompanion Function({
      Value<int> id,
      Value<int> templateDayId,
      Value<int> shiftId,
    });

final class $$TemplateDayShiftsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TemplateDayShiftsTable,
          TemplateDayShift
        > {
  $$TemplateDayShiftsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TemplateDaysTable _templateDayIdTable(_$AppDatabase db) =>
      db.templateDays.createAlias(
        $_aliasNameGenerator(
          db.templateDayShifts.templateDayId,
          db.templateDays.id,
        ),
      );

  $$TemplateDaysTableProcessedTableManager get templateDayId {
    final $_column = $_itemColumn<int>('template_day_id')!;

    final manager = $$TemplateDaysTableTableManager(
      $_db,
      $_db.templateDays,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_templateDayIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ShiftsTable _shiftIdTable(_$AppDatabase db) => db.shifts.createAlias(
    $_aliasNameGenerator(db.templateDayShifts.shiftId, db.shifts.id),
  );

  $$ShiftsTableProcessedTableManager get shiftId {
    final $_column = $_itemColumn<int>('shift_id')!;

    final manager = $$ShiftsTableTableManager(
      $_db,
      $_db.shifts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_shiftIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TemplateDayShiftsTableFilterComposer
    extends Composer<_$AppDatabase, $TemplateDayShiftsTable> {
  $$TemplateDayShiftsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$TemplateDaysTableFilterComposer get templateDayId {
    final $$TemplateDaysTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.templateDayId,
      referencedTable: $db.templateDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TemplateDaysTableFilterComposer(
            $db: $db,
            $table: $db.templateDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ShiftsTableFilterComposer get shiftId {
    final $$ShiftsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shiftId,
      referencedTable: $db.shifts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShiftsTableFilterComposer(
            $db: $db,
            $table: $db.shifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TemplateDayShiftsTableOrderingComposer
    extends Composer<_$AppDatabase, $TemplateDayShiftsTable> {
  $$TemplateDayShiftsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$TemplateDaysTableOrderingComposer get templateDayId {
    final $$TemplateDaysTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.templateDayId,
      referencedTable: $db.templateDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TemplateDaysTableOrderingComposer(
            $db: $db,
            $table: $db.templateDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ShiftsTableOrderingComposer get shiftId {
    final $$ShiftsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shiftId,
      referencedTable: $db.shifts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShiftsTableOrderingComposer(
            $db: $db,
            $table: $db.shifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TemplateDayShiftsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TemplateDayShiftsTable> {
  $$TemplateDayShiftsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$TemplateDaysTableAnnotationComposer get templateDayId {
    final $$TemplateDaysTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.templateDayId,
      referencedTable: $db.templateDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TemplateDaysTableAnnotationComposer(
            $db: $db,
            $table: $db.templateDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ShiftsTableAnnotationComposer get shiftId {
    final $$ShiftsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shiftId,
      referencedTable: $db.shifts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShiftsTableAnnotationComposer(
            $db: $db,
            $table: $db.shifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TemplateDayShiftsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TemplateDayShiftsTable,
          TemplateDayShift,
          $$TemplateDayShiftsTableFilterComposer,
          $$TemplateDayShiftsTableOrderingComposer,
          $$TemplateDayShiftsTableAnnotationComposer,
          $$TemplateDayShiftsTableCreateCompanionBuilder,
          $$TemplateDayShiftsTableUpdateCompanionBuilder,
          (TemplateDayShift, $$TemplateDayShiftsTableReferences),
          TemplateDayShift,
          PrefetchHooks Function({bool templateDayId, bool shiftId})
        > {
  $$TemplateDayShiftsTableTableManager(
    _$AppDatabase db,
    $TemplateDayShiftsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TemplateDayShiftsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TemplateDayShiftsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TemplateDayShiftsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> templateDayId = const Value.absent(),
                Value<int> shiftId = const Value.absent(),
              }) => TemplateDayShiftsCompanion(
                id: id,
                templateDayId: templateDayId,
                shiftId: shiftId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int templateDayId,
                required int shiftId,
              }) => TemplateDayShiftsCompanion.insert(
                id: id,
                templateDayId: templateDayId,
                shiftId: shiftId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TemplateDayShiftsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({templateDayId = false, shiftId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (templateDayId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.templateDayId,
                                referencedTable:
                                    $$TemplateDayShiftsTableReferences
                                        ._templateDayIdTable(db),
                                referencedColumn:
                                    $$TemplateDayShiftsTableReferences
                                        ._templateDayIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (shiftId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.shiftId,
                                referencedTable:
                                    $$TemplateDayShiftsTableReferences
                                        ._shiftIdTable(db),
                                referencedColumn:
                                    $$TemplateDayShiftsTableReferences
                                        ._shiftIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TemplateDayShiftsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TemplateDayShiftsTable,
      TemplateDayShift,
      $$TemplateDayShiftsTableFilterComposer,
      $$TemplateDayShiftsTableOrderingComposer,
      $$TemplateDayShiftsTableAnnotationComposer,
      $$TemplateDayShiftsTableCreateCompanionBuilder,
      $$TemplateDayShiftsTableUpdateCompanionBuilder,
      (TemplateDayShift, $$TemplateDayShiftsTableReferences),
      TemplateDayShift,
      PrefetchHooks Function({bool templateDayId, bool shiftId})
    >;
typedef $$ScheduleAnchorsTableCreateCompanionBuilder =
    ScheduleAnchorsCompanion Function({
      Value<int> id,
      required int templateId,
      required DateTime anchorDate,
      required int cycleDay,
      Value<bool> active,
    });
typedef $$ScheduleAnchorsTableUpdateCompanionBuilder =
    ScheduleAnchorsCompanion Function({
      Value<int> id,
      Value<int> templateId,
      Value<DateTime> anchorDate,
      Value<int> cycleDay,
      Value<bool> active,
    });

final class $$ScheduleAnchorsTableReferences
    extends
        BaseReferences<_$AppDatabase, $ScheduleAnchorsTable, ScheduleAnchor> {
  $$ScheduleAnchorsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ScheduleTemplatesTable _templateIdTable(_$AppDatabase db) =>
      db.scheduleTemplates.createAlias(
        $_aliasNameGenerator(
          db.scheduleAnchors.templateId,
          db.scheduleTemplates.id,
        ),
      );

  $$ScheduleTemplatesTableProcessedTableManager get templateId {
    final $_column = $_itemColumn<int>('template_id')!;

    final manager = $$ScheduleTemplatesTableTableManager(
      $_db,
      $_db.scheduleTemplates,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_templateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ScheduleAnchorsTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduleAnchorsTable> {
  $$ScheduleAnchorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get anchorDate => $composableBuilder(
    column: $table.anchorDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cycleDay => $composableBuilder(
    column: $table.cycleDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  $$ScheduleTemplatesTableFilterComposer get templateId {
    final $$ScheduleTemplatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.templateId,
      referencedTable: $db.scheduleTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleTemplatesTableFilterComposer(
            $db: $db,
            $table: $db.scheduleTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleAnchorsTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduleAnchorsTable> {
  $$ScheduleAnchorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get anchorDate => $composableBuilder(
    column: $table.anchorDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cycleDay => $composableBuilder(
    column: $table.cycleDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  $$ScheduleTemplatesTableOrderingComposer get templateId {
    final $$ScheduleTemplatesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.templateId,
      referencedTable: $db.scheduleTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleTemplatesTableOrderingComposer(
            $db: $db,
            $table: $db.scheduleTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleAnchorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduleAnchorsTable> {
  $$ScheduleAnchorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get anchorDate => $composableBuilder(
    column: $table.anchorDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cycleDay =>
      $composableBuilder(column: $table.cycleDay, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  $$ScheduleTemplatesTableAnnotationComposer get templateId {
    final $$ScheduleTemplatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.templateId,
          referencedTable: $db.scheduleTemplates,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScheduleTemplatesTableAnnotationComposer(
                $db: $db,
                $table: $db.scheduleTemplates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ScheduleAnchorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScheduleAnchorsTable,
          ScheduleAnchor,
          $$ScheduleAnchorsTableFilterComposer,
          $$ScheduleAnchorsTableOrderingComposer,
          $$ScheduleAnchorsTableAnnotationComposer,
          $$ScheduleAnchorsTableCreateCompanionBuilder,
          $$ScheduleAnchorsTableUpdateCompanionBuilder,
          (ScheduleAnchor, $$ScheduleAnchorsTableReferences),
          ScheduleAnchor,
          PrefetchHooks Function({bool templateId})
        > {
  $$ScheduleAnchorsTableTableManager(
    _$AppDatabase db,
    $ScheduleAnchorsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduleAnchorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScheduleAnchorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScheduleAnchorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> templateId = const Value.absent(),
                Value<DateTime> anchorDate = const Value.absent(),
                Value<int> cycleDay = const Value.absent(),
                Value<bool> active = const Value.absent(),
              }) => ScheduleAnchorsCompanion(
                id: id,
                templateId: templateId,
                anchorDate: anchorDate,
                cycleDay: cycleDay,
                active: active,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int templateId,
                required DateTime anchorDate,
                required int cycleDay,
                Value<bool> active = const Value.absent(),
              }) => ScheduleAnchorsCompanion.insert(
                id: id,
                templateId: templateId,
                anchorDate: anchorDate,
                cycleDay: cycleDay,
                active: active,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ScheduleAnchorsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({templateId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (templateId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.templateId,
                                referencedTable:
                                    $$ScheduleAnchorsTableReferences
                                        ._templateIdTable(db),
                                referencedColumn:
                                    $$ScheduleAnchorsTableReferences
                                        ._templateIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ScheduleAnchorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScheduleAnchorsTable,
      ScheduleAnchor,
      $$ScheduleAnchorsTableFilterComposer,
      $$ScheduleAnchorsTableOrderingComposer,
      $$ScheduleAnchorsTableAnnotationComposer,
      $$ScheduleAnchorsTableCreateCompanionBuilder,
      $$ScheduleAnchorsTableUpdateCompanionBuilder,
      (ScheduleAnchor, $$ScheduleAnchorsTableReferences),
      ScheduleAnchor,
      PrefetchHooks Function({bool templateId})
    >;
typedef $$ScheduleOverridesTableCreateCompanionBuilder =
    ScheduleOverridesCompanion Function({
      Value<int> id,
      required DateTime date,
      required int type,
      Value<String?> remark,
      Value<DateTime> createdAt,
    });
typedef $$ScheduleOverridesTableUpdateCompanionBuilder =
    ScheduleOverridesCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<int> type,
      Value<String?> remark,
      Value<DateTime> createdAt,
    });

final class $$ScheduleOverridesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ScheduleOverridesTable,
          ScheduleOverride
        > {
  $$ScheduleOverridesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $ScheduleOverrideShiftsTable,
    List<ScheduleOverrideShift>
  >
  _scheduleOverrideShiftsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.scheduleOverrideShifts,
        aliasName: $_aliasNameGenerator(
          db.scheduleOverrides.id,
          db.scheduleOverrideShifts.overrideId,
        ),
      );

  $$ScheduleOverrideShiftsTableProcessedTableManager
  get scheduleOverrideShiftsRefs {
    final manager = $$ScheduleOverrideShiftsTableTableManager(
      $_db,
      $_db.scheduleOverrideShifts,
    ).filter((f) => f.overrideId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _scheduleOverrideShiftsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ScheduleOverridesTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduleOverridesTable> {
  $$ScheduleOverridesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> scheduleOverrideShiftsRefs(
    Expression<bool> Function($$ScheduleOverrideShiftsTableFilterComposer f) f,
  ) {
    final $$ScheduleOverrideShiftsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.scheduleOverrideShifts,
          getReferencedColumn: (t) => t.overrideId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScheduleOverrideShiftsTableFilterComposer(
                $db: $db,
                $table: $db.scheduleOverrideShifts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ScheduleOverridesTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduleOverridesTable> {
  $$ScheduleOverridesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ScheduleOverridesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduleOverridesTable> {
  $$ScheduleOverridesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> scheduleOverrideShiftsRefs<T extends Object>(
    Expression<T> Function($$ScheduleOverrideShiftsTableAnnotationComposer a) f,
  ) {
    final $$ScheduleOverrideShiftsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.scheduleOverrideShifts,
          getReferencedColumn: (t) => t.overrideId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScheduleOverrideShiftsTableAnnotationComposer(
                $db: $db,
                $table: $db.scheduleOverrideShifts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ScheduleOverridesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScheduleOverridesTable,
          ScheduleOverride,
          $$ScheduleOverridesTableFilterComposer,
          $$ScheduleOverridesTableOrderingComposer,
          $$ScheduleOverridesTableAnnotationComposer,
          $$ScheduleOverridesTableCreateCompanionBuilder,
          $$ScheduleOverridesTableUpdateCompanionBuilder,
          (ScheduleOverride, $$ScheduleOverridesTableReferences),
          ScheduleOverride,
          PrefetchHooks Function({bool scheduleOverrideShiftsRefs})
        > {
  $$ScheduleOverridesTableTableManager(
    _$AppDatabase db,
    $ScheduleOverridesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduleOverridesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScheduleOverridesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScheduleOverridesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> type = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ScheduleOverridesCompanion(
                id: id,
                date: date,
                type: type,
                remark: remark,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required int type,
                Value<String?> remark = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ScheduleOverridesCompanion.insert(
                id: id,
                date: date,
                type: type,
                remark: remark,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ScheduleOverridesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({scheduleOverrideShiftsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (scheduleOverrideShiftsRefs) db.scheduleOverrideShifts,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (scheduleOverrideShiftsRefs)
                    await $_getPrefetchedData<
                      ScheduleOverride,
                      $ScheduleOverridesTable,
                      ScheduleOverrideShift
                    >(
                      currentTable: table,
                      referencedTable: $$ScheduleOverridesTableReferences
                          ._scheduleOverrideShiftsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ScheduleOverridesTableReferences(
                            db,
                            table,
                            p0,
                          ).scheduleOverrideShiftsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.overrideId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ScheduleOverridesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScheduleOverridesTable,
      ScheduleOverride,
      $$ScheduleOverridesTableFilterComposer,
      $$ScheduleOverridesTableOrderingComposer,
      $$ScheduleOverridesTableAnnotationComposer,
      $$ScheduleOverridesTableCreateCompanionBuilder,
      $$ScheduleOverridesTableUpdateCompanionBuilder,
      (ScheduleOverride, $$ScheduleOverridesTableReferences),
      ScheduleOverride,
      PrefetchHooks Function({bool scheduleOverrideShiftsRefs})
    >;
typedef $$ScheduleOverrideShiftsTableCreateCompanionBuilder =
    ScheduleOverrideShiftsCompanion Function({
      Value<int> id,
      required int overrideId,
      required int shiftId,
    });
typedef $$ScheduleOverrideShiftsTableUpdateCompanionBuilder =
    ScheduleOverrideShiftsCompanion Function({
      Value<int> id,
      Value<int> overrideId,
      Value<int> shiftId,
    });

final class $$ScheduleOverrideShiftsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ScheduleOverrideShiftsTable,
          ScheduleOverrideShift
        > {
  $$ScheduleOverrideShiftsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ScheduleOverridesTable _overrideIdTable(_$AppDatabase db) =>
      db.scheduleOverrides.createAlias(
        $_aliasNameGenerator(
          db.scheduleOverrideShifts.overrideId,
          db.scheduleOverrides.id,
        ),
      );

  $$ScheduleOverridesTableProcessedTableManager get overrideId {
    final $_column = $_itemColumn<int>('override_id')!;

    final manager = $$ScheduleOverridesTableTableManager(
      $_db,
      $_db.scheduleOverrides,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_overrideIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ShiftsTable _shiftIdTable(_$AppDatabase db) => db.shifts.createAlias(
    $_aliasNameGenerator(db.scheduleOverrideShifts.shiftId, db.shifts.id),
  );

  $$ShiftsTableProcessedTableManager get shiftId {
    final $_column = $_itemColumn<int>('shift_id')!;

    final manager = $$ShiftsTableTableManager(
      $_db,
      $_db.shifts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_shiftIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ScheduleOverrideShiftsTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduleOverrideShiftsTable> {
  $$ScheduleOverrideShiftsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$ScheduleOverridesTableFilterComposer get overrideId {
    final $$ScheduleOverridesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.overrideId,
      referencedTable: $db.scheduleOverrides,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleOverridesTableFilterComposer(
            $db: $db,
            $table: $db.scheduleOverrides,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ShiftsTableFilterComposer get shiftId {
    final $$ShiftsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shiftId,
      referencedTable: $db.shifts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShiftsTableFilterComposer(
            $db: $db,
            $table: $db.shifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleOverrideShiftsTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduleOverrideShiftsTable> {
  $$ScheduleOverrideShiftsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$ScheduleOverridesTableOrderingComposer get overrideId {
    final $$ScheduleOverridesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.overrideId,
      referencedTable: $db.scheduleOverrides,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleOverridesTableOrderingComposer(
            $db: $db,
            $table: $db.scheduleOverrides,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ShiftsTableOrderingComposer get shiftId {
    final $$ShiftsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shiftId,
      referencedTable: $db.shifts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShiftsTableOrderingComposer(
            $db: $db,
            $table: $db.shifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleOverrideShiftsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduleOverrideShiftsTable> {
  $$ScheduleOverrideShiftsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$ScheduleOverridesTableAnnotationComposer get overrideId {
    final $$ScheduleOverridesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.overrideId,
          referencedTable: $db.scheduleOverrides,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScheduleOverridesTableAnnotationComposer(
                $db: $db,
                $table: $db.scheduleOverrides,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$ShiftsTableAnnotationComposer get shiftId {
    final $$ShiftsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shiftId,
      referencedTable: $db.shifts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShiftsTableAnnotationComposer(
            $db: $db,
            $table: $db.shifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleOverrideShiftsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScheduleOverrideShiftsTable,
          ScheduleOverrideShift,
          $$ScheduleOverrideShiftsTableFilterComposer,
          $$ScheduleOverrideShiftsTableOrderingComposer,
          $$ScheduleOverrideShiftsTableAnnotationComposer,
          $$ScheduleOverrideShiftsTableCreateCompanionBuilder,
          $$ScheduleOverrideShiftsTableUpdateCompanionBuilder,
          (ScheduleOverrideShift, $$ScheduleOverrideShiftsTableReferences),
          ScheduleOverrideShift,
          PrefetchHooks Function({bool overrideId, bool shiftId})
        > {
  $$ScheduleOverrideShiftsTableTableManager(
    _$AppDatabase db,
    $ScheduleOverrideShiftsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduleOverrideShiftsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ScheduleOverrideShiftsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ScheduleOverrideShiftsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> overrideId = const Value.absent(),
                Value<int> shiftId = const Value.absent(),
              }) => ScheduleOverrideShiftsCompanion(
                id: id,
                overrideId: overrideId,
                shiftId: shiftId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int overrideId,
                required int shiftId,
              }) => ScheduleOverrideShiftsCompanion.insert(
                id: id,
                overrideId: overrideId,
                shiftId: shiftId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ScheduleOverrideShiftsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({overrideId = false, shiftId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (overrideId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.overrideId,
                                referencedTable:
                                    $$ScheduleOverrideShiftsTableReferences
                                        ._overrideIdTable(db),
                                referencedColumn:
                                    $$ScheduleOverrideShiftsTableReferences
                                        ._overrideIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (shiftId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.shiftId,
                                referencedTable:
                                    $$ScheduleOverrideShiftsTableReferences
                                        ._shiftIdTable(db),
                                referencedColumn:
                                    $$ScheduleOverrideShiftsTableReferences
                                        ._shiftIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ScheduleOverrideShiftsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScheduleOverrideShiftsTable,
      ScheduleOverrideShift,
      $$ScheduleOverrideShiftsTableFilterComposer,
      $$ScheduleOverrideShiftsTableOrderingComposer,
      $$ScheduleOverrideShiftsTableAnnotationComposer,
      $$ScheduleOverrideShiftsTableCreateCompanionBuilder,
      $$ScheduleOverrideShiftsTableUpdateCompanionBuilder,
      (ScheduleOverrideShift, $$ScheduleOverrideShiftsTableReferences),
      ScheduleOverrideShift,
      PrefetchHooks Function({bool overrideId, bool shiftId})
    >;
typedef $$SettingsTableCreateCompanionBuilder =
    SettingsCompanion Function({
      Value<int> id,
      Value<int?> defaultTemplateId,
      Value<bool> showLunar,
      Value<bool> showSolarTerm,
      Value<bool> showColor,
      Value<int> notifyBeforeMinutes,
    });
typedef $$SettingsTableUpdateCompanionBuilder =
    SettingsCompanion Function({
      Value<int> id,
      Value<int?> defaultTemplateId,
      Value<bool> showLunar,
      Value<bool> showSolarTerm,
      Value<bool> showColor,
      Value<int> notifyBeforeMinutes,
    });

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defaultTemplateId => $composableBuilder(
    column: $table.defaultTemplateId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get showLunar => $composableBuilder(
    column: $table.showLunar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get showSolarTerm => $composableBuilder(
    column: $table.showSolarTerm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get showColor => $composableBuilder(
    column: $table.showColor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get notifyBeforeMinutes => $composableBuilder(
    column: $table.notifyBeforeMinutes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defaultTemplateId => $composableBuilder(
    column: $table.defaultTemplateId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get showLunar => $composableBuilder(
    column: $table.showLunar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get showSolarTerm => $composableBuilder(
    column: $table.showSolarTerm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get showColor => $composableBuilder(
    column: $table.showColor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get notifyBeforeMinutes => $composableBuilder(
    column: $table.notifyBeforeMinutes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get defaultTemplateId => $composableBuilder(
    column: $table.defaultTemplateId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get showLunar =>
      $composableBuilder(column: $table.showLunar, builder: (column) => column);

  GeneratedColumn<bool> get showSolarTerm => $composableBuilder(
    column: $table.showSolarTerm,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get showColor =>
      $composableBuilder(column: $table.showColor, builder: (column) => column);

  GeneratedColumn<int> get notifyBeforeMinutes => $composableBuilder(
    column: $table.notifyBeforeMinutes,
    builder: (column) => column,
  );
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          Setting,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
          Setting,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> defaultTemplateId = const Value.absent(),
                Value<bool> showLunar = const Value.absent(),
                Value<bool> showSolarTerm = const Value.absent(),
                Value<bool> showColor = const Value.absent(),
                Value<int> notifyBeforeMinutes = const Value.absent(),
              }) => SettingsCompanion(
                id: id,
                defaultTemplateId: defaultTemplateId,
                showLunar: showLunar,
                showSolarTerm: showSolarTerm,
                showColor: showColor,
                notifyBeforeMinutes: notifyBeforeMinutes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> defaultTemplateId = const Value.absent(),
                Value<bool> showLunar = const Value.absent(),
                Value<bool> showSolarTerm = const Value.absent(),
                Value<bool> showColor = const Value.absent(),
                Value<int> notifyBeforeMinutes = const Value.absent(),
              }) => SettingsCompanion.insert(
                id: id,
                defaultTemplateId: defaultTemplateId,
                showLunar: showLunar,
                showSolarTerm: showSolarTerm,
                showColor: showColor,
                notifyBeforeMinutes: notifyBeforeMinutes,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      Setting,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
      Setting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ShiftsTableTableManager get shifts =>
      $$ShiftsTableTableManager(_db, _db.shifts);
  $$ScheduleTemplatesTableTableManager get scheduleTemplates =>
      $$ScheduleTemplatesTableTableManager(_db, _db.scheduleTemplates);
  $$TemplateDaysTableTableManager get templateDays =>
      $$TemplateDaysTableTableManager(_db, _db.templateDays);
  $$TemplateDayShiftsTableTableManager get templateDayShifts =>
      $$TemplateDayShiftsTableTableManager(_db, _db.templateDayShifts);
  $$ScheduleAnchorsTableTableManager get scheduleAnchors =>
      $$ScheduleAnchorsTableTableManager(_db, _db.scheduleAnchors);
  $$ScheduleOverridesTableTableManager get scheduleOverrides =>
      $$ScheduleOverridesTableTableManager(_db, _db.scheduleOverrides);
  $$ScheduleOverrideShiftsTableTableManager get scheduleOverrideShifts =>
      $$ScheduleOverrideShiftsTableTableManager(
        _db,
        _db.scheduleOverrideShifts,
      );
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
}
