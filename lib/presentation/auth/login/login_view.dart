import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';
import '../../../../core/utils/validators.dart';
import '../../../presentation/widgets/custom_button.dart';
import '../../../presentation/widgets/custom_textfield.dart';
import '../../../../core/constants/app_strings.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.login,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: controller.emailController,
                  hintText: AppStrings.email,
                  validator: Validators.validateEmail,
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  controller: controller.passwordController,
                  hintText: AppStrings.password,
                  isPassword: true,
                  validator: Validators.validatePassword,
                ),
                const SizedBox(height: 20),
                Obx(
                  () => CustomButton(
                    text: controller.isLoading.value ? "Loading..." : "Login",
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.login,
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => Get.toNamed('/register'),
                  child: const Text("Create an account"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
