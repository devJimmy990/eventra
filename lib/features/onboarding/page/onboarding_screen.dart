import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:eventra/features/onboarding/widget/onboarding_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PageViewModel> pages = onboardingModel;
    void finishOnboarding() {
      SharedPreference.setBool(key: 'onboarding_complete', value: true);
      context.goNamed(Routes.auth);
    }

    return IntroductionScreen(
      pages: pages,
      onDone: finishOnboarding,
      onSkip: finishOnboarding,
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Get Started', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.grey,
        activeSize: Size(10.0, 10.0),
      ),
      globalBackgroundColor: Colors.white,
    );
  }
}
