import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/datasource/remote_datasource.dart';
import 'package:my_levelup_story/data/models/app_state.dart';
import 'package:my_levelup_story/data/models/app_state_type.dart';
import 'package:state_notifier/state_notifier.dart';

class AppStateViewModel extends StateNotifier<AppState> {
  AppStateViewModel({@required RemoteDatasource ds}) : _ds = ds, super(const AppState(stateType: AppStateType.init)) {}
  final RemoteDatasource _ds;

  Future<void> initApp() async {
    await _ds.initializeApp();
    state = state.copyWith(stateType: AppStateType.initCompleted);
  }

  Future<void> setAppStateType(AppStateType stateType) async {
    state = state.copyWith(stateType: stateType);
  }

  setSelectedTab(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }
}
