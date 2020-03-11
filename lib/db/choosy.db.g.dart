// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choosy.db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Choice extends DataClass implements Insertable<Choice> {
  final int id;
  final int pid;
  final String choice;
  final DateTime modifiedTime;
  Choice(
      {@required this.id,
      this.pid,
      @required this.choice,
      @required this.modifiedTime});
  factory Choice.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Choice(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
      choice:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}choice']),
      modifiedTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}modified_time']),
    );
  }
  factory Choice.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Choice(
      id: serializer.fromJson<int>(json['id']),
      pid: serializer.fromJson<int>(json['pid']),
      choice: serializer.fromJson<String>(json['choice']),
      modifiedTime: serializer.fromJson<DateTime>(json['modifiedTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pid': serializer.toJson<int>(pid),
      'choice': serializer.toJson<String>(choice),
      'modifiedTime': serializer.toJson<DateTime>(modifiedTime),
    };
  }

  @override
  ChoicesCompanion createCompanion(bool nullToAbsent) {
    return ChoicesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
      choice:
          choice == null && nullToAbsent ? const Value.absent() : Value(choice),
      modifiedTime: modifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedTime),
    );
  }

  Choice copyWith({int id, int pid, String choice, DateTime modifiedTime}) =>
      Choice(
        id: id ?? this.id,
        pid: pid ?? this.pid,
        choice: choice ?? this.choice,
        modifiedTime: modifiedTime ?? this.modifiedTime,
      );
  @override
  String toString() {
    return (StringBuffer('Choice(')
          ..write('id: $id, ')
          ..write('pid: $pid, ')
          ..write('choice: $choice, ')
          ..write('modifiedTime: $modifiedTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(pid.hashCode, $mrjc(choice.hashCode, modifiedTime.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Choice &&
          other.id == this.id &&
          other.pid == this.pid &&
          other.choice == this.choice &&
          other.modifiedTime == this.modifiedTime);
}

class ChoicesCompanion extends UpdateCompanion<Choice> {
  final Value<int> id;
  final Value<int> pid;
  final Value<String> choice;
  final Value<DateTime> modifiedTime;
  const ChoicesCompanion({
    this.id = const Value.absent(),
    this.pid = const Value.absent(),
    this.choice = const Value.absent(),
    this.modifiedTime = const Value.absent(),
  });
  ChoicesCompanion.insert({
    this.id = const Value.absent(),
    this.pid = const Value.absent(),
    @required String choice,
    this.modifiedTime = const Value.absent(),
  }) : choice = Value(choice);
  ChoicesCompanion copyWith(
      {Value<int> id,
      Value<int> pid,
      Value<String> choice,
      Value<DateTime> modifiedTime}) {
    return ChoicesCompanion(
      id: id ?? this.id,
      pid: pid ?? this.pid,
      choice: choice ?? this.choice,
      modifiedTime: modifiedTime ?? this.modifiedTime,
    );
  }
}

class $ChoicesTable extends Choices with TableInfo<$ChoicesTable, Choice> {
  final GeneratedDatabase _db;
  final String _alias;
  $ChoicesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  @override
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn(
      'pid',
      $tableName,
      true,
    );
  }

  final VerificationMeta _choiceMeta = const VerificationMeta('choice');
  GeneratedTextColumn _choice;
  @override
  GeneratedTextColumn get choice => _choice ??= _constructChoice();
  GeneratedTextColumn _constructChoice() {
    return GeneratedTextColumn(
      'choice',
      $tableName,
      false,
    );
  }

  final VerificationMeta _modifiedTimeMeta =
      const VerificationMeta('modifiedTime');
  GeneratedDateTimeColumn _modifiedTime;
  @override
  GeneratedDateTimeColumn get modifiedTime =>
      _modifiedTime ??= _constructModifiedTime();
  GeneratedDateTimeColumn _constructModifiedTime() {
    return GeneratedDateTimeColumn('modified_time', $tableName, false,
        defaultValue: Constant(DateTime.now()));
  }

  @override
  List<GeneratedColumn> get $columns => [id, pid, choice, modifiedTime];
  @override
  $ChoicesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'choices';
  @override
  final String actualTableName = 'choices';
  @override
  VerificationContext validateIntegrity(ChoicesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.pid.present) {
      context.handle(_pidMeta, pid.isAcceptableValue(d.pid.value, _pidMeta));
    }
    if (d.choice.present) {
      context.handle(
          _choiceMeta, choice.isAcceptableValue(d.choice.value, _choiceMeta));
    } else if (isInserting) {
      context.missing(_choiceMeta);
    }
    if (d.modifiedTime.present) {
      context.handle(
          _modifiedTimeMeta,
          modifiedTime.isAcceptableValue(
              d.modifiedTime.value, _modifiedTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Choice map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Choice.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ChoicesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.pid.present) {
      map['pid'] = Variable<int, IntType>(d.pid.value);
    }
    if (d.choice.present) {
      map['choice'] = Variable<String, StringType>(d.choice.value);
    }
    if (d.modifiedTime.present) {
      map['modified_time'] =
          Variable<DateTime, DateTimeType>(d.modifiedTime.value);
    }
    return map;
  }

  @override
  $ChoicesTable createAlias(String alias) {
    return $ChoicesTable(_db, alias);
  }
}

class Pick extends DataClass implements Insertable<Pick> {
  final int id;
  final String title;
  final DateTime modifiedTime;
  final DateTime lastPlayedTime;
  Pick(
      {@required this.id,
      @required this.title,
      @required this.modifiedTime,
      @required this.lastPlayedTime});
  factory Pick.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Pick(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      modifiedTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}modified_time']),
      lastPlayedTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_played_time']),
    );
  }
  factory Pick.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Pick(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      modifiedTime: serializer.fromJson<DateTime>(json['modifiedTime']),
      lastPlayedTime: serializer.fromJson<DateTime>(json['lastPlayedTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'modifiedTime': serializer.toJson<DateTime>(modifiedTime),
      'lastPlayedTime': serializer.toJson<DateTime>(lastPlayedTime),
    };
  }

  @override
  PicksCompanion createCompanion(bool nullToAbsent) {
    return PicksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      modifiedTime: modifiedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedTime),
      lastPlayedTime: lastPlayedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPlayedTime),
    );
  }

  Pick copyWith(
          {int id,
          String title,
          DateTime modifiedTime,
          DateTime lastPlayedTime}) =>
      Pick(
        id: id ?? this.id,
        title: title ?? this.title,
        modifiedTime: modifiedTime ?? this.modifiedTime,
        lastPlayedTime: lastPlayedTime ?? this.lastPlayedTime,
      );
  @override
  String toString() {
    return (StringBuffer('Pick(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('modifiedTime: $modifiedTime, ')
          ..write('lastPlayedTime: $lastPlayedTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(title.hashCode,
          $mrjc(modifiedTime.hashCode, lastPlayedTime.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Pick &&
          other.id == this.id &&
          other.title == this.title &&
          other.modifiedTime == this.modifiedTime &&
          other.lastPlayedTime == this.lastPlayedTime);
}

class PicksCompanion extends UpdateCompanion<Pick> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime> modifiedTime;
  final Value<DateTime> lastPlayedTime;
  const PicksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.modifiedTime = const Value.absent(),
    this.lastPlayedTime = const Value.absent(),
  });
  PicksCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    this.modifiedTime = const Value.absent(),
    this.lastPlayedTime = const Value.absent(),
  }) : title = Value(title);
  PicksCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<DateTime> modifiedTime,
      Value<DateTime> lastPlayedTime}) {
    return PicksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      modifiedTime: modifiedTime ?? this.modifiedTime,
      lastPlayedTime: lastPlayedTime ?? this.lastPlayedTime,
    );
  }
}

