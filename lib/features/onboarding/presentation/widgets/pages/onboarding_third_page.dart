import 'package:flutter/material.dart';

import 'package:manolista/core/core.dart';
import 'package:manolista/core/theme/app_text_style.dart';

class OnboardingThirdPage extends StatelessWidget {
  final dynamic page;

  const OnboardingThirdPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FractionallySizedBox(
          widthFactor: 0.8,
          child: Text(
            page.title,
            style: AppTextStyles.headingLarge.copyWith(
              color: context.colors.primary,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(height: 16),

        FractionallySizedBox(
          widthFactor: 0.8,
          child: Text(
            page.subtitle,
            style: AppTextStyles.bodyLarge.copyWith(
              color: context.colors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
