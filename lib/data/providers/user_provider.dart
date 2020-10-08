import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/user_repository_provider.dart';
import 'package:my_levelup_story/ui/viewmodels/user_view_model.dart';

final userProvider = StateNotifierProvider.autoDispose.family<UserViewModel, String>((ref, userId) => UserViewModel(userId: userId, repository: ref.read(userRepositoryProvider)));
