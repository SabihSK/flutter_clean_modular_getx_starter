import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static const String _tokenKey = 'auth_token';

  /// Save authentication token securely
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  /// Retrieve token
  Future<String?> readToken() async {
    try {
      return await _secureStorage.read(key: _tokenKey);
    } catch (e) {
      debugPrint("⚠️ SecureStorage failed, returning null: $e");
      return null;
    }
  }

  /// Delete token
  Future<void> deleteToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }

  /// Clear all storage
  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }
}
