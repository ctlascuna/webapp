import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:webapp/common/user/users.dart';

class UserNotifier extends StateNotifier<UserModel?> {
  UserNotifier() : super(null);

  void updateCurrentUser(UserModel? model) {
    state = model;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserModel?>((ref) {
  return UserNotifier();
});
