// app_color.dart
import 'package:flutter/material.dart';

class AppColor {
  // Primary Colors - Light Mode
  static Color primaryTranslucent = const Color(0xFF0561A1);
  static Color primaryLight = const Color(0xFF044A7A);
  static Color primary = const Color(0xFF4A148C);
  static Color primaryDark = const Color(0xFF022A4E);

  // Primary Colors - Dark Mode
  static Color primaryDarkMode = const Color(0xFF4A90E2);
  static Color primaryLightDarkMode = const Color(0xFF6BA8FF);
  static Color primaryDarkDarkMode = const Color(0xFF357ABD);

  // Background Colors - Light Mode
  static Color backgroundLight = const Color(0xFFF8F9FA);
  static Color backgroundDark = const Color(0xFFE9ECEF);

  // Background Colors - Dark Mode
  static Color backgroundDarkMode = const Color(0xFF121212);
  static Color surfaceDarkMode = const Color(0xFF1E1E1E);
  static Color cardDarkMode = const Color(0xFF2D2D2D);

  // Text Colors - Light Mode
  static Color textPrimary = const Color(0xFF212529);
  static Color textLight = const Color(0xFFEFF0F1);
  static Color textSecondary = const Color(0xFF495057);
  static Color textTertiary = const Color(0xFF6C757D);

  // Text Colors - Dark Mode
  static Color textPrimaryDark = Colors.white;
  static Color textSecondaryDark = const Color(0xFFB0B0B0);
  static Color textTertiaryDark = const Color(0xFF888888);

  // Status Colors (comunes para ambos modos)
  static Color success = const Color(0xFF2ECC71);
  static Color error = const Color(0xFFE74C3C);
  static Color warning = const Color(0xFFF39C12);
  static Color info = const Color(0xFF3498DB);

  // Neutral Colors
  static Color white = Colors.white;
  static Color black = const Color(0xFF111827);
  static Color grey = const Color(0xFFCED4DA);
  static Color greyDark = const Color(0xFFADB5BD);
  static Color border = const Color(0xFFDEE2E6);

  // Additional Colors
  static Color mainColor = primary;
  static Color secundaryColor = backgroundLight;
  static Color backgraund = grey.withOpacity(0.2);
  static Color green = success;
  static Color ligthGreen = const Color(0xFF7DCEA0);
  static Color red = error;
  static Color blue = info;
  static Color orange = warning;
  static Color purple = Colors.purple.shade400;
  static Color yellow = const Color.fromARGB(255, 247, 243, 2);

  static Color cardBg = const Color(0xFFEFF3FF);
  static Color primaryTextOnLight = Colors.black87;
  static Color secondaryTextOnLight = const Color(0xFF90A4AE);

  static Color iconTrendColor(bool isRefund) {
    return isRefund ? const Color(0xFFD32F2F) : const Color(0xFF2E7D32);
  }

  static Color iconBgColor(bool isRefund) {
    return isRefund ? const Color(0xFFFFEBEE) : const Color(0xFFE8F5E9);
  }

  static List<Color> colorPalette = [red, orange, yellow, green, blue, purple];
}
