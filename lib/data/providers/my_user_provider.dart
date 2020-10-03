import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/user_repository_provider.dart';
import 'package:my_levelup_story/ui/viewmodels/my_user_view_model.dart';

final myUserProvider = StateNotifierProvider.autoDispose((ref) => MyUserViewModel(repository: ref.read(userRepositoryProvider)));
