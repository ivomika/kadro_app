import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/home/ui/bloc/home_screen_bloc.dart';
import 'package:kadro_app/features/home/ui/widgets/home_search_input.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Домашняя'),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: HomeSearchInput(
              onAttach: () => _searchButtonTap(context),
              onSend: (value) => _searchByUrl(value, context),
            )
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),
        SliverFillRemaining(
          child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
            listener: _homeListener,
            builder: (context, state) {
              if (state is HomeScreenLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is HomeScreenLoaded) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 4,
                          width: 42,
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Theme.of(context).dividerColor,
                                borderRadius: BorderRadius.circular(4)
                              )
                          ),
                        ),
                        ListTile(
                          title: Text(state.match.filename),
                          subtitle: Text('Название'),
                        ),
                        ListTile(
                          title: Text(state.match.episode?.toString() ?? ''),
                          subtitle: Text('Серия'),
                        ),
                        ListTile(
                          title: Text(state.match.anilist.toString()),
                          subtitle: Text('Anilist'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        )
      ],
    );
  }

  void _searchButtonTap(BuildContext context) async {
    final bloc = context.read<HomeScreenBloc>();
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
    final bloc = context.read<HomeScreenBloc>();

    bloc.add(FindAnimeByUrlEvent(value));
  }

  void _homeListener(BuildContext context, HomeScreenState state) {
    if(state is HomeScreenError){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
    }
  }
}
