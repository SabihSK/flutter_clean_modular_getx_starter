import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static const String appName = "Flutter Clean Modular GetX Starter";
  static const String appVersion = "1.0.0";

  /// API Base URL loaded from .env
  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? '';

  /// Whether the app is running in release mode
  static bool get isRelease => kReleaseMode;

  /// Enable logging only in non-release mode
  static bool get enableLogging => !kReleaseMode;

  /// Example feature flag
  static bool get enableAnalytics =>
      dotenv.env['ENABLE_ANALYTICS'] == 'true' && !kReleaseMode;
}
