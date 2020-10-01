import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/datasource_provider.dart';
import 'package:my_levelup_story/data/repository/item_repository.dart';
import 'package:my_levelup_story/data/repository/our_item_repository_impl.dart';

final ourItemRepositoryProvider = Provider<ItemRepository>(
        (ref) => OurItemRepositoryImpl(ds: ref.read(datasourceRepositoryProvider)));
