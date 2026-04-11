import 'package:flutter/material.dart';
import 'package:kadro_app/flows/history/ui/widgets/history_body.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('История'),
        ),
        HistoryBody()
      ],
    );
  }
}
