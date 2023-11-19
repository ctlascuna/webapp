import 'package:flutter/material.dart';

@immutable
class UserModel {
  const UserModel({
    required this.accessToken,
    required this.username,
    required this.id,
  });

  const UserModel.inital()
      : accessToken = '',
        username = '',
        id = '';

  final String accessToken;
  final String username;
  final String id;

  UserModel copyWith({
    String? accessToken,
    String? username,
    String? id,
  }) {
    return UserModel(
      accessToken: accessToken ?? this.accessToken,
      username: username ?? this.username,
      id: id ?? this.id,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['accessToken'] as String,
      username: json['username'] as String,
      id: json['userId'] as String,
    );
  }
}
