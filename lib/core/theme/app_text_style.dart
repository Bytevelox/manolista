import 'package:flutter/material.dart';

import 'package:manolista/core/theme/app_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  // Display
  static final TextStyle displayLarge = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 40,
    fontWeight: FontWeight.bold,
    height: 1.1,
  );

  static final TextStyle displayMedium = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 36,
    fontWeight: FontWeight.bold,
    height: 1.1,
  );

  // Headings
  static final TextStyle headingLarge = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );

  static final TextStyle headingMedium = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  static final TextStyle headingSmall = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.25,
  );

  // Body
  static final TextStyle bodyLarge = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static final TextStyle bodyMedium = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static final TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  // Labels
  static final TextStyle labelLarge = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static final TextStyle labelMedium = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static final TextStyle labelSmall = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  // Caption
  static final TextStyle caption = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );
}
