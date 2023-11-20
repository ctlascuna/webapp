import 'package:flutter_test/flutter_test.dart';

import 'package:webapp/feature/login/domain/entity/entities.dart';

void main() {
  group('SignupEntity', () {
    test('should create an instance of SignupEntity', () {
      const signupEntity = SignupEntity(
        username: 'username',
        password: 'username',
        confirmPassword: 'username',
      );

      expect(signupEntity, isA<SignupEntity>());
    });

    test('should create an instance of SignupEntity.initial', () {
      const signupEntity = SignupEntity.inital();

      expect(signupEntity, isA<SignupEntity>());
      expect(signupEntity.username, '');
      expect(signupEntity.password, '');
      expect(signupEntity.confirmPassword, '');
    });

    test('should create a copy of SignupEntity with updated values', () {
      // Arrange
      const originalEntity = SignupEntity(
        username: 'username',
        password: 'password',
        confirmPassword: 'password',
      );

      final updatedEntity = originalEntity.copyWith(username: 'new_username');

      expect(updatedEntity, isNot(same(originalEntity)));
      expect(updatedEntity.username, 'new_username');
      expect(updatedEntity.password, 'password');
      expect(updatedEntity.confirmPassword, 'password');
    });
  });
}
