import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/app/router/routing.dart';
import 'package:kadro_app/app/theme/app_theme.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/features/history/ui/bloc/history_screen_bloc.dart';
import 'package:kadro_app/features/search/ui/bloc/search_screen_bloc.dart';
import 'package:kadro_app/features/search/data/datasource/anilist_client.dart';
import 'package:kadro_app/features/history/data/datasource/history_database.dart';
import 'package:kadro_app/features/search/data/datasource/trace_moe_client.dart';
import 'package:kadro_app/features/search/data/repository/anime_detail_repository_impl.dart';
import 'package:kadro_app/features/search/data/repository/anime_match_repository_impl.dart';
import 'package:kadro_app/features/history/data/repository/history_repository_impl.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_detail_repository.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/features/history/domain/repository/i_history_repository.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TraceMoeClient>(
            create: (context) => TraceMoeClient()
        ),
        RepositoryProvider<AnilistClient>(
            create: (context) => AnilistClient()
        ),
        RepositoryProvider<HistoryDriftDatabase>(
            create: (context) => HistoryDriftDatabase()
        ),
        RepositoryProvider<IAnimeMatchRepository>(
            create: (context) =>
                AnimeMatchRepositoryImpl(
                    context.read<TraceMoeClient>()
                )
        ),
        RepositoryProvider<IAnimeDetailRepository>(
            create: (context) =>
                AnimeDetailRepositoryImpl(
                    context.read<AnilistClient>()
                )
        ),
        RepositoryProvider<IHistoryRepository>(
            create: (context) =>
                HistoryRepositoryImpl(
                    context.read<HistoryDriftDatabase>()
                )
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                HistoryScreenBloc(
                    context.read<IHistoryRepository>()
                )..add(LoadHistory()),
          ),
          BlocProvider(
            create: (context) =>
                SearchScreenBloc(
                    context.read<IAnimeMatchRepository>(),
                    context.read<IAnimeDetailRepository>(),
                ),
          ),
        ],
        child: BlocListener<SearchScreenBloc, SearchScreenState>(
          listener: _searchListener,
          child: MaterialApp.router(
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.system,
            routerConfig: router,
          ),
        ),
      ),
    );
  }

  void _searchListener(BuildContext context, SearchScreenState state) {
    if (state is SearchScreenLoaded) {
      context.read<HistoryScreenBloc>().add(
        UpdateHistory(
          AnimeHistory.from(
                    anilist: state.match.id,
                    name: state.match.title.romaji,
                    imageUrl: state.match.coverImage.large,
                    similarity: state.match.similarity,
                    format: state.match.format,
                    status: state.match.status,
                    season: state.match.season,
                    seasonYear: state.match.seasonYear,
                    episodes: state.match.episodes,
                    description: state.match.parsedDescription,
          )
        )
      );
    }  
  }
}
