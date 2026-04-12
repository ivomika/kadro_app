import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/app/router/routing.dart';
import 'package:kadro_app/app/theme/app_theme.dart';
import 'package:kadro_app/features/history/data/datasource/history_database.dart';
import 'package:kadro_app/features/search/data/datasource/trace_moe_client.dart';
import 'package:kadro_app/features/search/data/repository/anime_match_repository_impl.dart';
import 'package:kadro_app/features/history/data/repository/history_repository_impl.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/features/history/domain/repository/i_history_repository.dart';
import 'package:kadro_app/features/detail/data/datasource/anilist_client.dart';
import 'package:kadro_app/features/detail/data/repository/media_detail_repository_impl.dart';
import 'package:kadro_app/features/detail/domain/repository/i_media_detail_repository.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TraceMoeClient>(
          create: (context) => TraceMoeClient(),
        ),
        RepositoryProvider<AnilistClient>(
          create: (context) => AnilistClient()
        ),
        RepositoryProvider<HistoryDriftDatabase>(
          create: (context) => HistoryDriftDatabase(),
        ),
        RepositoryProvider<IAnimeMatchRepository>(
          create: (context) =>
              AnimeMatchRepositoryImpl(context.read<TraceMoeClient>()),
        ),
        RepositoryProvider<IMediaDetailRepository>(
          create: (context) =>
              MediaDetailRepositoryImpl(context.read<AnilistClient>()),
        ),
        RepositoryProvider<IHistoryRepository>(
          create: (context) =>
              HistoryRepositoryImpl(context.read<HistoryDriftDatabase>()),
        ),
      ],
      child: MaterialApp.router(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        routerConfig: router,
      ),
    );
  }
}
