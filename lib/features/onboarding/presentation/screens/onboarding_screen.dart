import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:manolista/core/core.dart';

import 'package:manolista/features/onboarding/presentation/pages/onboarding_pages.dart';
import 'package:manolista/features/onboarding/presentation/providers/onboarding_provider.dart';

import 'package:manolista/features/onboarding/presentation/widgets/onboarding_button.dart';

import 'package:manolista/features/onboarding/presentation/widgets/onboarding_indicator.dart';

import 'package:manolista/features/onboarding/presentation/widgets/onboarding_skip_button.dart';
import 'package:manolista/features/onboarding/presentation/widgets/pages/onboarding_first_page.dart';
import 'package:manolista/features/onboarding/presentation/widgets/pages/onboarding_second_page.dart';
import 'package:manolista/features/onboarding/presentation/widgets/pages/onboarding_third_page.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  void _completeOnboarding() {
    ref.read(onboardingProvider.notifier).completeOnboarding();
    context.go(RouteNames.login);
  }

  void _nextPage() {
    if (_currentPage < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _skipOnboarding() {
    _completeOnboarding();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _currentPage == onboardingPages.length - 1;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.colors.gradientBackgroundPrimary,
              context.colors.gradientBackgroundSecondary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              OnboardingSkipButton(onPressed: _skipOnboarding),

              OnboardingIndicator(
                currentPage: _currentPage,
                totalPages: onboardingPages.length,
              ),

              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    OnboardingFirstPage(page: onboardingPages[0]),

                    OnboardingSecondPage(page: onboardingPages[1]),

                    OnboardingThirdPage(page: onboardingPages[2]),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              OnboardingButton(isLast: isLast, onPressed: _nextPage),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
