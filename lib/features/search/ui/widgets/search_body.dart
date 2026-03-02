import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/search/ui/bloc/search_screen_bloc.dart';
import 'package:kadro_app/features/search/ui/widgets/search_bottom_sheet.dart';
import 'package:kadro_app/features/search/ui/widgets/search_input.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text('Поиск'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SearchInput(
            onAttach: () => _searchButtonTap(context),
            onSend: (value) => _searchByUrl(value, context),
          ),
        ),
        const SizedBox(height: 16),
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
        )
      ],
    );
  }

  void _searchButtonTap(BuildContext context) async {
    final bloc = context.read<SearchScreenBloc>();
    final messenger = ScaffoldMessenger.of(context);

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      bloc.add(FindAnimeByFileEvent(file));
    } else {
      messenger.showSnackBar(SnackBar(content: Text('Файл не выбран')));
    }
  }

  void _searchByUrl(String value, BuildContext context) {
    final bloc = context.read<SearchScreenBloc>();

    bloc.add(FindAnimeByUrlEvent(value));
  }

  void _searchListener(BuildContext context, SearchScreenState state) {
    if (state is SearchScreenLoading) {
      showBottomSheet(
          context: context,
          enableDrag: true,
          showDragHandle: true,
          builder: (context) => const SearchBottomSheet()
      );
    }

    if(state is SearchScreenError){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
    }
  }
}
