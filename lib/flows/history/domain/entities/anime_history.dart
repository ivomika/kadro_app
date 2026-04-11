import 'package:flutter_core/flutter_core.dart';
import 'package:uuid/uuid.dart';

class AnimeHistory extends Equatable{
  final String id;
  final int anilist;
  final String name;
  final String imageUrl;
  final double similarity;
  final String format;
  final String status;
  final String season;
  final int seasonYear;
  final int episodes;
  final String description;


  const AnimeHistory({
    required this.id,
    required this.anilist,
    required this.name,
    required this.imageUrl,
    required this.similarity,
    required this.format,
    required this.status,
    required this.season,
    required this.seasonYear,
    required this.episodes,
    required this.description,
  });

  factory AnimeHistory.from({
    required int anilist,
    required String name,
    required String imageUrl,
    required double similarity,
    required String format,
    required String status,
    required String season,
    required int seasonYear,
    required int episodes,
    required String description,
  }) => AnimeHistory(
      id: Uuid().v4(),
      anilist: anilist,
      name: name,
      imageUrl: imageUrl,
      similarity: similarity,
      format: format,
      status: status,
      season: season,
      seasonYear: seasonYear,
      episodes: episodes,
      description: description,
  );

  @override
  List<Object?> get props => [
    id,
    anilist,
    name,
    imageUrl,
    similarity,
    format,
    status,
    season,
    seasonYear,
    episodes,
    description,
  ];
}