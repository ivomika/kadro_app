import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_match_response.freezed.dart';
part 'anime_match_response.g.dart';

@freezed
abstract class AnimeMatchResponse with _$AnimeMatchResponse{
  const factory AnimeMatchResponse({
    required int frameCount,
    required List<AnimeMatchResult> result,
  }) = _AnimeMatchResponse;

  factory AnimeMatchResponse.fromJson(Map<String, Object?> json) => _$AnimeMatchResponseFromJson(json);
}

@freezed
abstract class AnimeMatchResult with _$AnimeMatchResult{
  const factory AnimeMatchResult({
    required int anilist,
    required double similarity,
    required String filename,
    required String video,
    required String image,
  }) = _Result;

  factory AnimeMatchResult.fromJson(Map<String, Object?> json) => _$ResultFromJson(json);
}
