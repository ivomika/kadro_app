import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/detail/ui/media_info_bottom_sheet.dart';
import 'package:kadro_app/flows/find_anime/ui/bloc/find_anime_screen_bloc.dart';
import 'package:kadro_app/shared/ui/widgets/error_placeholder.dart';

class FindAnimeBottomSheet extends StatelessWidget {
  const FindAnimeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FindAnimeScreenBloc, FindAnimeScreenState>(
      builder: (context, state) {
        if (state is FindAnimeScreenError) {
          return const ErrorPlaceholder();
        }

        final isLoading = state is FindAnimeScreenLoading;
        final detail = state is FindAnimeScreenLoaded ? state.match : null;

        return MediaInfoBottomSheet(media: detail, isLoading: isLoading);
      },
    );
  }
}
