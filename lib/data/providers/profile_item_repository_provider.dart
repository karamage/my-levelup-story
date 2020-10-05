import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/datasource_provider.dart';
import 'package:my_levelup_story/data/repository/item_repository.dart';
import 'package:my_levelup_story/data/repository/profile_item_repository.dart';

final profileItemRepositoryProvider = Provider<ItemRepository>(
        (ref) => ProfileItemRepositoryImpl(ds: ref.read(datasourceRepositoryProvider)));
