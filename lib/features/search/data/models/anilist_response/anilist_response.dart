import 'package:freezed_annotation/freezed_annotation.dart';

part 'anilist_response.freezed.dart';
part 'anilist_response.g.dart';

@freezed
abstract class AnilistResponse with _$AnilistResponse {
  const factory AnilistResponse({
    required AnilistData data,
  }) = _AnilistResponse;

  factory AnilistResponse.fromJson(Map<String, Object?> json) =>
      _$AnilistResponseFromJson(json);
}

@freezed
abstract class AnilistData with _$AnilistData {
  const factory AnilistData({
    @JsonKey(name: 'Media') required AnilistMedia media,
  }) = _AnilistData;

  factory AnilistData.fromJson(Map<String, dynamic> json) =>
      _$AnilistDataFromJson(json);
}

@freezed
abstract class AnilistMedia with _$AnilistMedia {
  const factory AnilistMedia({
    required int id,
    required int? idMal,

    required AnilistTitle title,
    required String? description,

    required String? format,
    required String? status,

    required int? episodes,
    required int? duration,

    required String? season,
    required int? seasonYear,

    required int? averageScore,
    required int? popularity,

    required List<String> genres,

    required AnilistCoverImage coverImage,
    required String? bannerImage,

    required AnilistFuzzyDate startDate,
    required AnilistFuzzyDate endDate,

    required AnilistStudios studios,
    required AnilistTrailer? trailer,

    required String? siteUrl,
  }) = _AnilistMedia;

  factory AnilistMedia.fromJson(Map<String, dynamic> json) =>
      _$AnilistMediaFromJson(json);
}

@freezed
abstract class AnilistTitle with _$AnilistTitle {
  const factory AnilistTitle({
    required String? romaji,
    required String? english,
    @JsonKey(name: 'native') required String? nativeTitle,
  }) = _AnilistTitle;

  factory AnilistTitle.fromJson(Map<String, dynamic> json) =>
      _$AnilistTitleFromJson(json);
}

@freezed
abstract class AnilistCoverImage with _$AnilistCoverImage {
  const factory AnilistCoverImage({
    required String? large,
    required String? extraLarge,
    required String? color,
  }) = _AnilistCoverImage;

  factory AnilistCoverImage.fromJson(Map<String, dynamic> json) =>
      _$AnilistCoverImageFromJson(json);
}

@freezed
abstract class AnilistFuzzyDate with _$AnilistFuzzyDate {
  const factory AnilistFuzzyDate({
    required int? year,
    required int? month,
    required int? day,
  }) = _AnilistFuzzyDate;

  factory AnilistFuzzyDate.fromJson(Map<String, dynamic> json) =>
      _$AnilistFuzzyDateFromJson(json);
}

@freezed
abstract class AnilistStudios with _$AnilistStudios {
  const factory AnilistStudios({
    required List<AnilistStudioNode> nodes,
  }) = _AnilistStudios;

  factory AnilistStudios.fromJson(Map<String, dynamic> json) =>
      _$AnilistStudiosFromJson(json);
}

@freezed
abstract class AnilistStudioNode with _$AnilistStudioNode {
  const factory AnilistStudioNode({
    required int id,
    required String name,
  }) = _AnilistStudioNode;

  factory AnilistStudioNode.fromJson(Map<String, dynamic> json) =>
      _$AnilistStudioNodeFromJson(json);
}

@freezed
abstract class AnilistTrailer with _$AnilistTrailer {
  const factory AnilistTrailer({
    required String? id,
    required String? site,
    required String? thumbnail,
  }) = _AnilistTrailer;

  factory AnilistTrailer.fromJson(Map<String, dynamic> json) =>
      _$AnilistTrailerFromJson(json);
}