// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anilist_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnilistResponse _$AnilistResponseFromJson(Map<String, dynamic> json) =>
    _AnilistResponse(
      data: AnilistData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnilistResponseToJson(_AnilistResponse instance) =>
    <String, dynamic>{'data': instance.data};

_AnilistData _$AnilistDataFromJson(Map<String, dynamic> json) => _AnilistData(
  media: AnilistMedia.fromJson(json['Media'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AnilistDataToJson(_AnilistData instance) =>
    <String, dynamic>{'Media': instance.media};

_AnilistMedia _$AnilistMediaFromJson(
  Map<String, dynamic> json,
) => _AnilistMedia(
  id: (json['id'] as num).toInt(),
  idMal: (json['idMal'] as num?)?.toInt(),
  title: AnilistTitle.fromJson(json['title'] as Map<String, dynamic>),
  description: json['description'] as String?,
  format: json['format'] as String?,
  status: json['status'] as String?,
  episodes: (json['episodes'] as num?)?.toInt(),
  duration: (json['duration'] as num?)?.toInt(),
  season: json['season'] as String?,
  seasonYear: (json['seasonYear'] as num?)?.toInt(),
  averageScore: (json['averageScore'] as num?)?.toInt(),
  popularity: (json['popularity'] as num?)?.toInt(),
  genres: (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
  coverImage: AnilistCoverImage.fromJson(
    json['coverImage'] as Map<String, dynamic>,
  ),
  bannerImage: json['bannerImage'] as String?,
  startDate: AnilistFuzzyDate.fromJson(
    json['startDate'] as Map<String, dynamic>,
  ),
  endDate: AnilistFuzzyDate.fromJson(json['endDate'] as Map<String, dynamic>),
  studios: AnilistStudios.fromJson(json['studios'] as Map<String, dynamic>),
  trailer: json['trailer'] == null
      ? null
      : AnilistTrailer.fromJson(json['trailer'] as Map<String, dynamic>),
  siteUrl: json['siteUrl'] as String?,
);

Map<String, dynamic> _$AnilistMediaToJson(_AnilistMedia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idMal': instance.idMal,
      'title': instance.title,
      'description': instance.description,
      'format': instance.format,
      'status': instance.status,
      'episodes': instance.episodes,
      'duration': instance.duration,
      'season': instance.season,
      'seasonYear': instance.seasonYear,
      'averageScore': instance.averageScore,
      'popularity': instance.popularity,
      'genres': instance.genres,
      'coverImage': instance.coverImage,
      'bannerImage': instance.bannerImage,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'studios': instance.studios,
      'trailer': instance.trailer,
      'siteUrl': instance.siteUrl,
    };

_AnilistTitle _$AnilistTitleFromJson(Map<String, dynamic> json) =>
    _AnilistTitle(
      romaji: json['romaji'] as String?,
      english: json['english'] as String?,
      nativeTitle: json['native'] as String?,
    );

Map<String, dynamic> _$AnilistTitleToJson(_AnilistTitle instance) =>
    <String, dynamic>{
      'romaji': instance.romaji,
      'english': instance.english,
      'native': instance.nativeTitle,
    };

_AnilistCoverImage _$AnilistCoverImageFromJson(Map<String, dynamic> json) =>
    _AnilistCoverImage(
      large: json['large'] as String?,
      extraLarge: json['extraLarge'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$AnilistCoverImageToJson(_AnilistCoverImage instance) =>
    <String, dynamic>{
      'large': instance.large,
      'extraLarge': instance.extraLarge,
      'color': instance.color,
    };

_AnilistFuzzyDate _$AnilistFuzzyDateFromJson(Map<String, dynamic> json) =>
    _AnilistFuzzyDate(
      year: (json['year'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      day: (json['day'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AnilistFuzzyDateToJson(_AnilistFuzzyDate instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
    };

_AnilistStudios _$AnilistStudiosFromJson(Map<String, dynamic> json) =>
    _AnilistStudios(
      nodes: (json['nodes'] as List<dynamic>)
          .map((e) => AnilistStudioNode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnilistStudiosToJson(_AnilistStudios instance) =>
    <String, dynamic>{'nodes': instance.nodes};

_AnilistStudioNode _$AnilistStudioNodeFromJson(Map<String, dynamic> json) =>
    _AnilistStudioNode(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$AnilistStudioNodeToJson(_AnilistStudioNode instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_AnilistTrailer _$AnilistTrailerFromJson(Map<String, dynamic> json) =>
    _AnilistTrailer(
      id: json['id'] as String?,
      site: json['site'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$AnilistTrailerToJson(_AnilistTrailer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'site': instance.site,
      'thumbnail': instance.thumbnail,
    };
