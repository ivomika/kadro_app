import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/flows/history/ui/bloc/history_screen_bloc.dart';
import 'package:kadro_app/flows/history/ui/widgets/history_media_info_bottom_sheet.dart';
import 'package:kadro_app/flows/history/ui/widgets/history_list_tile.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return BlocBuilder<HistoryScreenBloc, HistoryScreenState>(
      builder: (context, state) {
        if (state is HistoryScreenLoading) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is HistoryScreenError) {
          return SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                Text('Уууупс...', style: textTheme.displaySmall),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(state.error),
                ),
              ],
            ),
          );
        }

        if (state is HistoryScreenLoaded) {
          if (state.history.isEmpty) {
            return const SliverFillRemaining(
              child: Center(child: Text('Пусто')),
            );
          }

          return SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ).copyWith(top: 8),
            sliver: SliverList.builder(
              itemCount: state.history.length,
              itemBuilder: (context, index) {
                final tile = state.history.elementAt(index);

                return HistoryListTile(
                  title: tile.name,
                  description: tile.description,
                  imageUrl: tile.imageUrl,
                  similarity: tile.similarity,
                  format: tile.format,
                  status: tile.status,
                  episodes: tile.episodes,
                  season: tile.season,
                  seasonYear: tile.seasonYear,
                  onTap: () => _onTapHistoryTile(context, tile),
                );
              },
            ),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }

  void _onTapHistoryTile(BuildContext context, AnimeHistory anime) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      useSafeArea: true,
      showDragHandle: true,
      useRootNavigator: true,
      scrollControlDisabledMaxHeightRatio: 1,
      builder: (modalContext) => HistoryMediaInfoBottomSheet(anime: anime),
    );
  }
}
