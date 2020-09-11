import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/datasource_provider.dart';
import 'package:my_levelup_story/ui/viewmodels/app_state_view_model.dart';

final appStateProvider = StateNotifierProvider((ref) =>
    AppStateViewModel(ds: ref.read(datasourceRepositoryProvider))
    ..initApp()
);
