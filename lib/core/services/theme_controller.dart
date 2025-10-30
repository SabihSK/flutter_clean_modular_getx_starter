import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'storage_service.dart';

class ThemeController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();

  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;
  ThemeMode get themeMode => _themeMode.value;

  @override
  void onInit() {
    super.onInit();
    _loadSavedTheme();
  }

  Future<void> _loadSavedTheme() async {
    final savedMode = await _storageService.getThemeMode();
    _themeMode.value = savedMode;
    Get.changeThemeMode(savedMode);
  }

  void setThemeMode(ThemeMode mode) async {
    _themeMode.value = mode;
    await _storageService.saveThemeMode(mode);
    // Disable animation when changing theme to avoid lerp conflicts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.changeThemeMode(mode);
    });
  }
}
