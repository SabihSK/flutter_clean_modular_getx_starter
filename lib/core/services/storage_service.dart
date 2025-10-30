import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  // Singleton instance
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Default keys (optional convenience)
  static const String _tokenKey = 'auth_token';
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _themeModeKey = 'theme_mode';
  static const String _userName = 'user_name';

  // ======================================================
  // 🟩 GENERIC METHODS
  // ======================================================

  /// Save any [value] securely against a given [key].
  Future<void> write(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      debugPrint("⚠️ Error saving key '$key': $e");
    }
  }

  /// Read value for any [key].
  Future<String?> read(String key) async {
    try {
      return await _secureStorage.read(key: key);
    } catch (e) {
      debugPrint("⚠️ Error reading key '$key': $e");
      return null;
    }
  }

  /// Delete specific [key].
  Future<void> delete(String key) async {
    try {
      await _secureStorage.delete(key: key);
    } catch (e) {
      debugPrint("⚠️ Error deleting key '$key': $e");
    }
  }

  /// Check if a key exists.
  Future<bool> containsKey(String key) async {
    try {
      return await _secureStorage.containsKey(key: key);
    } catch (e) {
      debugPrint("⚠️ Error checking key '$key': $e");
      return false;
    }
  }

  /// Get all key–value pairs (for debugging / listing).
  Future<Map<String, String>> readAll() async {
    try {
      return await _secureStorage.readAll();
    } catch (e) {
      debugPrint("⚠️ Error reading all: $e");
      return {};
    }
  }

  /// Delete all stored data.
  Future<void> clearAll() async {
    try {
      await _secureStorage.deleteAll();
    } catch (e) {
      debugPrint("⚠️ Error clearing all storage: $e");
    }
  }

  // ======================================================
  // 🔐 CONVENIENCE METHODS (specific use cases)
  // ======================================================

  /// Save authentication token (reuses generic `write`)
  Future<void> saveToken(String token) async => write(_tokenKey, token);

  /// Retrieve saved token
  Future<String?> getToken() async => read(_tokenKey);

  /// Delete authentication token
  Future<void> deleteToken() async => delete(_tokenKey);

  /// Save login status
  Future<void> setLoggedIn(bool status) async =>
      write(_isLoggedInKey, status.toString());

  /// Retrieve login status
  Future<bool> isLoggedIn() async {
    final value = await read(_isLoggedInKey);
    return value == 'true';
  }

  Future<void> setUserName(String name) async => write(_userName, name);

  Future<String> getUserName() async {
    final name = await read(_userName);
    return name ?? "User";
  }

  // ✅ Save selected theme mode
  Future<void> saveThemeMode(ThemeMode mode) async {
    await write(_themeModeKey, mode.name);
  }

  // ✅ Load saved theme mode (defaults to system)
  Future<ThemeMode> getThemeMode() async {
    final value = await read(_themeModeKey);
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
