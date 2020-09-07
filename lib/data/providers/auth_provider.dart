import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/auth_repository_provider.dart';
import 'package:my_levelup_story/ui/viewmodels/auth_view_model.dart';

final authProvider = StateNotifierProvider((ref) => AuthViewModel(repository: ref.read(authRepositoryProvider)));
