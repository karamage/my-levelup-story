import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/ui/viewmodels/counter_view_model.dart';

final counterProvider = StateNotifierProvider((_) => CounterViewModel());
