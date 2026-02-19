import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kadro_app/shared/domain/entities/anime_match.dart';

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
    required int episode,
    required double similarity,
    required String filename,
    required String video,
    required String image,
  }) = _Result;

  factory AnimeMatchResult.fromJson(Map<String, Object?> json) => _$ResultFromJson(json);
}

extension ResultExtension on AnimeMatchResult{
  AnimeMatch? toDomain(){
    return AnimeMatch(
        anilist: anilist,
        filename: filename,
        episode: episode,
        similarity: similarity,
        video: video,
        image: image
    );
  }
}
