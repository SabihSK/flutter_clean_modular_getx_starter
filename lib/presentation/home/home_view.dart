import 'package:flutter/material.dart';
import 'package:flutter_clean_modular_getx_starter/presentation/widgets/base_scaffold.dart';
import 'package:flutter_clean_modular_getx_starter/presentation/widgets/custom_button.dart';
import 'package:get/get.dart';
import '../widgets/theme_selector.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(title: const Text("Home")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => Text(
                  controller.username.value.isNotEmpty
                      ? 'Welcome, ${controller.username.value}!'
                      : 'Loading...',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              const SizedBox(height: 16),
              ThemeSelector(),
              const SizedBox(height: 16),
              CustomButton(
                text: "Logout",
                onPressed: () {
                  controller.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
