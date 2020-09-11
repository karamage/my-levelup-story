import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/datasource_provider.dart';
import 'package:my_levelup_story/data/repository/user_repository.dart';
import 'package:my_levelup_story/data/repository/user_repository_impl.dart';

final userRepositoryProvider = Provider<UserRepository>(
        (ref) => UserRepositoryImpl(ds: ref.read(datasourceRepositoryProvider)));
