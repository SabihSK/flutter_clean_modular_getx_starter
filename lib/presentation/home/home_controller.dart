import 'package:flutter_clean_modular_getx_starter/core/services/storage_service.dart';
import 'package:get/get.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/routes/app_routes.dart';

class HomeController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final StorageService _storageService = Get.find<StorageService>();

  // changed: use an observable instead of a raw Future
  RxString username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // fetch the name and update the observable
    _storageService
        .getUserName()
        .then((value) {
          username.value = value;
        })
        .catchError((_) {
          username.value = 'Unknown';
        });
  }

  void logout() async {
    await _authService.logout();
    Get.offAllNamed(AppRoutes.login);
  }
}
