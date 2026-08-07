import 'package:flutter/material.dart';

import 'package:manolista/core/core.dart';
import 'package:manolista/core/theme/app_text_style.dart';

import '../models/onboarding_data.dart';
import 'onboarding_icon.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingData page;

  const OnboardingPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OnboardingIcon(icon: page.image),
          const SizedBox(height: 40),
          Text(
            page.title,
            style: AppTextStyles.headingLarge.copyWith(
              color: context.colors.primary,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          FractionallySizedBox(
            widthFactor: 1,
            child: Text(
              page.subtitle,
              style: AppTextStyles.headingSmall.copyWith(
                color: context.colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
