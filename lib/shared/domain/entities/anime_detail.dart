import 'package:flutter_core/flutter_core.dart';

class AnimeDetail extends Equatable {
  final int id;
  final int idMal;
  final AnimeTitle title;
  final double similarity;
  final String description;
  final String format;
  final String status;
  final int episodes;
  final int duration;
  final String season;
  final int seasonYear;
  final int averageScore;
  final int popularity;
  final List<String> genres;
  final AnimeCoverImage coverImage;
  final String bannerImage;
  final AnimeFuzzyDate startDate;
  final AnimeFuzzyDate endDate;
  final AnimeStudios studios;
  final AnimeTrailer? trailer;
  final String siteUrl;

  const AnimeDetail({
    required this.id,
    required this.idMal,
    required this.title,
    required this.description,
    required this.format,
    required this.status,
    required this.episodes,
    required this.duration,
    required this.season,
    required this.seasonYear,
    required this.averageScore,
    required this.popularity,
    required this.genres,
    required this.coverImage,
    required this.bannerImage,
    required this.startDate,
    required this.endDate,
    required this.studios,
    required this.trailer,
    required this.siteUrl,
    required this.similarity,
  });

  @override
  List<Object?> get props => [
    id,
    idMal,
    title,
    description,
    format,
    status,
    episodes,
    duration,
    season,
    seasonYear,
    averageScore,
    popularity,
    genres,
    coverImage,
    bannerImage,
    startDate,
    endDate,
    studios,
    trailer,
    siteUrl,
    similarity,
  ];

  @override
  String toString() {
    return 'AnimeDetail('
        'id: $id, '
        'idMal: $idMal, '
        'title: $title, '
        'description: $description, '
        'format: $format, '
        'status: $status, '
        'episodes: $episodes, '
        'duration: $duration, '
        'season: $season, '
        'seasonYear: $seasonYear, '
        'averageScore: $averageScore, '
        'popularity: $popularity, '
        'genres: $genres, '
        'coverImage: $coverImage, '
        'bannerImage: $bannerImage, '
        'startDate: $startDate, '
        'endDate: $endDate, '
        'studios: $studios, '
        'trailer: $trailer, '
        'siteUrl: $siteUrl, '
        'similarity: $similarity'
        ')';
  }
}

class AnimeTitle extends Equatable {
  final String? romaji;
  final String? english;
  final String? nativeTitle;

  const AnimeTitle({
    required this.romaji,
    required this.english,
    required this.nativeTitle,
  });

  @override
  List<Object?> get props => [romaji, english, nativeTitle];

  @override
  String toString() {
    return 'AnimeTitle(romaji: $romaji, english: $english, nativeTitle: $nativeTitle)';
  }
}

class AnimeCoverImage extends Equatable {
  final String? large;
  final String? extraLarge;
  final String? color;

  const AnimeCoverImage({
    required this.large,
    required this.extraLarge,
    required this.color,
  });

  @override
  List<Object?> get props => [large, extraLarge, color];

  @override
  String toString() {
    return 'AnimeCoverImage(large: $large, extraLarge: $extraLarge, color: $color)';
  }
}

class AnimeFuzzyDate extends Equatable {
  final int? year;
  final int? month;
  final int? day;

  const AnimeFuzzyDate({
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  List<Object?> get props => [year, month, day];

  @override
  String toString() {
    return 'AnimeFuzzyDate(year: $year, month: $month, day: $day)';
  }
}

class AnimeStudios extends Equatable {
  final List<AnimeStudioNode> nodes;

  const AnimeStudios({
    required this.nodes,
  });

  @override
  List<Object?> get props => [nodes];

  @override
  String toString() {
    return 'AnimeStudios(nodes: $nodes)';
  }
}

class AnimeStudioNode extends Equatable {
  final int id;
  final String name;

  const AnimeStudioNode({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];

  @override
  String toString() {
    return 'AnimeStudioNode(id: $id, name: $name)';
  }
}

class AnimeTrailer extends Equatable {
  final String? id;
  final String? site;
  final String? thumbnail;

  const AnimeTrailer({
    required this.id,
    required this.site,
    required this.thumbnail,
  });

  @override
  List<Object?> get props => [id, site, thumbnail];

  @override
  String toString() {
    return 'AnimeTrailer(id: $id, site: $site, thumbnail: $thumbnail)';
  }
}