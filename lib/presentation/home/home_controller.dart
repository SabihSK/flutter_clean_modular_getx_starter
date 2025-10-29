import 'package:get/get.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/routes/app_routes.dart';

class HomeController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  String get username => "User"; // TODO: fetch from user data

  void logout() async {
    await _authService.logout();
    Get.offAllNamed(AppRoutes.login);
  }
}
