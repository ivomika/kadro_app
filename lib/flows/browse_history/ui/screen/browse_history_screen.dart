import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/flows/browse_history/ui/bloc/browse_history_screen_bloc_factory.dart';
import 'package:kadro_app/flows/browse_history/ui/widgets/browse_history_body.dart';

class BrowseHistoryScreen extends StatelessWidget {
  const BrowseHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: BrowseHistoryScreenBlocFactory.create,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text('История')),
          BrowseHistoryBody(),
        ],
      ),
    );
  }
}
