import 'package:meta/meta.dart';
import 'package:my_levelup_story/data/datasource/firebase_datasource.dart';
import 'package:my_levelup_story/data/models/app_state.dart';
import 'package:state_notifier/state_notifier.dart';

class AppStateViewModel extends StateNotifier<AppState> {
  AppStateViewModel({@required FirebaseDatasource ds}) : _ds = ds, super(const AppState(isInitCompleted: false)) {}
  final FirebaseDatasource _ds;

  Future<void> initApp() async {
    await _ds.initializeApp();
    state = state.copyWith(isInitCompleted: true);
  }
}
