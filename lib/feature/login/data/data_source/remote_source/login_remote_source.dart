import 'package:webapp/feature/login/domain/entity/entities.dart';

abstract class LoginRemoteSource {
  Future<dynamic> login({
    required LoginEntity credentials,
  });

  Future<dynamic> signup({
    required SignupEntity info,
  });
}
