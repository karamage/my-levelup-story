//import 'package:app/data/remote/news_data_source.dart';
import 'package:my_levelup_story/data/models/user.dart';
import 'package:my_levelup_story/data/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  //NewsRepositoryImpl({@required NewsDataSource dataSource})
  //    : _dataSource = dataSource;

  //final NewsDataSource _dataSource;

  @override
  Future<User> login() async {
    //return _dataSource.getNews();
    return null;
  }
}
