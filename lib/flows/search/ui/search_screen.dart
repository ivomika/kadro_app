import 'package:flutter/material.dart';
import 'package:kadro_app/flows/search/ui/widgets/search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text('Поиск'),
        ),
        Expanded(child: SearchBody()),
      ],
    );
  }
}
