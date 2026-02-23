import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/home/ui/bloc/home_screen_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Домашняя'),
        ),
        SliverToBoxAdapter(
          child: FilledButton.icon(
            onPressed: () => _searchButtonTap(context),
            label: Text('Поиск'),
            icon: Icon(Icons.search),
          ),
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
                return Card(
                    child: ListTile(
                      title: Text(state.match.filename),
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
      bloc.add(FindAnimeEvent(file));
    } else {
      messenger.showSnackBar(SnackBar(content: Text('Файл не выбран')));
    }
  }

  void _homeListener(BuildContext context, HomeScreenState state) {
    if(state is HomeScreenError){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
    }
  }
}
