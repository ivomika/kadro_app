import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/detail/domain/repository/i_media_detail_repository.dart';
import 'package:kadro_app/features/detail/domain/use_case/find_detail_by_id_use_case.dart';
import 'package:kadro_app/features/history/domain/repository/i_history_repository.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/features/search/domain/use_case/search_by_file_use_case.dart';
import 'package:kadro_app/features/search/domain/use_case/search_by_url_use_case.dart';
import 'package:kadro_app/features/search/domain/use_case/select_best_anime_match_use_case.dart';
import 'package:kadro_app/flows/find_anime/domain/use_cases/find_anime_by_file_flow_use_case.dart';
import 'package:kadro_app/flows/find_anime/domain/use_cases/find_anime_by_url_flow_use_case.dart';
import 'package:kadro_app/flows/find_anime/domain/use_cases/save_anime_detail_to_history_flow_use_case.dart';
import 'package:kadro_app/flows/find_anime/ui/bloc/search_screen_bloc.dart';
import 'package:kadro_app/flows/find_anime/ui/widgets/search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final animeMatchRepository = context.read<IAnimeMatchRepository>();
    final mediaDetailRepository = context.read<IMediaDetailRepository>();
    final historyRepository = context.read<IHistoryRepository>();
    final selectBestAnimeMatchUseCase = SelectBestAnimeMatchUseCase();
    final findDetailByIdUseCase = FindDetailByIdUseCase(mediaDetailRepository);

    return BlocProvider(
      create: (context) => SearchScreenBloc(
        FindAnimeByFileFlowUseCase(
          SearchByFileUseCase(animeMatchRepository),
          selectBestAnimeMatchUseCase,
          findDetailByIdUseCase,
        ),
        FindAnimeByUrlFlowUseCase(
          SearchByUrlUseCase(animeMatchRepository),
          selectBestAnimeMatchUseCase,
          findDetailByIdUseCase,
        ),
        SaveAnimeDetailToHistoryFlowUseCase(historyRepository),
      ),
      child: Column(
        children: [
          AppBar(title: Text('РџРѕРёСЃРє')),
          Expanded(child: SearchBody()),
        ],
      ),
    );
  }
}
