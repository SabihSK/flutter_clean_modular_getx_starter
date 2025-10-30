import 'package:flutter_clean_modular_getx_starter/core/services/network_service.dart';
import 'package:get/get.dart';

import '../services/api_service.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';
import '../services/theme_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // ✅ Register global singletons
    Get.put<NetworkService>(NetworkService(), permanent: true);
    Get.put<ApiService>(ApiService(), permanent: true);
    Get.put<StorageService>(StorageService(), permanent: true);
    Get.put<AuthService>(AuthService(), permanent: true);
    Get.put<ThemeController>(ThemeController(), permanent: true);
  }
}
