import 'package:eventra/core/constants/routes.dart';
import 'package:eventra/features/onboarding/widget/onboarding_controller.dart';
import 'package:eventra/features/onboarding/widget/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const totalPages = 4; // total number of onboarding pages
    return ChangeNotifierProvider(
      create: (_) => OnboardingController(
        totalPages: totalPages,
        onFinish: () => context.go(Routes.sLogin),//Todo with Jimmy
      ),
      child: const OnboardingContent(),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardingController>(context);
    final pages = [
      const Onboarding(
        title: 'Welcome',
        description: 'Discover the app that makes your life easier',
        imagePath: 'assets/on_boarding_images/onboarding1.gif',
      ),
      const Onboarding(
        title: 'Feature Highlight',
        description: 'Explore our exciting features',
        imagePath: 'assets/on_boarding_images/onboardingC.gif',
      ),
      const Onboarding(
        title: 'Stay Connected',
        description: 'Stay connected with friends and family',
        imagePath: 'assets/on_boarding_images/onboarding1.gif',
      ),
      const Onboarding(
        title: 'Get Started',
        description: 'Let’s get you started!',
        imagePath: 'assets/on_boarding_images/onboarding1.gif',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: pages.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (context, index) => pages[index],
          ),
          if (controller.currentIndex != pages.length - 1)
            Positioned(
              bottom: 40,
              left: 20,
              child: TextButton(
                onPressed: controller.skip,
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 40,
            right: 20,
            child: TextButton(
              onPressed: controller.next,
              child: Text(
                controller.currentIndex == pages.length - 1 ? 'Login' : 'Next',
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: controller.pageController,
                count: pages.length,
                effect: const WormEffect(
                  dotHeight: 12,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
