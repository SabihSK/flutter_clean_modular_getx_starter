import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/utils/helpers.dart';
import '../../../../core/routes/app_routes.dart';

class LoginController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;

    final success = await _authService.login(
      emailController.text,
      passwordController.text,
    );

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
