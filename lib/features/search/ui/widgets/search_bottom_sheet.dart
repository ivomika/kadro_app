import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/search/domain/entities/fake_anime_detail.dart';
import 'package:kadro_app/features/search/ui/bloc/search_screen_bloc.dart';
import 'package:kadro_app/shared/ui/slivers/sliver_divider.dart';
import 'package:kadro_app/shared/ui/widgets/anime_detail_preview.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchBottomSheet extends StatelessWidget {
  const SearchBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
        return BlocBuilder<SearchScreenBloc, SearchScreenState>(
            builder: (context, state){
              final isLoading = state is SearchScreenLoading;
              final match =  state is SearchScreenLoaded
                ? state.match
                : FakeAnimeDetail();
              final studios = match
                  .studios
                  .nodes
                  .map((e) => e.name)
                  .toList(growable: false);

              return CustomScrollView(
                controller: scrollController,
                physics: BouncingScrollPhysics(),
                slivers: [
                  Skeletonizer.sliver(
                    enabled: isLoading,
                    child: SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        sliver: SliverToBoxAdapter(
                          child: AnimeDetailPreview(
                              imageUrl: match.coverImage.large,
                              similarity: match.similarity,
                              format: match.format,
                              status: match.status,
                              season: match.season,
                              seasonYear: match.seasonYear,
                              episodes: match.episodes,
                              title: match.title.romaji
                          ),
                        ),
                    ),
                  ),
                  const SliverDivider(
                    margin: EdgeInsets.all(16),
                  ),
                  Skeletonizer.sliver(
                    enabled: isLoading,
                    child: SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverToBoxAdapter(
                        child: Text(match.description)
                      ),
                    ),
                  ),
                  const SliverDivider(
                    margin: EdgeInsets.all(16),
                  ),
                  if(match.genres.isNotEmpty)...[
                    Skeletonizer.sliver(
                      enabled: isLoading,
                      child: SliverToBoxAdapter(
                        child: SizedBox(
                          height: 38,
                          child: CustomScrollView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            slivers: [
                              SliverPadding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                sliver: SliverList.separated(
                                  itemCount: match.genres.length,
                                  itemBuilder: (BuildContext context, int index) =>
                                      Chip(
                                          label: Text(match.genres.elementAt(index))
                                      ),
                                  separatorBuilder: (BuildContext context, int index) =>
                                  const SizedBox(
                                    width: 8,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  ],
                  Skeletonizer.sliver(
                    enabled: isLoading,
                    child: SliverList.builder(
                        itemCount: studios.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ListTile(
                              title: Text(studios.elementAt(index)),
                              subtitle: const Text('Studios'),
                              leading: Icon(Icons.movie_creation),
                            )
                    ),
                  )
                ],
              );
            }
        );

      },
    );
  }
}

