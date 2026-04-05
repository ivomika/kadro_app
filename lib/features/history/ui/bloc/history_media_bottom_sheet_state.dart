part of 'history_media_bottom_sheet_bloc.dart';

sealed class HistoryMediaBottomSheetState extends Equatable {
  const HistoryMediaBottomSheetState();

  @override
  List<Object?> get props => [];
}

final class HistoryMediaBottomSheetInitial
    extends HistoryMediaBottomSheetState {}

final class HistoryMediaBottomSheetLoading
    extends HistoryMediaBottomSheetState {}

final class HistoryMediaBottomSheetLoaded extends HistoryMediaBottomSheetState {
  final MediaDetail media;

  const HistoryMediaBottomSheetLoaded(this.media);

  @override
  List<Object?> get props => [media];
}

final class HistoryMediaBottomSheetError extends HistoryMediaBottomSheetState {
  final String error;

  const HistoryMediaBottomSheetError(this.error);

  @override
  List<Object?> get props => [error];
}
