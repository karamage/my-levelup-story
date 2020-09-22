import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/datasource_provider.dart';
import 'package:my_levelup_story/data/repository/item_repository.dart';
import 'package:my_levelup_story/data/repository/item_repository_impl.dart';

final itemRepositoryProvider = Provider<ItemRepository>(
        (ref) => ItemRepositoryImpl(ds: ref.read(datasourceRepositoryProvider)));
