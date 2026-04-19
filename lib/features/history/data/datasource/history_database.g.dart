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
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
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
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _similarityMeta = const VerificationMeta(
    'similarity',
  );
  @override
  late final GeneratedColumn<double> similarity = GeneratedColumn<double>(
    'similarity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _formatMeta = const VerificationMeta('format');
  @override
  late final GeneratedColumn<String> format = GeneratedColumn<String>(
    'format',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seasonMeta = const VerificationMeta('season');
  @override
  late final GeneratedColumn<String> season = GeneratedColumn<String>(
    'season',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seasonYearMeta = const VerificationMeta(
    'seasonYear',
  );
  @override
  late final GeneratedColumn<int> seasonYear = GeneratedColumn<int>(
    'season_year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _episodesMeta = const VerificationMeta(
    'episodes',
  );
  @override
  late final GeneratedColumn<int> episodes = GeneratedColumn<int>(
    'episodes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
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
    name,
    imageUrl,
    similarity,
    format,
    status,
    season,
    seasonYear,
    episodes,
    description,
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
    } else if (isInserting) {
      context.missing(_uuidMeta);
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
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('similarity')) {
      context.handle(
        _similarityMeta,
        similarity.isAcceptableOrUnknown(data['similarity']!, _similarityMeta),
      );
    } else if (isInserting) {
      context.missing(_similarityMeta);
    }
    if (data.containsKey('format')) {
      context.handle(
        _formatMeta,
        format.isAcceptableOrUnknown(data['format']!, _formatMeta),
      );
    } else if (isInserting) {
      context.missing(_formatMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('season')) {
      context.handle(
        _seasonMeta,
        season.isAcceptableOrUnknown(data['season']!, _seasonMeta),
      );
    } else if (isInserting) {
      context.missing(_seasonMeta);
    }
    if (data.containsKey('season_year')) {
      context.handle(
        _seasonYearMeta,
        seasonYear.isAcceptableOrUnknown(data['season_year']!, _seasonYearMeta),
      );
    } else if (isInserting) {
      context.missing(_seasonYearMeta);
    }
    if (data.containsKey('episodes')) {
      context.handle(
        _episodesMeta,
        episodes.isAcceptableOrUnknown(data['episodes']!, _episodesMeta),
      );
    } else if (isInserting) {
      context.missing(_episodesMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
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
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
      similarity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}similarity'],
      )!,
      format: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}format'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      season: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}season'],
      )!,
      seasonYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}season_year'],
      )!,
      episodes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episodes'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
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
  final String imageUrl;
  final double similarity;
  final String format;
  final String status;
  final String season;
  final int seasonYear;
  final int episodes;
  final String description;
  const AnimeHistoryTableData({
    required this.id,
    required this.uuid,
    required this.anilist,
    required this.name,
    required this.imageUrl,
    required this.similarity,
    required this.format,
    required this.status,
    required this.season,
    required this.seasonYear,
    required this.episodes,
    required this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['anilist'] = Variable<int>(anilist);
    map['name'] = Variable<String>(name);
    map['image_url'] = Variable<String>(imageUrl);
    map['similarity'] = Variable<double>(similarity);
    map['format'] = Variable<String>(format);
    map['status'] = Variable<String>(status);
    map['season'] = Variable<String>(season);
    map['season_year'] = Variable<int>(seasonYear);
    map['episodes'] = Variable<int>(episodes);
    map['description'] = Variable<String>(description);
    return map;
  }

  AnimeHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return AnimeHistoryTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      anilist: Value(anilist),
      name: Value(name),
      imageUrl: Value(imageUrl),
      similarity: Value(similarity),
      format: Value(format),
      status: Value(status),
      season: Value(season),
      seasonYear: Value(seasonYear),
      episodes: Value(episodes),
      description: Value(description),
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
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      similarity: serializer.fromJson<double>(json['similarity']),
      format: serializer.fromJson<String>(json['format']),
      status: serializer.fromJson<String>(json['status']),
      season: serializer.fromJson<String>(json['season']),
      seasonYear: serializer.fromJson<int>(json['seasonYear']),
      episodes: serializer.fromJson<int>(json['episodes']),
      description: serializer.fromJson<String>(json['description']),
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
      'imageUrl': serializer.toJson<String>(imageUrl),
      'similarity': serializer.toJson<double>(similarity),
      'format': serializer.toJson<String>(format),
      'status': serializer.toJson<String>(status),
      'season': serializer.toJson<String>(season),
      'seasonYear': serializer.toJson<int>(seasonYear),
      'episodes': serializer.toJson<int>(episodes),
      'description': serializer.toJson<String>(description),
    };
  }

  AnimeHistoryTableData copyWith({
    int? id,
    String? uuid,
    int? anilist,
    String? name,
    String? imageUrl,
    double? similarity,
    String? format,
    String? status,
    String? season,
    int? seasonYear,
    int? episodes,
    String? description,
  }) => AnimeHistoryTableData(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    anilist: anilist ?? this.anilist,
    name: name ?? this.name,
    imageUrl: imageUrl ?? this.imageUrl,
    similarity: similarity ?? this.similarity,
    format: format ?? this.format,
    status: status ?? this.status,
    season: season ?? this.season,
    seasonYear: seasonYear ?? this.seasonYear,
    episodes: episodes ?? this.episodes,
    description: description ?? this.description,
  );
  AnimeHistoryTableData copyWithCompanion(AnimeHistoryTableCompanion data) {
    return AnimeHistoryTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      anilist: data.anilist.present ? data.anilist.value : this.anilist,
      name: data.name.present ? data.name.value : this.name,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      similarity: data.similarity.present
          ? data.similarity.value
          : this.similarity,
      format: data.format.present ? data.format.value : this.format,
      status: data.status.present ? data.status.value : this.status,
      season: data.season.present ? data.season.value : this.season,
      seasonYear: data.seasonYear.present
          ? data.seasonYear.value
          : this.seasonYear,
      episodes: data.episodes.present ? data.episodes.value : this.episodes,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnimeHistoryTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('anilist: $anilist, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('similarity: $similarity, ')
          ..write('format: $format, ')
          ..write('status: $status, ')
          ..write('season: $season, ')
          ..write('seasonYear: $seasonYear, ')
          ..write('episodes: $episodes, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    anilist,
    name,
    imageUrl,
    similarity,
    format,
    status,
    season,
    seasonYear,
    episodes,
    description,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnimeHistoryTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.anilist == this.anilist &&
          other.name == this.name &&
          other.imageUrl == this.imageUrl &&
          other.similarity == this.similarity &&
          other.format == this.format &&
          other.status == this.status &&
          other.season == this.season &&
          other.seasonYear == this.seasonYear &&
          other.episodes == this.episodes &&
          other.description == this.description);
}

class AnimeHistoryTableCompanion
    extends UpdateCompanion<AnimeHistoryTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<int> anilist;
  final Value<String> name;
  final Value<String> imageUrl;
  final Value<double> similarity;
  final Value<String> format;
  final Value<String> status;
  final Value<String> season;
  final Value<int> seasonYear;
  final Value<int> episodes;
  final Value<String> description;
  const AnimeHistoryTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.anilist = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.similarity = const Value.absent(),
    this.format = const Value.absent(),
    this.status = const Value.absent(),
    this.season = const Value.absent(),
    this.seasonYear = const Value.absent(),
    this.episodes = const Value.absent(),
    this.description = const Value.absent(),
  });
  AnimeHistoryTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required int anilist,
    required String name,
    required String imageUrl,
    required double similarity,
    required String format,
    required String status,
    required String season,
    required int seasonYear,
    required int episodes,
    required String description,
  }) : uuid = Value(uuid),
       anilist = Value(anilist),
       name = Value(name),
       imageUrl = Value(imageUrl),
       similarity = Value(similarity),
       format = Value(format),
       status = Value(status),
       season = Value(season),
       seasonYear = Value(seasonYear),
       episodes = Value(episodes),
       description = Value(description);
  static Insertable<AnimeHistoryTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<int>? anilist,
    Expression<String>? name,
    Expression<String>? imageUrl,
    Expression<double>? similarity,
    Expression<String>? format,
    Expression<String>? status,
    Expression<String>? season,
    Expression<int>? seasonYear,
    Expression<int>? episodes,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (anilist != null) 'anilist': anilist,
      if (name != null) 'name': name,
      if (imageUrl != null) 'image_url': imageUrl,
      if (similarity != null) 'similarity': similarity,
      if (format != null) 'format': format,
      if (status != null) 'status': status,
      if (season != null) 'season': season,
      if (seasonYear != null) 'season_year': seasonYear,
      if (episodes != null) 'episodes': episodes,
      if (description != null) 'description': description,
    });
  }

  AnimeHistoryTableCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<int>? anilist,
    Value<String>? name,
    Value<String>? imageUrl,
    Value<double>? similarity,
    Value<String>? format,
    Value<String>? status,
    Value<String>? season,
    Value<int>? seasonYear,
    Value<int>? episodes,
    Value<String>? description,
  }) {
    return AnimeHistoryTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      anilist: anilist ?? this.anilist,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      similarity: similarity ?? this.similarity,
      format: format ?? this.format,
      status: status ?? this.status,
      season: season ?? this.season,
      seasonYear: seasonYear ?? this.seasonYear,
      episodes: episodes ?? this.episodes,
      description: description ?? this.description,
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
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (similarity.present) {
      map['similarity'] = Variable<double>(similarity.value);
    }
    if (format.present) {
      map['format'] = Variable<String>(format.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (season.present) {
      map['season'] = Variable<String>(season.value);
    }
    if (seasonYear.present) {
      map['season_year'] = Variable<int>(seasonYear.value);
    }
    if (episodes.present) {
      map['episodes'] = Variable<int>(episodes.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
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
          ..write('imageUrl: $imageUrl, ')
          ..write('similarity: $similarity, ')
          ..write('format: $format, ')
          ..write('status: $status, ')
          ..write('season: $season, ')
          ..write('seasonYear: $seasonYear, ')
          ..write('episodes: $episodes, ')
          ..write('description: $description')
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
      required String uuid,
      required int anilist,
      required String name,
      required String imageUrl,
      required double similarity,
      required String format,
      required String status,
      required String season,
      required int seasonYear,
      required int episodes,
      required String description,
    });
typedef $$AnimeHistoryTableTableUpdateCompanionBuilder =
    AnimeHistoryTableCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<int> anilist,
      Value<String> name,
      Value<String> imageUrl,
      Value<double> similarity,
      Value<String> format,
      Value<String> status,
      Value<String> season,
      Value<int> seasonYear,
      Value<int> episodes,
      Value<String> description,
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

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get similarity => $composableBuilder(
    column: $table.similarity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get format => $composableBuilder(
    column: $table.format,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get season => $composableBuilder(
    column: $table.season,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seasonYear => $composableBuilder(
    column: $table.seasonYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get episodes => $composableBuilder(
    column: $table.episodes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
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

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get similarity => $composableBuilder(
    column: $table.similarity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get format => $composableBuilder(
    column: $table.format,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get season => $composableBuilder(
    column: $table.season,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seasonYear => $composableBuilder(
    column: $table.seasonYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get episodes => $composableBuilder(
    column: $table.episodes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
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

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<double> get similarity => $composableBuilder(
    column: $table.similarity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get format =>
      $composableBuilder(column: $table.format, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get season =>
      $composableBuilder(column: $table.season, builder: (column) => column);

  GeneratedColumn<int> get seasonYear => $composableBuilder(
    column: $table.seasonYear,
    builder: (column) => column,
  );

  GeneratedColumn<int> get episodes =>
      $composableBuilder(column: $table.episodes, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
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
                Value<String> imageUrl = const Value.absent(),
                Value<double> similarity = const Value.absent(),
                Value<String> format = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> season = const Value.absent(),
                Value<int> seasonYear = const Value.absent(),
                Value<int> episodes = const Value.absent(),
                Value<String> description = const Value.absent(),
              }) => AnimeHistoryTableCompanion(
                id: id,
                uuid: uuid,
                anilist: anilist,
                name: name,
                imageUrl: imageUrl,
                similarity: similarity,
                format: format,
                status: status,
                season: season,
                seasonYear: seasonYear,
                episodes: episodes,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                required int anilist,
                required String name,
                required String imageUrl,
                required double similarity,
                required String format,
                required String status,
                required String season,
                required int seasonYear,
                required int episodes,
                required String description,
              }) => AnimeHistoryTableCompanion.insert(
                id: id,
                uuid: uuid,
                anilist: anilist,
                name: name,
                imageUrl: imageUrl,
                similarity: similarity,
                format: format,
                status: status,
                season: season,
                seasonYear: seasonYear,
                episodes: episodes,
                description: description,
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
