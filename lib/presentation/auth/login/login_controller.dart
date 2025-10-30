import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/utils/helpers.dart';
import '../../../../core/routes/app_routes.dart';

class LoginController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController(text: 'sabih.sk1@gmail.com');
  final passwordController = TextEditingController(text: '@Password123');

  var showPassword = false.obs;
  var keepLoggedIn = false.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() => showPassword.toggle();
  void toggleKeepLoggedIn(bool? value) => keepLoggedIn.value = value ?? false;

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;

    final success = true;

    // final success = await _authService.login(
    //   emailController.text,
    //   passwordController.text,
    // );

    isLoading.value = false;

    if (success) {
      Helpers.showSnackBar('Login successful!');
      Get.offAllNamed(AppRoutes.home);
    } else {
      Helpers.showSnackBar('Invalid credentials', isError: true);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
