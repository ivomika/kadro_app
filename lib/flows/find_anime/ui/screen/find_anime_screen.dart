import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/flows/find_anime/ui/bloc/find_anime_screen_bloc_factory.dart';
import 'package:kadro_app/flows/find_anime/ui/widgets/find_anime_body.dart';

class FindAnimeScreen extends StatelessWidget {
  const FindAnimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: FindAnimeScreenBlocFactory.create,
      child: Column(
        children: [
          AppBar(title: Text('Поиск')),
          Expanded(child: FindAnimeBody()),
        ],
      ),
    );
  }
}
