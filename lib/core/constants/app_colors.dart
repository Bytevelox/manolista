import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.gradientBackgroundPrimary,
    required this.gradientBackgroundSecondary,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.success,
    required this.warning,
    required this.error,
  });

  final Color primary;
  final Color secondary;

  final Color background;
  final Color surface;

  final Color textPrimary;
  final Color textSecondary;

  final Color success;
  final Color warning;
  final Color error;

  final Color gradientBackgroundPrimary;
  final Color gradientBackgroundSecondary;

  @override
  AppColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? surface,
    Color? textPrimary,
    Color? textSecondary,
    Color? success,
    Color? warning,
    Color? error,
    Color? gradientBackgroundPrimary,
    Color? gradientBackgroundSecondary,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      gradientBackgroundPrimary:
          gradientBackgroundPrimary ?? this.gradientBackgroundPrimary,
      gradientBackgroundSecondary:
          gradientBackgroundSecondary ?? this.gradientBackgroundSecondary,
    );
  }

  @override
  AppColors lerp(covariant AppColors? other, double t) {
    if (other == null) return this;

    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      gradientBackgroundPrimary: Color.lerp(
        gradientBackgroundPrimary,
        other.gradientBackgroundPrimary,
        t,
      )!,
      gradientBackgroundSecondary: Color.lerp(
        gradientBackgroundSecondary,
        other.gradientBackgroundSecondary,
        t,
      )!,
    );
  }
}
