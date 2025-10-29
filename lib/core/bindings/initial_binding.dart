/// core/bindings/initial_binding.dart
/// Registers all global dependencies that should be available across the entire app.
/// This file is executed once during app startup (see main.dart).

import 'package:get/get.dart';

import '../services/api_service.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // ✅ Register global singletons
    Get.put<ApiService>(ApiService(), permanent: true);
    Get.put<StorageService>(StorageService(), permanent: true);
    Get.put<AuthService>(AuthService(), permanent: true);
  }
}
