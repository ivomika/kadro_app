// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_database.dart';

// ignore_for_file: type=lint
class $AnimeHistoryTableTable extends AnimeHistoryTable
    with TableInfo<$AnimeHistoryTableTable, AnimeHistoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnimeHistoryTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _anilistMeta = const VerificationMeta(
    'anilist',
  );
  @override
  late final GeneratedColumn<int> anilist = GeneratedColumn<int>(
    'anilist',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
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
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, uuid, anilist, name, image];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'anime_history_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AnimeHistoryTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    }
    if (data.containsKey('anilist')) {
      context.handle(
        _anilistMeta,
        anilist.isAcceptableOrUnknown(data['anilist']!, _anilistMeta),
      );
    } else if (isInserting) {
      context.missing(_anilistMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AnimeHistoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnimeHistoryTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      anilist: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}anilist'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      )!,
    );
  }

  @override
  $AnimeHistoryTableTable createAlias(String alias) {
    return $AnimeHistoryTableTable(attachedDatabase, alias);
  }
}

class AnimeHistoryTableData extends DataClass
    implements Insertable<AnimeHistoryTableData> {
  final int id;
  final String uuid;
  final int anilist;
  final String name;
  final String image;
  const AnimeHistoryTableData({
    required this.id,
    required this.uuid,
    required this.anilist,
    required this.name,
    required this.image,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['anilist'] = Variable<int>(anilist);
    map['name'] = Variable<String>(name);
    map['image'] = Variable<String>(image);
    return map;
  }

  AnimeHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return AnimeHistoryTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      anilist: Value(anilist),
      name: Value(name),
      image: Value(image),
    );
  }

  factory AnimeHistoryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnimeHistoryTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      anilist: serializer.fromJson<int>(json['anilist']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'anilist': serializer.toJson<int>(anilist),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
    };
  }

  AnimeHistoryTableData copyWith({
    int? id,
    String? uuid,
    int? anilist,
    String? name,
    String? image,
  }) => AnimeHistoryTableData(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    anilist: anilist ?? this.anilist,
    name: name ?? this.name,
    image: image ?? this.image,
  );
  AnimeHistoryTableData copyWithCompanion(AnimeHistoryTableCompanion data) {
    return AnimeHistoryTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      anilist: data.anilist.present ? data.anilist.value : this.anilist,
      name: data.name.present ? data.name.value : this.name,
      image: data.image.present ? data.image.value : this.image,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnimeHistoryTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('anilist: $anilist, ')
          ..write('name: $name, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, anilist, name, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnimeHistoryTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.anilist == this.anilist &&
          other.name == this.name &&
          other.image == this.image);
}

class AnimeHistoryTableCompanion
    extends UpdateCompanion<AnimeHistoryTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<int> anilist;
  final Value<String> name;
  final Value<String> image;
  const AnimeHistoryTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.anilist = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
  });
  AnimeHistoryTableCompanion.insert({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    required int anilist,
    required String name,
    required String image,
  }) : anilist = Value(anilist),
       name = Value(name),
       image = Value(image);
  static Insertable<AnimeHistoryTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<int>? anilist,
    Expression<String>? name,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (anilist != null) 'anilist': anilist,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
    });
  }

  AnimeHistoryTableCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<int>? anilist,
    Value<String>? name,
    Value<String>? image,
  }) {
    return AnimeHistoryTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      anilist: anilist ?? this.anilist,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (anilist.present) {
      map['anilist'] = Variable<int>(anilist.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnimeHistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('anilist: $anilist, ')
          ..write('name: $name, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

abstract class _$HistoryDriftDatabase extends GeneratedDatabase {
  _$HistoryDriftDatabase(QueryExecutor e) : super(e);
  $HistoryDriftDatabaseManager get managers =>
      $HistoryDriftDatabaseManager(this);
  late final $AnimeHistoryTableTable animeHistoryTable =
      $AnimeHistoryTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [animeHistoryTable];
}

typedef $$AnimeHistoryTableTableCreateCompanionBuilder =
    AnimeHistoryTableCompanion Function({
      Value<int> id,
      Value<String> uuid,
      required int anilist,
      required String name,
      required String image,
    });
typedef $$AnimeHistoryTableTableUpdateCompanionBuilder =
    AnimeHistoryTableCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<int> anilist,
      Value<String> name,
      Value<String> image,
    });

class $$AnimeHistoryTableTableFilterComposer
    extends Composer<_$HistoryDriftDatabase, $AnimeHistoryTableTable> {
  $$AnimeHistoryTableTableFilterComposer({
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

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get anilist => $composableBuilder(
    column: $table.anilist,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AnimeHistoryTableTableOrderingComposer
    extends Composer<_$HistoryDriftDatabase, $AnimeHistoryTableTable> {
  $$AnimeHistoryTableTableOrderingComposer({
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

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get anilist => $composableBuilder(
    column: $table.anilist,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AnimeHistoryTableTableAnnotationComposer
    extends Composer<_$HistoryDriftDatabase, $AnimeHistoryTableTable> {
  $$AnimeHistoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<int> get anilist =>
      $composableBuilder(column: $table.anilist, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);
}

class $$AnimeHistoryTableTableTableManager
    extends
        RootTableManager<
          _$HistoryDriftDatabase,
          $AnimeHistoryTableTable,
          AnimeHistoryTableData,
          $$AnimeHistoryTableTableFilterComposer,
          $$AnimeHistoryTableTableOrderingComposer,
          $$AnimeHistoryTableTableAnnotationComposer,
          $$AnimeHistoryTableTableCreateCompanionBuilder,
          $$AnimeHistoryTableTableUpdateCompanionBuilder,
          (
            AnimeHistoryTableData,
            BaseReferences<
              _$HistoryDriftDatabase,
              $AnimeHistoryTableTable,
              AnimeHistoryTableData
            >,
          ),
          AnimeHistoryTableData,
          PrefetchHooks Function()
        > {
  $$AnimeHistoryTableTableTableManager(
    _$HistoryDriftDatabase db,
    $AnimeHistoryTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnimeHistoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnimeHistoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnimeHistoryTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<int> anilist = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> image = const Value.absent(),
              }) => AnimeHistoryTableCompanion(
                id: id,
                uuid: uuid,
                anilist: anilist,
                name: name,
                image: image,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                required int anilist,
                required String name,
                required String image,
              }) => AnimeHistoryTableCompanion.insert(
                id: id,
                uuid: uuid,
                anilist: anilist,
                name: name,
                image: image,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AnimeHistoryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$HistoryDriftDatabase,
      $AnimeHistoryTableTable,
      AnimeHistoryTableData,
      $$AnimeHistoryTableTableFilterComposer,
      $$AnimeHistoryTableTableOrderingComposer,
      $$AnimeHistoryTableTableAnnotationComposer,
      $$AnimeHistoryTableTableCreateCompanionBuilder,
      $$AnimeHistoryTableTableUpdateCompanionBuilder,
      (
        AnimeHistoryTableData,
        BaseReferences<
          _$HistoryDriftDatabase,
          $AnimeHistoryTableTable,
          AnimeHistoryTableData
        >,
      ),
      AnimeHistoryTableData,
      PrefetchHooks Function()
    >;

class $HistoryDriftDatabaseManager {
  final _$HistoryDriftDatabase _db;
  $HistoryDriftDatabaseManager(this._db);
  $$AnimeHistoryTableTableTableManager get animeHistoryTable =>
      $$AnimeHistoryTableTableTableManager(_db, _db.animeHistoryTable);
}
