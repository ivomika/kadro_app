part of 'browse_history_media_bottom_sheet_cubit.dart';

sealed class BrowseHistoryMediaBottomSheetState extends Equatable {
  const BrowseHistoryMediaBottomSheetState();

  @override
  List<Object?> get props => [];
}

final class BrowseHistoryMediaBottomSheetInitial
    extends BrowseHistoryMediaBottomSheetState {}

final class BrowseHistoryMediaBottomSheetLoading
    extends BrowseHistoryMediaBottomSheetState {}

final class BrowseHistoryMediaBottomSheetLoaded
    extends BrowseHistoryMediaBottomSheetState {
  final MediaDetail media;

  const BrowseHistoryMediaBottomSheetLoaded(this.media);

  @override
  List<Object?> get props => [media];
}

final class BrowseHistoryMediaBottomSheetError
    extends BrowseHistoryMediaBottomSheetState {
  final String error;

  const BrowseHistoryMediaBottomSheetError(this.error);

  @override
  List<Object?> get props => [error];
}
