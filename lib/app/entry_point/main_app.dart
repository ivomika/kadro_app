import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/app/router/routing.dart';
import 'package:kadro_app/app/theme/app_theme.dart';
import 'package:kadro_app/features/history/ui/bloc/history_screen_bloc.dart';
import 'package:kadro_app/features/home/ui/bloc/home_screen_bloc.dart';
import 'package:kadro_app/shared/data/datasource/anilist_client.dart';
import 'package:kadro_app/shared/data/datasource/history_database.dart';
import 'package:kadro_app/shared/data/datasource/trace_moe_client.dart';
import 'package:kadro_app/shared/data/repository/anime_detail_repository_impl.dart';
import 'package:kadro_app/shared/data/repository/anime_match_repository_impl.dart';
import 'package:kadro_app/shared/data/repository/history_repository_impl.dart';
import 'package:kadro_app/shared/domain/repository/i_anime_detail_repository.dart';
import 'package:kadro_app/shared/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/shared/domain/repository/i_history_repository.dart';

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
                HomeScreenBloc(
                    context.read<IAnimeMatchRepository>(),
                    context.read<IAnimeDetailRepository>(),
                ),
          ),
        ],
        child: BlocListener<HomeScreenBloc, HomeScreenState>(
          listener: _homeListener,
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

  void _homeListener(BuildContext context, HomeScreenState state) {
    if (state is HomeScreenLoaded) {
      context.read<HistoryScreenBloc>().add(UpdateHistory(state.match));
    }  
  }
}
