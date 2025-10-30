import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/services/theme_controller.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() {
      final selected = themeController.themeMode;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Theme',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          RadioListTile<ThemeMode>(
            title: const Text('Light Mode'),
            value: ThemeMode.light,
            groupValue: selected,
            onChanged: (mode) => themeController.setThemeMode(mode!),
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: selected,
            onChanged: (mode) => themeController.setThemeMode(mode!),
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System Default'),
            value: ThemeMode.system,
            groupValue: selected,
            onChanged: (mode) => themeController.setThemeMode(mode!),
          ),
        ],
      );
    });
  }
}
