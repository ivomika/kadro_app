import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/detail/domain/repository/i_media_detail_repository.dart';
import 'package:kadro_app/features/detail/domain/use_case/find_detail_by_id_use_case.dart';
import 'package:kadro_app/features/detail/ui/fake_media_detail.dart';
import 'package:kadro_app/features/detail/ui/media_info_bottom_sheet.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/flows/browse_history/domain/use_cases/load_history_media_detail_use_case.dart';
import 'package:kadro_app/flows/browse_history/ui/bloc/history_media_bottom_sheet_cubit.dart';
import 'package:kadro_app/shared/ui/widgets/error_placeholder.dart';

class HistoryMediaInfoBottomSheet extends StatelessWidget {
  final AnimeHistory anime;

  const HistoryMediaInfoBottomSheet({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryMediaBottomSheetCubit(
        LoadHistoryMediaDetailUseCase(
          FindDetailByIdUseCase(context.read<IMediaDetailRepository>()),
        ),
      )..load(anime),
      child: const _HistoryMediaInfoBottomSheetView(),
    );
  }
}

class _HistoryMediaInfoBottomSheetView extends StatelessWidget {
  const _HistoryMediaInfoBottomSheetView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      HistoryMediaBottomSheetCubit,
      HistoryMediaBottomSheetState
    >(
      builder: (context, state) {
        if (state is HistoryMediaBottomSheetError) {
          return const ErrorPlaceholder();
        }

        final isLoading = state is HistoryMediaBottomSheetLoading;
        final detail = state is HistoryMediaBottomSheetLoaded
            ? state.media
            : FakeMediaDetail();

        return MediaInfoBottomSheet(media: detail, isLoading: isLoading);
      },
    );
  }
}
