import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/helpers.dart';
import '../../../../core/routes/app_routes.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;

    // TODO: Integrate actual API registration
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;
    Helpers.showSnackBar('Registration successful!');
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
