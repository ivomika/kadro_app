import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/flows/search/ui/bloc/search_screen_bloc.dart';
import 'package:kadro_app/features/detail/domain/entities/fake_media_detail.dart';
import 'package:kadro_app/shared/ui/widgets/error_placeholder.dart';
import 'package:kadro_app/features/detail/ui/media_info_bottom_sheet.dart';

class SearchBottomSheet extends StatelessWidget {
  const SearchBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchScreenBloc, SearchScreenState>(
      builder: (context, state) {
        if (state is SearchScreenError) {
          return const ErrorPlaceholder();
        }

        final isLoading = state is SearchScreenLoading;
        final detail = state is SearchScreenLoaded
            ? state.match
            : FakeMediaDetail();

        return MediaInfoBottomSheet(media: detail, isLoading: isLoading);
      },
    );
  }
}
