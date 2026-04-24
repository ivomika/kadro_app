import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/detail/data/models/anilist_response.dart';

final class AnimeDetailsVariables extends Equatable
    implements GraphQlVariables {
  final int id;

  const AnimeDetailsVariables({required this.id});

  @override
  Map<String, dynamic> toJson() => {'id': id};

  @override
  List<Object?> get props => [id];
}

final class AnimeDetailsQuery
    extends GraphQlQueryOperation<AnilistData, AnimeDetailsVariables> {
  static const GraphQlDocument _document = GraphQlDocument(
    operationName: 'AnimeDetails',
    source: '''
      query AnimeDetails(\$id: Int!) {
        Media(id: \$id, type: ANIME) {
          id
          idMal
          type
          title {
            romaji
            english
            native
          }
          description(asHtml: true)
          format
          status
          episodes
          duration
          season
          seasonYear
          averageScore
          meanScore
          popularity
          trending
          favourites
          countryOfOrigin
          source
          isLicensed
          genres
          synonyms
          tags {
            name
            rank
            isMediaSpoiler
            category
          }
          rankings {
            rank
            type
            year
            season
            allTime
            context
          }
          coverImage {
            large
            extraLarge
            color
          }
          bannerImage
          startDate {
            year
            month
            day
          }
          endDate {
            year
            month
            day
          }
          studios {
            edges {
              isMain
              node {
                id
                name
              }
            }
          }
          siteUrl
        }
      }
    ''',
  );

  @override
  final AnimeDetailsVariables variables;

  const AnimeDetailsQuery({required this.variables});

  @override
  GraphQlDocument get document => _document;

  @override
  JsonFactory<AnilistData> get factory => AnilistData.fromJson;
}
