import 'package:manolista/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  DarkTheme._();

  static const colors = AppColors(
    primary: Color(0xFF90CAF9),
    secondary: Color(0xFF64B5F6),

    background: Color(0xFF121212),
    surface: Color(0xFF1E1E1E),

    textPrimary: Colors.white,
    textSecondary: Color(0xFFBDBDBD),

    success: Color(0xFF4CAF50),
    warning: Color(0xFFFF9800),
    error: Color(0xFFE53935),
  );

  static final theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    extensions: const [colors],
  );
}
