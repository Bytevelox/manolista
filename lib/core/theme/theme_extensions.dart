import 'package:flutter/material.dart';
import 'package:manolista/core/constants/app_colors.dart';

extension ThemeGetter on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}
