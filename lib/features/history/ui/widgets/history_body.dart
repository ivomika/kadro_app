import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadro_app/features/history/ui/bloc/history_screen_bloc.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('История'),
        ),
        BlocBuilder<HistoryScreenBloc, HistoryScreenState>(
          builder: (context, state) {
            if (state is HistoryScreenLoading) {
              return const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (state is HistoryScreenLoaded) {
              return SliverList.builder(
                  itemCount: state.history.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        title: Text(state.history.elementAt(index).filename),
                      ),
                    );
                  }
              );
            }

            return const SliverToBoxAdapter(child: SizedBox());
          },
        )
      ],
    );
  }
}
