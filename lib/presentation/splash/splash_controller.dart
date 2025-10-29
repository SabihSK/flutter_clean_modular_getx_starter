import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/routes/app_routes.dart';

class SplashController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  @override
  void onReady() {
    super.onReady();
    debugPrint("🚀 SplashController initialized");
    _initApp();
  }

  Future<void> _initApp() async {
    debugPrint("⏳ Splash: Starting init...");
    await Future.delayed(const Duration(seconds: 2));

    try {
      await _authService.tryAutoLogin();
      debugPrint(
        "✅ tryAutoLogin completed. isLoggedIn: ${_authService.isLoggedIn}",
      );

      if (_authService.isLoggedIn) {
        debugPrint("➡️ Navigating to Home");
        Get.offAllNamed(AppRoutes.home);
      } else {
        debugPrint("➡️ Navigating to Login");
        Get.offAllNamed(AppRoutes.login);
      }
    } catch (e) {
      debugPrint("❌ Splash error: $e");
    }
  }
}
