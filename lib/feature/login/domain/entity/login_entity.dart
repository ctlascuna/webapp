import 'package:flutter/material.dart';

@immutable
class LoginEntity {
  const LoginEntity({
    required this.username,
    required this.password,
  });

  const LoginEntity.inital()
      : username = '',
        password = '';

  final String username;
  final String password;

  LoginEntity copyWith({
    String? username,
    String? password,
  }) {
    return LoginEntity(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
