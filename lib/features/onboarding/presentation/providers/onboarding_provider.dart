import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'onboarding_notifier.dart';

final onboardingProvider = NotifierProvider<OnboardingNotifier, bool>(
  OnboardingNotifier.new,
);
