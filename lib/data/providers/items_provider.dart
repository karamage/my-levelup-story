import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/item_repository_provider.dart';
import 'package:my_levelup_story/ui/viewmodels/items_view_model.dart';

final itemsProvider = StateNotifierProvider((ref) => ItemsViewModel(repository: ref.read(itemRepositoryProvider)));
