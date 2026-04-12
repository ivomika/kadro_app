import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/detail/domain/repository/i_media_detail_repository.dart';
import 'package:kadro_app/features/history/domain/repository/i_history_repository.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/flows/home/ui/bloc/search_screen_bloc.dart';
import 'package:kadro_app/flows/home/ui/widgets/search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchScreenBloc(
        context.read<IAnimeMatchRepository>(),
        context.read<IMediaDetailRepository>(),
        context.read<IHistoryRepository>(),
      ),
      child: Column(
        children: [
          AppBar(
            title: Text('Поиск'),
          ),
          Expanded(child: SearchBody()),
        ],
      ),
    );
  }
}
