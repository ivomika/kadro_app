import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/detail/ui/media_info_bottom_sheet.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/flows/browse_history/ui/bloc/browse_history_media_bottom_sheet_cubit.dart';
import 'package:kadro_app/flows/browse_history/ui/bloc/browse_history_media_bottom_sheet_cubit_factory.dart';
import 'package:kadro_app/shared/ui/widgets/error_placeholder.dart';

class BrowseHistoryMediaInfoBottomSheet extends StatelessWidget {
  final AnimeHistory anime;

  const BrowseHistoryMediaInfoBottomSheet({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BrowseHistoryMediaBottomSheetCubitFactory.create(context, anime),
      child: const _BrowseHistoryMediaInfoBottomSheetView(),
    );
  }
}

class _BrowseHistoryMediaInfoBottomSheetView extends StatelessWidget {
  const _BrowseHistoryMediaInfoBottomSheetView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      BrowseHistoryMediaBottomSheetCubit,
      BrowseHistoryMediaBottomSheetState
    >(
      builder: (context, state) {
        if (state is BrowseHistoryMediaBottomSheetError) {
          return const ErrorPlaceholder();
        }

        final isLoading = state is BrowseHistoryMediaBottomSheetLoading;
        final detail = state is BrowseHistoryMediaBottomSheetLoaded
            ? state.media
            : null;

        return MediaInfoBottomSheet(media: detail, isLoading: isLoading);
      },
    );
  }
}
