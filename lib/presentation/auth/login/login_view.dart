import 'package:flutter/material.dart';
import 'package:flutter_clean_modular_getx_starter/presentation/widgets/base_scaffold.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/routes/app_routes.dart';
import '../../widgets/custom_textfield.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo/slidescout_logo.png',
                  height: 100,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Welcome Back to SlideScout',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 32),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: controller.emailController,
                        validator: Validators.validateEmail,
                        decoration: const InputDecoration(labelText: 'Email'),
                        hintText: 'email@example.com',
                      ),
                      const SizedBox(height: 16),
                      Obx(
                        () => CustomTextField(
                          controller: controller.passwordController,
                          obscureText: !controller.showPassword.value,
                          validator: Validators.validatePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.showPassword.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                          ),
                          hintText: 'Password',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Checkbox(
                              value: controller.keepLoggedIn.value,
                              onChanged: controller.toggleKeepLoggedIn,
                            ),
                          ),
                          const Text('Keep me logged in'),
                          const Spacer(),
                          TextButton(
                            onPressed: () => Get.toNamed(AppRoutes.register),
                            child: const Text('Register'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: controller.isLoading.value
                              ? null
                              : controller.login,
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () => Get.toNamed('/reset-password'),
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
