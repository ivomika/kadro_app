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
  type: json['type'] as String?,
  title: AnilistTitle.fromJson(json['title'] as Map<String, dynamic>),
  description: json['description'] as String?,
  format: json['format'] as String?,
  status: json['status'] as String?,
  episodes: (json['episodes'] as num?)?.toInt(),
  duration: (json['duration'] as num?)?.toInt(),
  season: json['season'] as String?,
  seasonYear: (json['seasonYear'] as num?)?.toInt(),
  averageScore: (json['averageScore'] as num?)?.toInt(),
  meanScore: (json['meanScore'] as num?)?.toInt(),
  popularity: (json['popularity'] as num?)?.toInt(),
  trending: (json['trending'] as num?)?.toInt(),
  favourites: (json['favourites'] as num?)?.toInt(),
  countryOfOrigin: json['countryOfOrigin'] as String?,
  source: json['source'] as String?,
  isLicensed: json['isLicensed'] as bool?,
  genres: (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
  synonyms: (json['synonyms'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  tags: (json['tags'] as List<dynamic>)
      .map((e) => AnilistTag.fromJson(e as Map<String, dynamic>))
      .toList(),
  rankings: (json['rankings'] as List<dynamic>)
      .map((e) => AnilistRanking.fromJson(e as Map<String, dynamic>))
      .toList(),
  coverImage: AnilistCoverImage.fromJson(
    json['coverImage'] as Map<String, dynamic>,
  ),
  bannerImage: json['bannerImage'] as String?,
  startDate: AnilistFuzzyDate.fromJson(
    json['startDate'] as Map<String, dynamic>,
  ),
  endDate: AnilistFuzzyDate.fromJson(json['endDate'] as Map<String, dynamic>),
  studios: AnilistStudios.fromJson(json['studios'] as Map<String, dynamic>),
  siteUrl: json['siteUrl'] as String?,
);

Map<String, dynamic> _$AnilistMediaToJson(_AnilistMedia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idMal': instance.idMal,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'format': instance.format,
      'status': instance.status,
      'episodes': instance.episodes,
      'duration': instance.duration,
      'season': instance.season,
      'seasonYear': instance.seasonYear,
      'averageScore': instance.averageScore,
      'meanScore': instance.meanScore,
      'popularity': instance.popularity,
      'trending': instance.trending,
      'favourites': instance.favourites,
      'countryOfOrigin': instance.countryOfOrigin,
      'source': instance.source,
      'isLicensed': instance.isLicensed,
      'genres': instance.genres,
      'synonyms': instance.synonyms,
      'tags': instance.tags,
      'rankings': instance.rankings,
      'coverImage': instance.coverImage,
      'bannerImage': instance.bannerImage,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'studios': instance.studios,
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

_AnilistTag _$AnilistTagFromJson(Map<String, dynamic> json) => _AnilistTag(
  name: json['name'] as String,
  rank: (json['rank'] as num?)?.toInt(),
  isMediaSpoiler: json['isMediaSpoiler'] as bool?,
  category: json['category'] as String?,
);

Map<String, dynamic> _$AnilistTagToJson(_AnilistTag instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rank': instance.rank,
      'isMediaSpoiler': instance.isMediaSpoiler,
      'category': instance.category,
    };

_AnilistRanking _$AnilistRankingFromJson(Map<String, dynamic> json) =>
    _AnilistRanking(
      rank: (json['rank'] as num).toInt(),
      type: json['type'] as String?,
      year: (json['year'] as num?)?.toInt(),
      season: json['season'] as String?,
      allTime: json['allTime'] as bool?,
      context: json['context'] as String?,
    );

Map<String, dynamic> _$AnilistRankingToJson(_AnilistRanking instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'type': instance.type,
      'year': instance.year,
      'season': instance.season,
      'allTime': instance.allTime,
      'context': instance.context,
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
      edges: (json['edges'] as List<dynamic>)
          .map((e) => AnilistStudioEdge.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnilistStudiosToJson(_AnilistStudios instance) =>
    <String, dynamic>{'edges': instance.edges};

_AnilistStudioEdge _$AnilistStudioEdgeFromJson(Map<String, dynamic> json) =>
    _AnilistStudioEdge(
      isMain: json['isMain'] as bool?,
      node: AnilistStudioNode.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnilistStudioEdgeToJson(_AnilistStudioEdge instance) =>
    <String, dynamic>{'isMain': instance.isMain, 'node': instance.node};

_AnilistStudioNode _$AnilistStudioNodeFromJson(Map<String, dynamic> json) =>
    _AnilistStudioNode(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$AnilistStudioNodeToJson(_AnilistStudioNode instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
