import 'package:flutter/material.dart';

import 'package:manolista/core/core.dart';
import 'package:manolista/core/theme/app_text_style.dart';
import 'package:manolista/features/onboarding/presentation/models/onboarding_data.dart';
import 'package:manolista/features/onboarding/presentation/widgets/onboarding_icon.dart';

class OnboardingFirstPage extends StatelessWidget {
  final OnboardingData page;

  const OnboardingFirstPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OnboardingIcon(icon: page.image),

        const SizedBox(height: 32),

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
