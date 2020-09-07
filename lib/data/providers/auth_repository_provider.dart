//import 'package:app/data/provider/news_data_source_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/repository/auth_repository.dart';
import 'package:my_levelup_story/data/repository/auth_repository_impl.dart';

final authRepositoryProvider = Provider<AuthRepository>(
        (ref) => AuthRepositoryImpl(/*dataSource: ref.read(newsDataSourceProvider)*/));