class $PicksTable extends Picks with TableInfo<$PicksTable, Pick> {
  final GeneratedDatabase _db;
  final String _alias;
  $PicksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _modifiedTimeMeta =
      const VerificationMeta('modifiedTime');
  GeneratedDateTimeColumn _modifiedTime;
  @override
  GeneratedDateTimeColumn get modifiedTime =>
      _modifiedTime ??= _constructModifiedTime();
  GeneratedDateTimeColumn _constructModifiedTime() {
    return GeneratedDateTimeColumn('modified_time', $tableName, false,
        defaultValue: Constant(DateTime.now()));
  }

  final VerificationMeta _lastPlayedTimeMeta =
      const VerificationMeta('lastPlayedTime');
  GeneratedDateTimeColumn _lastPlayedTime;
  @override
  GeneratedDateTimeColumn get lastPlayedTime =>
      _lastPlayedTime ??= _constructLastPlayedTime();
  GeneratedDateTimeColumn _constructLastPlayedTime() {
    return GeneratedDateTimeColumn('last_played_time', $tableName, false,
        defaultValue: Constant(DateTime.now()));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, modifiedTime, lastPlayedTime];
  @override
  $PicksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'picks';
  @override
  final String actualTableName = 'picks';
  @override
  VerificationContext validateIntegrity(PicksCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (d.modifiedTime.present) {
      context.handle(
          _modifiedTimeMeta,
          modifiedTime.isAcceptableValue(
              d.modifiedTime.value, _modifiedTimeMeta));
    }
    if (d.lastPlayedTime.present) {
      context.handle(
          _lastPlayedTimeMeta,
          lastPlayedTime.isAcceptableValue(
              d.lastPlayedTime.value, _lastPlayedTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pick map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Pick.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(PicksCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.modifiedTime.present) {
      map['modified_time'] =
          Variable<DateTime, DateTimeType>(d.modifiedTime.value);
    }
    if (d.lastPlayedTime.present) {
      map['last_played_time'] =
          Variable<DateTime, DateTimeType>(d.lastPlayedTime.value);
    }
    return map;
  }

  @override
  $PicksTable createAlias(String alias) {
    return $PicksTable(_db, alias);
  }
}

abstract class _$ChoosyDatabase extends GeneratedDatabase {
  _$ChoosyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ChoicesTable _choices;
  $ChoicesTable get choices => _choices ??= $ChoicesTable(this);
  $PicksTable _picks;
  $PicksTable get picks => _picks ??= $PicksTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [choices, picks];
}
