import 'package:webapp/feature/login/domain/entity/entities.dart';
import 'package:webapp/feature/login/domain/repository/repositories.dart';

class LoginUseCase {
  const LoginUseCase({
    required LoginRepository repository,
  }) : _repository = repository;

  final LoginRepository _repository;

  Future<dynamic> login({
    required LoginEntity credentials,
  }) async {
    return _repository.login(
      credentials: credentials,
    );
  }

  Future<dynamic> signup({
    required SignupEntity info,
  }) async {
    return _repository.signup(
      info: info,
    );
  }
}
