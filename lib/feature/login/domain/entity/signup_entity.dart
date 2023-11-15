import 'package:flutter/material.dart';

@immutable
class SignupEntity {
  const SignupEntity({
    required this.username,
    required this.password,
    required this.confirmPassword,
  });

  const SignupEntity.inital()
      : username = '',
        password = '',
        confirmPassword = '';

  final String username;
  final String password;
  final String confirmPassword;

  SignupEntity copyWith({
    String? username,
    String? password,
    String? confirmPassword,
  }) {
    return SignupEntity(
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
