import 'package:flutter_core/flutter_core.dart';

class AnimeHistory extends Equatable{
  final String id;
  final int anilist;
  final String filename;
  final int? episode;
  final String video;
  final String image;


  const AnimeHistory({
    required this.id,
    required this.anilist,
    required this.filename,
    required this.episode,
    required this.video,
    required this.image
  });

  @override
  List<Object?> get props => [
    anilist,
    filename,
    episode,
    video,
    image
  ];
}