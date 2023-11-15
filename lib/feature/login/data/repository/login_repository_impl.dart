import 'package:webapp/feature/login/data/data_source/remote_source/remote_sources.dart';
import 'package:webapp/feature/login/domain/entity/login_entity.dart';
import 'package:webapp/feature/login/domain/entity/signup_entity.dart';
import 'package:webapp/feature/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl({
    required LoginRemoteSource remoteSource,
  }) : _remoteSource = remoteSource;

  final LoginRemoteSource _remoteSource;

  @override
  Future<dynamic> login({required LoginEntity credentials}) async {
    return _remoteSource.login(credentials: credentials);
  }

  @override
  Future<dynamic> signup({required SignupEntity info}) async {
    return _remoteSource.signup(info: info);
  }
}
