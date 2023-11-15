import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SecureStorageService extends SecureStorageServiceNotifier {
  SecureStorageService(
    FlutterSecureStorage secureStorage,
  )   : _secureStorage = secureStorage,
        super(VoidCallback);

  final FlutterSecureStorage _secureStorage;

  static const _tokenKey = 'token';
  static const _userIDKey = 'userID';
  static const _usernameKey = 'username';

  Future<void> storeToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return _secureStorage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }

  Future<void> storeUserID(String id) async {
    await _secureStorage.write(key: _userIDKey, value: id);
  }

  Future<String?> getUserID() async {
    return _secureStorage.read(key: _userIDKey);
  }

  Future<void> deteUserID() async {
    await _secureStorage.delete(key: _userIDKey);
  }

  Future<void> storeUsername(String username) async {
    await _secureStorage.write(key: _usernameKey, value: username);
  }

  Future<String?> getUsername() async {
    return _secureStorage.read(key: _usernameKey);
  }

  Future<void> deleteUsername() async {
    await _secureStorage.delete(key: _usernameKey);
  }
}

final secureStorageServiceProvider = SecureStorageServiceProvider((_) {
  const secureStorage = FlutterSecureStorage();

  return SecureStorageService(secureStorage);
});

typedef SecureStorageServiceNotifier = StateNotifier<void>;

typedef SecureStorageServiceProvider
    = StateNotifierProvider<SecureStorageService, void>;
