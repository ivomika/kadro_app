import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/detail/domain/repository/i_media_detail_repository.dart';
import 'package:kadro_app/features/detail/domain/use_case/find_detail_by_id_use_case.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/flows/browse_history/domain/use_cases/load_history_media_detail_use_case.dart';

import 'browse_history_media_bottom_sheet_cubit.dart';

final class BrowseHistoryMediaBottomSheetCubitFactory {
  const BrowseHistoryMediaBottomSheetCubitFactory._();

  static BrowseHistoryMediaBottomSheetCubit create(
    BuildContext context,
    AnimeHistory anime,
  ) {
    return BrowseHistoryMediaBottomSheetCubit(
      LoadHistoryMediaDetailUseCase(
        FindDetailByIdUseCase(context.read<IMediaDetailRepository>()),
      ),
    )..load(anime);
  }
}
