part of 'history_media_bottom_sheet_bloc.dart';

sealed class HistoryMediaBottomSheetEvent extends Equatable {
  const HistoryMediaBottomSheetEvent();

  @override
  List<Object?> get props => [];
}

final class LoadHistoryMediaBottomSheet extends HistoryMediaBottomSheetEvent {
  final AnimeHistory anime;

  const LoadHistoryMediaBottomSheet(this.anime);

  @override
  List<Object?> get props => [anime];
}
