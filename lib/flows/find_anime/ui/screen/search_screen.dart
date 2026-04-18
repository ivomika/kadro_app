import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/flows/find_anime/ui/bloc/search_screen_bloc_factory.dart';
import 'package:kadro_app/flows/find_anime/ui/widgets/search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: SearchScreenBlocFactory.create,
      child: Column(
        children: [
          AppBar(title: Text('РџРѕРёСЃРє')),
          Expanded(child: SearchBody()),
        ],
      ),
    );
  }
}
