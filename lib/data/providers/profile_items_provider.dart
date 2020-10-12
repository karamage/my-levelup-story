import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/profile_item_repository_provider.dart';
import 'package:my_levelup_story/ui/viewmodels/items_view_model.dart';

final profileItemsProvider = StateNotifierProvider.autoDispose.family<ItemsViewModel, String>((ref, userId) => ItemsViewModel(ref.read(profileItemRepositoryProvider), userId));
