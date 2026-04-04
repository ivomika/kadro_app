import 'package:flutter_core/flutter_core.dart';
import 'package:html/parser.dart';

class AnimeDetail extends Equatable {
  final int id;
  final int idMal;
  final String type;
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
  final int meanScore;
  final int popularity;
  final int trending;
  final int favourites;
  final List<String> genres;
  final List<String> synonyms;
  final String countryOfOrigin;
  final String source;
  final bool isLicensed;
  final AnimeCoverImage coverImage;
  final String bannerImage;
  final AnimeFuzzyDate startDate;
  final AnimeFuzzyDate endDate;
  final AnimeStudios studios;
  final List<AnimeTag> tags;
  final List<AnimeRanking> rankings;
  final String siteUrl;

  String get parsedDescription => _parseHtmlText();

  const AnimeDetail({
    required this.id,
    required this.idMal,
    required this.type,
    required this.title,
    required this.description,
    required this.format,
    required this.status,
    required this.episodes,
    required this.duration,
    required this.season,
    required this.seasonYear,
    required this.averageScore,
    required this.meanScore,
    required this.popularity,
    required this.trending,
    required this.favourites,
    required this.genres,
    required this.synonyms,
    required this.countryOfOrigin,
    required this.source,
    required this.isLicensed,
    required this.coverImage,
    required this.bannerImage,
    required this.startDate,
    required this.endDate,
    required this.studios,
    required this.tags,
    required this.rankings,
    required this.siteUrl,
    required this.similarity,
  });

  @override
  List<Object?> get props => [
    id,
    idMal,
    type,
    title,
    description,
    format,
    status,
    episodes,
    duration,
    season,
    seasonYear,
    averageScore,
    meanScore,
    popularity,
    trending,
    favourites,
    genres,
    synonyms,
    countryOfOrigin,
    source,
    isLicensed,
    coverImage,
    bannerImage,
    startDate,
    endDate,
    studios,
    tags,
    rankings,
    siteUrl,
    similarity,
  ];

  String _parseHtmlText() {
    final document = parse(description);
    return document.body?.text ?? description;
  }
}

class AnimeTitle extends Equatable {
  final String romaji;
  final String english;
  final String nativeTitle;

  const AnimeTitle({
    required this.romaji,
    required this.english,
    required this.nativeTitle,
  });

  @override
  List<Object?> get props => [romaji, english, nativeTitle];
}

class AnimeCoverImage extends Equatable {
  final String large;
  final String extraLarge;
  final String color;

  const AnimeCoverImage({
    required this.large,
    required this.extraLarge,
    required this.color,
  });

  @override
  List<Object?> get props => [large, extraLarge, color];
}

class AnimeFuzzyDate extends Equatable {
  final int year;
  final int month;
  final int day;

  const AnimeFuzzyDate({
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  List<Object?> get props => [year, month, day];
}

class AnimeStudios extends Equatable {
  final List<AnimeStudioNode> nodes;

  const AnimeStudios({required this.nodes});

  @override
  List<Object?> get props => [nodes];
}

class AnimeStudioNode extends Equatable {
  final int id;
  final String name;
  final bool isMain;

  const AnimeStudioNode({
    required this.id,
    required this.name,
    required this.isMain,
  });

  @override
  List<Object?> get props => [id, name, isMain];
}

class AnimeTag extends Equatable {
  final String name;
  final int rank;
  final bool isMediaSpoiler;
  final String category;

  const AnimeTag({
    required this.name,
    required this.rank,
    required this.isMediaSpoiler,
    required this.category,
  });

  @override
  List<Object?> get props => [name, rank, isMediaSpoiler, category];
}

class AnimeRanking extends Equatable {
  final int rank;
  final String type;
  final int year;
  final String season;
  final bool allTime;
  final String context;

  const AnimeRanking({
    required this.rank,
    required this.type,
    required this.year,
    required this.season,
    required this.allTime,
    required this.context,
  });

  @override
  List<Object?> get props => [rank, type, year, season, allTime, context];
}
