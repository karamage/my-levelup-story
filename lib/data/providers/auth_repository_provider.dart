import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/providers/datasource_provider.dart';
import 'package:my_levelup_story/data/repository/auth_repository.dart';
import 'package:my_levelup_story/data/repository/auth_repository_impl.dart';

final authRepositoryProvider = Provider<AuthRepository>(
        (ref) => AuthRepositoryImpl(ds: ref.read(datasourceRepositoryProvider)));
