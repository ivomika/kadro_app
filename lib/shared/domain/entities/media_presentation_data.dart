import 'package:flutter_core/flutter_core.dart';

class MediaPresentationData extends Equatable {
  final int id;
  final double similarity;
  final String type;
  final String format;
  final String status;
  final String description;
  final String siteUrl;
  final String bannerImage;
  final String coverImageLarge;
  final String coverImageExtraLarge;
  final MediaPresentationTitle title;
  final MediaPresentationDate startDate;
  final MediaPresentationDate endDate;
  final String season;
  final int seasonYear;
  final int episodes;
  final int duration;
  final int averageScore;
  final int meanScore;
  final int popularity;
  final int trending;
  final int favourites;
  final String countryOfOrigin;
  final String source;
  final bool isLicensed;
  final List<String> synonyms;
  final List<String> genres;
  final List<MediaPresentationTag> tags;
  final List<MediaPresentationStudio> studios;
  final List<MediaPresentationRanking> rankings;

  const MediaPresentationData({
    required this.id,
    required this.similarity,
    required this.type,
    required this.format,
    required this.status,
    required this.description,
    required this.siteUrl,
    required this.bannerImage,
    required this.coverImageLarge,
    required this.coverImageExtraLarge,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.season,
    required this.seasonYear,
    required this.episodes,
    required this.duration,
    required this.averageScore,
    required this.meanScore,
    required this.popularity,
    required this.trending,
    required this.favourites,
    required this.countryOfOrigin,
    required this.source,
    required this.isLicensed,
    required this.synonyms,
    required this.genres,
    required this.tags,
    required this.studios,
    required this.rankings,
  });

  @override
  List<Object?> get props => [
    id,
    similarity,
    type,
    format,
    status,
    description,
    siteUrl,
    bannerImage,
    coverImageLarge,
    coverImageExtraLarge,
    title,
    startDate,
    endDate,
    season,
    seasonYear,
    episodes,
    duration,
    averageScore,
    meanScore,
    popularity,
    trending,
    favourites,
    countryOfOrigin,
    source,
    isLicensed,
    synonyms,
    genres,
    tags,
    studios,
    rankings,
  ];
}

class MediaPresentationTitle extends Equatable {
  final String romaji;
  final String english;
  final String nativeTitle;

  const MediaPresentationTitle({
    required this.romaji,
    required this.english,
    required this.nativeTitle,
  });

  @override
  List<Object?> get props => [romaji, english, nativeTitle];
}

class MediaPresentationDate extends Equatable {
  final int year;
  final int month;
  final int day;

  const MediaPresentationDate({
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  List<Object?> get props => [year, month, day];
}

class MediaPresentationStudio extends Equatable {
  final String name;
  final bool isMain;

  const MediaPresentationStudio({required this.name, required this.isMain});

  @override
  List<Object?> get props => [name, isMain];
}

class MediaPresentationTag extends Equatable {
  final String name;
  final int rank;
  final bool isMediaSpoiler;
  final String category;

  const MediaPresentationTag({
    required this.name,
    required this.rank,
    required this.isMediaSpoiler,
    required this.category,
  });

  @override
  List<Object?> get props => [name, rank, isMediaSpoiler, category];
}

class MediaPresentationRanking extends Equatable {
  final int rank;
  final bool allTime;
  final String type;
  final String context;

  const MediaPresentationRanking({
    required this.rank,
    required this.allTime,
    required this.type,
    required this.context,
  });

  @override
  List<Object?> get props => [rank, allTime, type, context];
}
