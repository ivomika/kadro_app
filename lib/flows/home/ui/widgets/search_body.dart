import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/flows/home/ui/bloc/search_screen_bloc.dart';
import 'package:kadro_app/flows/home/ui/widgets/search_bottom_sheet.dart';
import 'package:kadro_app/flows/home/ui/widgets/search_input.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 8),
          child: SearchInput(
            onAttach: () => _searchButtonTap(context),
            onSend: (value) => _searchByUrl(value, context),
          ),
        ),
        Expanded(
          child: BlocConsumer<SearchScreenBloc, SearchScreenState>(
            listener: _searchListener,
            builder: (context, state) {
              if (state is SearchScreenLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return const Center(
                child: Text('Добавь изображение!'),
              );
            },
          ),
        ),
      ],
    );
  }

  void _searchButtonTap(BuildContext context) async {
    final bloc = context.read<SearchScreenBloc>();
    final messenger = ScaffoldMessenger.of(context);

    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final file = File(result.files.single.path!);
      bloc.add(FindAnimeByFileEvent(file));
    } else {
      messenger.showSnackBar(
        const SnackBar(content: Text('Файл не выбран')),
      );
    }
  }

  void _searchByUrl(String value, BuildContext context) {
    context.read<SearchScreenBloc>().add(FindAnimeByUrlEvent(value));
  }

  void _searchListener(BuildContext context, SearchScreenState state) {
    if (state is SearchScreenLoading) {
      final searchBloc = context.read<SearchScreenBloc>();

      showModalBottomSheet(
        context: context,
        enableDrag: true,
        useSafeArea: true,
        showDragHandle: true,
        useRootNavigator: true,
        scrollControlDisabledMaxHeightRatio: 1,
        builder: (context) => BlocProvider.value(
          value: searchBloc,
          child: const SearchBottomSheet(),
        ),
      );
    }

    if (state is SearchScreenError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(state.error),
        ),
      );
    }
  }
}
