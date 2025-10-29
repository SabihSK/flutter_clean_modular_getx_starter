/// core/constants/app_colors.dart
/// Defines all color constants used throughout the application.
/// Provides a single source of truth for color references.

import 'package:flutter/material.dart';

class AppColors {
  // 🌞 Light Theme Colors
  static const Color primary = Color(0xFF0066FF);
  static const Color secondary = Color(0xFF00C2A8);
  static const Color background = Color(0xFFF9FAFB);
  static const Color textPrimary = Color(0xFF1E1E1E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color border = Color(0xFFE5E7EB);
  static const Color error = Color(0xFFE11D48);
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);

  // 🌚 Dark Theme Colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkTextPrimary = Color(0xFFF3F4F6);
  static const Color darkTextSecondary = Color(0xFF9CA3AF);

  // Transparent & Neutral
  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
}
