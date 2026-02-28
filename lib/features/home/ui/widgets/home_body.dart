import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/home/ui/bloc/home_screen_bloc.dart';
import 'package:kadro_app/features/home/ui/widgets/home_anime_detail.dart';
import 'package:kadro_app/features/home/ui/widgets/home_search_input.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text('Домашняя'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: HomeSearchInput(
            onAttach: () => _searchButtonTap(context),
            onSend: (value) => _searchByUrl(value, context),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
            listener: _homeListener,
            builder: (context, state) {
              if (state is HomeScreenLoading) {
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
    if (state is HomeScreenLoading) {
      showBottomSheet(
          context: context,
          enableDrag: true,
          showDragHandle: true,
          builder: (context){
            return BlocBuilder<HomeScreenBloc, HomeScreenState>(
                builder: (context, state){
                  if (state is HomeScreenLoaded) {
                    return DraggableScrollableSheet(
                      expand: false,
                      initialChildSize: 0.55,
                      minChildSize: 0.2,
                      maxChildSize: 0.8,
                      builder: (context, scrollController) {
                        final match = state.match;

                        return HomeAnimeDetail(
                            scrollController: scrollController,
                            imageUrl: match.coverImage.large,
                            title: match.title.romaji,
                            description: match.description,
                            similarity: match.similarity,
                            format: match.format,
                            status: match.status,
                            season: match.season,
                            seasonYear: match.seasonYear,
                            episodes: match.episodes,
                            genres: match.genres,
                            studios: match
                                .studios
                                .nodes
                                .map((e) => e.name)
                                .toList(growable: false)
                        );
                      },
                    );
                  }

                  return DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.55,
                    minChildSize: 0.2,
                    maxChildSize: 0.8,
                    builder: (context, scrollController) {
                      return Skeletonizer(
                        enableSwitchAnimation: true,
                        child: HomeAnimeDetail(
                            scrollController: scrollController,
                            imageUrl: '',
                            title: BoneMock.title,
                            description: BoneMock.words(30),
                            similarity: 0.0000,
                            format: BoneMock.name,
                            status: BoneMock.name,
                            season: BoneMock.name,
                            seasonYear: 2000,
                            episodes: 24,
                            genres: List.generate(
                                5,
                                (index) => BoneMock.title
                            ),
                            studios: List.generate(
                                5,
                                (index) => BoneMock.title
                            ),
                        ),
                      );
                    },
                  );
                }
            );
          }
      );
    }

    if(state is HomeScreenError){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
    }
  }
}
