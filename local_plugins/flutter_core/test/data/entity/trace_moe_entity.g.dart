// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trace_moe_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TraceMoeEntity _$TraceMoeEntityFromJson(Map<String, dynamic> json) =>
    _TraceMoeEntity(
      frameCount: (json['frameCount'] as num).toInt(),
      result: (json['result'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TraceMoeEntityToJson(_TraceMoeEntity instance) =>
    <String, dynamic>{
      'frameCount': instance.frameCount,
      'result': instance.result,
    };

_Result _$ResultFromJson(Map<String, dynamic> json) => _Result(
  anilist: (json['anilist'] as num).toInt(),
  episode: (json['episode'] as num).toInt(),
  similarity: (json['similarity'] as num).toDouble(),
  filename: json['filename'] as String,
  video: json['video'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$ResultToJson(_Result instance) => <String, dynamic>{
  'anilist': instance.anilist,
  'episode': instance.episode,
  'similarity': instance.similarity,
  'filename': instance.filename,
  'video': instance.video,
  'image': instance.image,
};
