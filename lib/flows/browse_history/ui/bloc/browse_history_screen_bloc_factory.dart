import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/history/domain/repository/i_history_repository.dart';
import 'package:kadro_app/flows/browse_history/domain/use_cases/watch_history_use_case.dart';

import 'browse_history_screen_bloc.dart';

final class BrowseHistoryScreenBlocFactory {
  const BrowseHistoryScreenBlocFactory._();

  static BrowseHistoryScreenBloc create(BuildContext context) {
    return BrowseHistoryScreenBloc(
      WatchHistoryUseCase(context.read<IHistoryRepository>()),
    );
  }
}
