import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_levelup_story/data/datasource/firebase_datasource.dart';
import 'package:my_levelup_story/data/datasource/remote_datasource.dart';

final datasourceRepositoryProvider = Provider<RemoteDatasource>(
        (ref) => FirebaseDatasource());
