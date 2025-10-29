import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'text_styles.dart';

class AppTheme {
  /// 🌞 Light theme configuration
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
      surface: AppColors.background,
    ),
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.headline1,
      displayMedium: AppTextStyles.headline2,
      titleMedium: AppTextStyles.subtitle1,
      bodyLarge: AppTextStyles.bodyText1,
      bodyMedium: AppTextStyles.bodyText2,
      labelSmall: AppTextStyles.caption,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      titleTextStyle: AppTextStyles.headline2,
      iconTheme: IconThemeData(color: AppColors.textPrimary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );

  /// 🌚 Dark theme configuration
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.darkSurface,
      error: AppColors.error,
    ),
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.headline1,
      displayMedium: AppTextStyles.headline2,
      titleMedium: AppTextStyles.subtitle1,
      bodyLarge: AppTextStyles.bodyText1,
      bodyMedium: AppTextStyles.bodyText2,
      labelSmall: AppTextStyles.caption,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      elevation: 0,
      titleTextStyle: AppTextStyles.headline2,
      iconTheme: IconThemeData(color: AppColors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.darkTextSecondary),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
  );
}
