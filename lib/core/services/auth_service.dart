import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'storage_service.dart';
import 'api_service.dart';

class AuthService extends GetxService {
  final _isLoggedIn = false.obs;
  final StorageService _storage = StorageService();
  final ApiService _api = ApiService();

  bool get isLoggedIn => _isLoggedIn.value;

  /// Example login method
  Future<bool> login(String email, String password) async {
    try {
      // TODO: Replace with actual API call
      final response = await _api.post('/login', {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200 && response.data['token'] != null) {
        await _storage.saveToken(response.data['token']);
        _isLoggedIn.value = true;
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Example logout method
  Future<void> logout() async {
    await _storage.deleteToken();
    _isLoggedIn.value = false;
  }

  /// Try auto-login based on saved token
  Future<void> tryAutoLogin() async {
    final token = await _storage.readToken();
    debugPrint("🔐 Token from storage: $token");
    if (token!= null && token.isNotEmpty) {
      _isLoggedIn.value = true;
    } else {
      _isLoggedIn.value = false;
    }
  }
}
