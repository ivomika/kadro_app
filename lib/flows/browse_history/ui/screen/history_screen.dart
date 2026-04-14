import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/history/domain/repository/i_history_repository.dart';
import 'package:kadro_app/flows/browse_history/domain/use_cases/watch_history_use_case.dart';
import 'package:kadro_app/flows/browse_history/ui/bloc/history_screen_bloc.dart';
import 'package:kadro_app/flows/browse_history/ui/widgets/history_body.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryScreenBloc(
        WatchHistoryUseCase(context.read<IHistoryRepository>()),
      ),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text('РСЃС‚РѕСЂРёСЏ')),
          HistoryBody(),
        ],
      ),
    );
  }
}
