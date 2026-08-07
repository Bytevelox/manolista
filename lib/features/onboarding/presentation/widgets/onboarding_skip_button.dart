import 'package:flutter/material.dart';

import 'package:manolista/core/core.dart';

class OnboardingSkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const OnboardingSkipButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'Saltar',
          style: TextStyle(color: context.colors.textSecondary),
        ),
      ),
    );
  }
}
