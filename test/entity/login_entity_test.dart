import 'package:flutter_test/flutter_test.dart';

import 'package:webapp/feature/login/domain/entity/entities.dart';

void main() {
  group('LoginEntity', () {
    test('should create an instance of LoginEntity', () {
      const loginEntity =
          LoginEntity(username: 'username', password: 'password');

      expect(loginEntity, isA<LoginEntity>());
    });

    test('should create an instance of LoginEntity.initial', () {
      const loginEntity = LoginEntity.inital();

      expect(loginEntity, isA<LoginEntity>());
      expect(loginEntity.username, '');
      expect(loginEntity.password, '');
    });

    test('should create a copy of LoginEntity with updated values', () {
      const originalEntity =
          LoginEntity(username: 'john_doe', password: 'password123');

      final updatedEntity = originalEntity.copyWith(username: 'new_username');

      expect(updatedEntity, isNot(same(originalEntity)));
      expect(updatedEntity.username, 'new_username');
      expect(updatedEntity.password, 'password123');
    });
  });
}
