import 'package:get/get.dart';

import '../../presentation/splash/splash_view.dart';
import '../../presentation/splash/splash_binding.dart';

import '../../presentation/auth/login/login_view.dart';
import '../../presentation/auth/login/login_binding.dart';

import '../../presentation/auth/register/register_view.dart';
import '../../presentation/auth/register/register_binding.dart';

import '../../presentation/home/home_view.dart';
import '../../presentation/home/home_binding.dart';

import '../../presentation/widgets/error_view.dart';
import 'app_routes.dart';

class AppPages {
  // ✅ Initial route (splash by default)
  static const String initial = AppRoutes.splash;

  // ✅ Route Definitions
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
  ];

  // ✅ Fallback route for unknown pages
  static final unknownRoute = GetPage(
    name: AppRoutes.unknown,
    page: () => const ErrorView(),
  );
}
