import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/onboarding/widget/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/routes/routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  Future<void> _completeOnboarding(BuildContext context) async {
    await SharedPreference.setBool(key: 'onboarding_complete', value: true);
    print("Onboarding completed saved and should go to login screen");
    context.go(Routes.auth);
  }
  @override
  Widget build(BuildContext context) {
    final List<PageViewModel> pages = onboardingModel;

    return IntroductionScreen(
      pages: pages,
      onDone: () async {
        await _completeOnboarding(context);
      },
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Login', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.grey,
        activeSize: Size(10.0, 10.0),
      ),
      globalBackgroundColor: Colors.white,
    );
  }
}