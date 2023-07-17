part of 'search_widget_cubit.dart';

@freezed
class SearchWidgetState with _$SearchWidgetState {
  const factory SearchWidgetState.init() = InitSearchWidgetState;

  const factory SearchWidgetState.noFound() = _NoFoundSearchWidgetState;

  factory SearchWidgetState.searched(dynamic responseModel) = _SearchedSearchWidgetState;

  const factory SearchWidgetState.searching() = _SearchingSearchWidgetState;
}
