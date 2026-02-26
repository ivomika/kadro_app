import 'package:flutter_core/flutter_core.dart';

class AnimeMatch extends Equatable{
  final int anilist;
  final String filename;
  final double similarity;
  final String video;
  final String image;


  const AnimeMatch({
     required this.anilist,
     required this.filename,
     required this.similarity,
     required this.video,
     required this.image
  });

  @override
  List<Object?> get props => [
    anilist,
    filename,
    similarity,
    video,
    image
  ];

  @override
  String toString() {
    return 'AnimeMatch{anilist: $anilist, filename: $filename, similarity: $similarity, video: $video, image: $image}';
  }
}