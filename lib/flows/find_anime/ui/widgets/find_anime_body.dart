import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/flows/find_anime/ui/bloc/find_anime_screen_bloc.dart';
import 'package:kadro_app/flows/find_anime/ui/widgets/find_anime_bottom_sheet.dart';
import 'package:kadro_app/flows/find_anime/ui/widgets/find_anime_input.dart';

class FindAnimeBody extends StatelessWidget {
  const FindAnimeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 8),
          child: FindAnimeInput(
            onAttach: () => _searchButtonTap(context),
            onSend: (value) => _searchByUrl(value, context),
          ),
        ),
        Expanded(
          child: BlocConsumer<FindAnimeScreenBloc, FindAnimeScreenState>(
            listener: _searchListener,
            builder: (context, state) {
              if (state is FindAnimeScreenLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return const Center(
                child: Text('Р”РѕР±Р°РІСЊ РёР·РѕР±СЂР°Р¶РµРЅРёРµ!'),
              );
            },
          ),
        ),
      ],
    );
  }

  void _searchButtonTap(BuildContext context) async {
    final bloc = context.read<FindAnimeScreenBloc>();
    final messenger = ScaffoldMessenger.of(context);

    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final file = File(result.files.single.path!);
      bloc.add(FindAnimeByFileEvent(file));
    } else {
      messenger.showSnackBar(
        const SnackBar(content: Text('Р¤Р°Р№Р» РЅРµ РІС‹Р±СЂР°РЅ')),
      );
    }
  }

  void _searchByUrl(String value, BuildContext context) {
    context.read<FindAnimeScreenBloc>().add(FindAnimeByUrlEvent(value));
  }

  void _searchListener(BuildContext context, FindAnimeScreenState state) {
    if (state is FindAnimeScreenLoading) {
      final searchBloc = context.read<FindAnimeScreenBloc>();

      showModalBottomSheet(
        context: context,
        enableDrag: true,
        useSafeArea: true,
        showDragHandle: true,
        useRootNavigator: true,
        scrollControlDisabledMaxHeightRatio: 1,
        builder: (context) => BlocProvider.value(
          value: searchBloc,
          child: const FindAnimeBottomSheet(),
        ),
      );
    }

    if (state is FindAnimeScreenError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(state.error),
        ),
      );
    }
  }
}
