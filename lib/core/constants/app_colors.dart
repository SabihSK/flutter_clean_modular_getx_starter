import 'package:flutter/material.dart';

/// 🎨 SlideScout Brand Colors
/// Inspired by the gradient logo: violet → indigo → aqua mint
/// Balanced for light/dark themes and consistent with your UI preview.
class AppColors {
  // 🌞 LIGHT THEME -------------------------------------------------------------

  /// Brand & Primary
  static const Color primary = Color(0xFF6C63FF); // Violet-indigo (main brand tone)
  static const Color secondary = Color(0xFF36D1DC); // Aqua-mint accent

  /// Backgrounds & Surfaces
  static const Color background = Color(0xFFF8F9FB); // Off-white background
  static const Color surface = Color(0xFFFFFFFF); // Cards / containers
  static const Color border = Color(0xFFE4E7EC); // Subtle light gray border

  /// Text
  static const Color textPrimary = Color(0xFF1E1E1E); // Near-black text
  static const Color textSecondary = Color(0xFF6B7280); // Muted gray for subtext
  static const Color textHint = Color(0xFF9CA3AF); // Placeholder/hint text

  /// States
  static const Color success = Color(0xFF22C55E); // Green success
  static const Color warning = Color(0xFFF59E0B); // Amber warning
  static const Color error = Color(0xFFEF4444); // Vibrant red error

  // 🌚 DARK THEME --------------------------------------------------------------

  /// Backgrounds & Surfaces
  static const Color darkBackground = Color(0xFF0E0F12); // Deep charcoal base
  static const Color darkSurface = Color(0xFF1B1D22); // Card surface
  static const Color darkBorder = Color(0xFF2A2D34); // Divider/border gray

  /// Text
  static const Color darkTextPrimary = Color(0xFFF4F4F5); // Bright white text
  static const Color darkTextSecondary = Color(0xFFA1A1AA); // Muted gray
  static const Color darkTextHint = Color(0xFF71717A); // Softer hint text

  /// States (adjusted for dark mode contrast)
  static const Color darkSuccess = Color(0xFF34D399);
  static const Color darkWarning = Color(0xFFFBBF24);
  static const Color darkError = Color(0xFFF87171);

  // ⚙️ UTILITY -------------------------------------------------------------

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  /// Gradients & Effects
  static const Gradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF6C63FF), // Violet
      Color(0xFF36D1DC), // Aqua
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color shadow = Color(0x1A000000); // 10% opacity shadow
  static const Color overlay = Color(0x33000000); // 20% overlay
}
