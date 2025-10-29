import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../core/constants/app_colors.dart';
import 'splash_controller.dart';

/// 🌟 SplashView
/// Displays the logo and transitions to next screen after initialization.
class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2E2B5F), // dark purple
              Color(0xFF3A2B8C), // mid purple
              Color(0xFF7B61FF), // bright accent purple
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ App Logo
            Image.asset(
              'assets/images/logo/slidescout_logo.png', // place your logo here
              height: 100,
              width: 100,
            ),

            const SizedBox(height: 24),

            // ✅ App Name
            const Text(
              'SlideScout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
