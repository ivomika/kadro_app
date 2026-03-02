import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/search/ui/bloc/search_screen_bloc.dart';
import 'package:kadro_app/features/search/ui/widgets/search_anime_detail.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchBottomSheet extends StatelessWidget {
  const SearchBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchScreenBloc, SearchScreenState>(
        builder: (context, state){
          return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.55,
              minChildSize: 0.2,
              maxChildSize: 0.8,
              snap: true,
              snapSizes: [
                0.21,
                0.8
              ],
              builder: (context, scrollController) {
                if (state is SearchScreenLoaded) {
                  final match = state.match;

                  return SearchAnimeDetail(
                      scrollController: scrollController,
                      imageUrl: match.coverImage.large,
                      title: match.title.romaji,
                      description: match.description,
                      similarity: match.similarity,
                      format: match.format,
                      status: match.status,
                      season: match.season,
                      seasonYear: match.seasonYear,
                      episodes: match.episodes,
                      genres: match.genres,
                      studios: match
                          .studios
                          .nodes
                          .map((e) => e.name)
                          .toList(growable: false)
                  );
                }

                return Skeletonizer(
                  enableSwitchAnimation: true,
                  child: SearchAnimeDetail(
                    scrollController: scrollController,
                    imageUrl: '',
                    title: BoneMock.title,
                    description: BoneMock.words(30),
                    similarity: 0.0000,
                    format: BoneMock.name,
                    status: BoneMock.name,
                    season: BoneMock.name,
                    seasonYear: 2000,
                    episodes: 24,
                    genres: List.generate(
                        5,
                        (index) => BoneMock.title
                    ),
                    studios: List.generate(
                        5,
                        (index) => BoneMock.title
                    ),
                  ),
                );
              },
          );
        }
    );
  }
}