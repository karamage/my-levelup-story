import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_levelup_story/data/models/app_state_type.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
abstract class AppState with _$AppState{
  const factory AppState({
    AppStateType stateType
  }) = _AppState;
  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
