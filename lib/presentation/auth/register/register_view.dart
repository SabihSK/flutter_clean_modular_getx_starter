import 'package:flutter/material.dart';
import 'package:flutter_clean_modular_getx_starter/presentation/widgets/base_scaffold.dart';
import 'package:get/get.dart';
import 'register_controller.dart';
import '../../../../core/utils/validators.dart';
import '../../../presentation/widgets/custom_button.dart';
import '../../../presentation/widgets/custom_textfield.dart';
import '../../../../core/constants/app_strings.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.register,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: controller.nameController,
                  hintText: 'Full Name',
                  validator: (v) =>
                      Validators.validateNotEmpty(v, fieldName: 'Name'),
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  controller: controller.emailController,
                  hintText: AppStrings.email,
                  validator: Validators.validateEmail,
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  controller: controller.passwordController,
                  hintText: AppStrings.password,
                  obscureText: true,
                  validator: Validators.validatePassword,
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  controller: controller.confirmPasswordController,
                  hintText: AppStrings.confirmPassword,
                  obscureText: true,
                  validator: (v) => Validators.validateConfirmPassword(
                    v,
                    controller.passwordController.text,
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => CustomButton(
                    text: controller.isLoading.value
                        ? "Registering..."
                        : "Register",
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.register,
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
