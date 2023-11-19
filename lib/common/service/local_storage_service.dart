import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webapp/common/service/services.dart';

class LocalStorageService extends LocalStorageServiceNotifier {
  LocalStorageService(this._box) : super(VoidCallback);

  final Box<dynamic> _box;

  static const _isLoginKey = 'isLogin';

  bool? getLoginStatus() {
    return _box.get(_isLoginKey) as bool? ?? false;
  }

  void setLoginStatus({required bool value}) => _box.put(_isLoginKey, value);

  void removeLoginStatus() => _box.delete(_isLoginKey);
}

final localStorageService = LocalStorageServiceProvider((ref) {
  final box = ref.read(boxInstanceProvider);
  return LocalStorageService(box);
});

typedef LocalStorageServiceNotifier = StateNotifier<void>;

typedef LocalStorageServiceProvider
    = StateNotifierProvider<LocalStorageService, void>;
