import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';

class Environment {
  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? '';
  static String get appEnvironment => dotenv.env['APP_ENV'] ?? 'development';
  static bool get enableAnalytics =>
      dotenv.env['ENABLE_ANALYTICS'] == 'true' && !kReleaseMode;
  static String get sentryDsn => dotenv.env['SENTRY_DSN'] ?? '';

  /// Initialize environment (called in main.dart)
  static Future<void> init() async {
    debugPrint('🔧 Environment: ${dotenv.env['APP_ENV']}');
    debugPrint('🌐 API: ${dotenv.env['API_BASE_URL']}');
  }
}
