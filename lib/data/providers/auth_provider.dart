import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/ui/viewmodels/auth_view_model.dart';

final authProvider = StateNotifierProvider((_) => AuthViewModel());
