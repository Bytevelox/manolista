import 'package:flutter/material.dart';
import 'package:manolista/core/constants/app_colors.dart';

class LightTheme {
  LightTheme._();

  static const colors = AppColors(
    primary: Color(0xFF1565C0),
    secondary: Color(0xFF42A5F5),

    background: Color(0xFFF5F5F5),
    surface: Colors.white,

    textPrimary: Color(0xFF212121),
    textSecondary: Color(0xFF757575),

    success: Color(0xFF4CAF50),
    warning: Color(0xFFFF9800),
    error: Color(0xFFE53935),
  );

  static final theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    extensions: const [colors],
  );
}
