import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/flutter_core.dart';
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
        SliverToBoxAdapter(
          child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
            listener: _homeListener,
            builder: (context, state) {
              if (state is HomeScreenLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is HomeScreenLoaded) {
                Talker talker = Talker();
                talker.log(state.match);
                return BottomSheet(
                  enableDrag: false,
                  showDragHandle: true,
                  onClosing: () {  },
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        if(state.match.coverImage.large.isNotEmpty)
                          Image.network(state.match.coverImage.large),
                        ListTile(
                          title: Text('Уверенность'),
                          subtitle: Text('${state.match.similarity.toString().substring(0, 4)}%'),
                        ),
                        ListTile(
                          title: Text('Название'),
                          subtitle: Text(state.match.title.english),
                        ),
                        ListTile(
                          title: Text('Описание'),
                          subtitle: Text(state.match.description),
                        ),
                        ListTile(
                          title: Text('url'),
                          subtitle: Text(state.match.siteUrl),
                        ),
                        ListTile(
                          title: Text('Anilist'),
                          subtitle: Text(state.match.id.toString()),
                        ),
                      ],
                    );
                  },
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
