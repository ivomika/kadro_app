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
  static const VerificationMeta _filenameMeta = const VerificationMeta(
    'filename',
  );
  @override
  late final GeneratedColumn<String> filename = GeneratedColumn<String>(
    'filename',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _episodeMeta = const VerificationMeta(
    'episode',
  );
  @override
  late final GeneratedColumn<int> episode = GeneratedColumn<int>(
    'episode',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _videoMeta = const VerificationMeta('video');
  @override
  late final GeneratedColumn<String> video = GeneratedColumn<String>(
    'video',
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
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    anilist,
    filename,
    episode,
    video,
    image,
  ];
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
    if (data.containsKey('filename')) {
      context.handle(
        _filenameMeta,
        filename.isAcceptableOrUnknown(data['filename']!, _filenameMeta),
      );
    } else if (isInserting) {
      context.missing(_filenameMeta);
    }
    if (data.containsKey('episode')) {
      context.handle(
        _episodeMeta,
        episode.isAcceptableOrUnknown(data['episode']!, _episodeMeta),
      );
    }
    if (data.containsKey('video')) {
      context.handle(
        _videoMeta,
        video.isAcceptableOrUnknown(data['video']!, _videoMeta),
      );
    } else if (isInserting) {
      context.missing(_videoMeta);
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
      filename: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}filename'],
      )!,
      episode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episode'],
      ),
      video: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}video'],
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
  final String filename;
  final int? episode;
  final String video;
  final String image;
  const AnimeHistoryTableData({
    required this.id,
    required this.uuid,
    required this.anilist,
    required this.filename,
    this.episode,
    required this.video,
    required this.image,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['anilist'] = Variable<int>(anilist);
    map['filename'] = Variable<String>(filename);
    if (!nullToAbsent || episode != null) {
      map['episode'] = Variable<int>(episode);
    }
    map['video'] = Variable<String>(video);
    map['image'] = Variable<String>(image);
    return map;
  }

  AnimeHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return AnimeHistoryTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      anilist: Value(anilist),
      filename: Value(filename),
      episode: episode == null && nullToAbsent
          ? const Value.absent()
          : Value(episode),
      video: Value(video),
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
      filename: serializer.fromJson<String>(json['filename']),
      episode: serializer.fromJson<int?>(json['episode']),
      video: serializer.fromJson<String>(json['video']),
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
      'filename': serializer.toJson<String>(filename),
      'episode': serializer.toJson<int?>(episode),
      'video': serializer.toJson<String>(video),
      'image': serializer.toJson<String>(image),
    };
  }

  AnimeHistoryTableData copyWith({
    int? id,
    String? uuid,
    int? anilist,
    String? filename,
    Value<int?> episode = const Value.absent(),
    String? video,
    String? image,
  }) => AnimeHistoryTableData(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    anilist: anilist ?? this.anilist,
    filename: filename ?? this.filename,
    episode: episode.present ? episode.value : this.episode,
    video: video ?? this.video,
    image: image ?? this.image,
  );
  AnimeHistoryTableData copyWithCompanion(AnimeHistoryTableCompanion data) {
    return AnimeHistoryTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      anilist: data.anilist.present ? data.anilist.value : this.anilist,
      filename: data.filename.present ? data.filename.value : this.filename,
      episode: data.episode.present ? data.episode.value : this.episode,
      video: data.video.present ? data.video.value : this.video,
      image: data.image.present ? data.image.value : this.image,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnimeHistoryTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('anilist: $anilist, ')
          ..write('filename: $filename, ')
          ..write('episode: $episode, ')
          ..write('video: $video, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, uuid, anilist, filename, episode, video, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnimeHistoryTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.anilist == this.anilist &&
          other.filename == this.filename &&
          other.episode == this.episode &&
          other.video == this.video &&
          other.image == this.image);
}

class AnimeHistoryTableCompanion
    extends UpdateCompanion<AnimeHistoryTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<int> anilist;
  final Value<String> filename;
  final Value<int?> episode;
  final Value<String> video;
  final Value<String> image;
  const AnimeHistoryTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.anilist = const Value.absent(),
    this.filename = const Value.absent(),
    this.episode = const Value.absent(),
    this.video = const Value.absent(),
    this.image = const Value.absent(),
  });
  AnimeHistoryTableCompanion.insert({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    required int anilist,
    required String filename,
    this.episode = const Value.absent(),
    required String video,
    required String image,
  }) : anilist = Value(anilist),
       filename = Value(filename),
       video = Value(video),
       image = Value(image);
  static Insertable<AnimeHistoryTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<int>? anilist,
    Expression<String>? filename,
    Expression<int>? episode,
    Expression<String>? video,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (anilist != null) 'anilist': anilist,
      if (filename != null) 'filename': filename,
      if (episode != null) 'episode': episode,
      if (video != null) 'video': video,
      if (image != null) 'image': image,
    });
  }

  AnimeHistoryTableCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<int>? anilist,
    Value<String>? filename,
    Value<int?>? episode,
    Value<String>? video,
    Value<String>? image,
  }) {
    return AnimeHistoryTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      anilist: anilist ?? this.anilist,
      filename: filename ?? this.filename,
      episode: episode ?? this.episode,
      video: video ?? this.video,
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
    if (filename.present) {
      map['filename'] = Variable<String>(filename.value);
    }
    if (episode.present) {
      map['episode'] = Variable<int>(episode.value);
    }
    if (video.present) {
      map['video'] = Variable<String>(video.value);
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
          ..write('filename: $filename, ')
          ..write('episode: $episode, ')
          ..write('video: $video, ')
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
      required String filename,
      Value<int?> episode,
      required String video,
      required String image,
    });
typedef $$AnimeHistoryTableTableUpdateCompanionBuilder =
    AnimeHistoryTableCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<int> anilist,
      Value<String> filename,
      Value<int?> episode,
      Value<String> video,
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

  ColumnFilters<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get episode => $composableBuilder(
    column: $table.episode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get video => $composableBuilder(
    column: $table.video,
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

  ColumnOrderings<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get episode => $composableBuilder(
    column: $table.episode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get video => $composableBuilder(
    column: $table.video,
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

  GeneratedColumn<String> get filename =>
      $composableBuilder(column: $table.filename, builder: (column) => column);

  GeneratedColumn<int> get episode =>
      $composableBuilder(column: $table.episode, builder: (column) => column);

  GeneratedColumn<String> get video =>
      $composableBuilder(column: $table.video, builder: (column) => column);

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
                Value<String> filename = const Value.absent(),
                Value<int?> episode = const Value.absent(),
                Value<String> video = const Value.absent(),
                Value<String> image = const Value.absent(),
              }) => AnimeHistoryTableCompanion(
                id: id,
                uuid: uuid,
                anilist: anilist,
                filename: filename,
                episode: episode,
                video: video,
                image: image,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                required int anilist,
                required String filename,
                Value<int?> episode = const Value.absent(),
                required String video,
                required String image,
              }) => AnimeHistoryTableCompanion.insert(
                id: id,
                uuid: uuid,
                anilist: anilist,
                filename: filename,
                episode: episode,
                video: video,
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
