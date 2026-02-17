import 'package:freezed_annotation/freezed_annotation.dart';

part 'trace_moe_entity.freezed.dart';
part 'trace_moe_entity.g.dart';

@freezed
abstract class TraceMoeEntity with _$TraceMoeEntity{
  const factory TraceMoeEntity({
    required int frameCount,
    required List<Result> result,
  }) = _TraceMoeEntity;

  factory TraceMoeEntity.fromJson(Map<String, dynamic> json) => _$TraceMoeEntityFromJson(json);
}

@freezed
abstract class Result with _$Result{
  const factory Result({
    required int anilist,
    required int episode,
    required double similarity,
    required String filename,
    required String video,
    required String image,
  }) = _Result;

  factory Result.fromJson(Map<String, Object?> json) => _$ResultFromJson(json);
}

extension TraceMoeExtension on TraceMoeEntity{
  Result? get bestMatch => result.reduce(
          (value, element) => value.similarity >= element.similarity
          ? value
          : element
  );
}