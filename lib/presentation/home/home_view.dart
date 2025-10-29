import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Welcome, ${controller.username}!",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.logout,
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
