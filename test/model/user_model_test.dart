import 'package:flutter_test/flutter_test.dart';

import 'package:webapp/common/user/users.dart';

void main() {
  group('UserModel', () {
    test('should create an instance of UserModel', () {
      const user = UserModel(
        accessToken: 'accessToken',
        username: 'username',
        id: 'id',
      );

      expect(user, isA<UserModel>());
      expect(user.accessToken, 'accessToken');
      expect(user.username, 'username');
      expect(user.id, 'id');
    });

    test('should create an instance of UserModel.initial', () {
      const user = UserModel.inital();

      expect(user, isA<UserModel>());
      expect(user.accessToken, '');
      expect(user.username, '');
      expect(user.id, '');
    });

    test('should create a copy of UserModel with updated values', () {
      const originalUser = UserModel(
        accessToken: 'token',
        username: 'username',
        id: 'id',
      );

      final updatedUser = originalUser.copyWith(
        accessToken: 'newToken',
        username: 'newUsername',
        id: 'newId',
      );

      expect(updatedUser.accessToken, 'newToken');
      expect(updatedUser.username, 'newUsername');
      expect(updatedUser.id, 'newId');
    });

    test('should create UserModel from JSON', () {
      final Map<String, dynamic> json = {
        'accessToken': 'jsonToken',
        'username': 'jsonUsername',
        'userId': 'jsonId',
      };

      final user = UserModel.fromJson(json);

      expect(user.accessToken, 'jsonToken');
      expect(user.username, 'jsonUsername');
      expect(user.id, 'jsonId');
    });
  });
}
