import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/bindings/initial_binding.dart';
import 'core/constants/app_config.dart';
import 'core/routes/app_pages.dart';
import 'core/theme/app_theme.dart';
import 'config/environment.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Load environment variables
  await dotenv.load(fileName: ".env");

  // ✅ Initialize environment configuration
  await Environment.init();

  // ✅ Run the app with GetX setup
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,

      // ✅ Initial dependency injection
      initialBinding: InitialBinding(),

      // ✅ Route configuration
      getPages: AppPages.pages,
      initialRoute: AppPages.initial,

      // ✅ Theming
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // ✅ Localization-ready (placeholder)
      locale: const Locale('en', 'US'),

      // ✅ Global error fallback
      unknownRoute: AppPages.unknownRoute,

      // ✅ Transition animations (default)
      defaultTransition: Transition.fadeIn,

      // ✅ Log only in debug mode
      enableLog: !AppConfig.isRelease,
    );
  }
}
