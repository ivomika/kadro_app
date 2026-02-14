import 'package:flutter_core/api/types/response_mapper.dart';

class TraceMoeResponse extends ResponseMapper{
  int? frameCount;
  List<Result>? result;

  @override
  void fromJson(Map<String, dynamic> json) {
    frameCount = json['frameCount'];
    result = json['result'] != null
        ? (json['result'] as List)
            .map((e) => Result.fromJson(e))
            .toList(growable: false)
        : [];
  }

  @override
  String toString() {
    return 'TraceMoeResponse{frameCount: $frameCount, result: $result}';
  }
}

class Result{
  int? anilist;
  int? episode;
  double? similarity;
  String? filename;
  String? video;
  String? image;

  Result(
      this.anilist,
      this.episode,
      this.similarity,
      this.filename,
      this.video,
      this.image
  );

  Result.fromJson(Map<String, dynamic> json){
    anilist = json['anilist'];
    episode = json['episode'];
    similarity = json['similarity'];
    filename = json['filename'];
    video = json['video'];
    image = json['image'];
  }

  @override
  String toString() {
    return 'Result{anilist: $anilist, episode: $episode, similarity: $similarity, filename: $filename, video: $video, image: $image}';
  }
}