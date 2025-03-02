
import 'package:eventra/features/onboarding/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  ///TOdo refine the title and description and GIF images
  final List<Widget> _pages = [
    const Onboarding(
      title: 'Welcome',
      description: 'Discover the app that makes your life easier',
      imagePath: 'assets/on_boarding_images/onboarding1.gif',
    ),
    const Onboarding(
      title: 'Welcome',
      description: 'Discover the app that makes your life easier',
      imagePath: 'assets/on_boarding_images/onboardingC.gif',
    ),
    const Onboarding(
      title: 'Welcome',
      description: 'Discover the app that makes your life easier',
      imagePath: 'assets/on_boarding_images/onboarding1.gif',
    ),
    const Onboarding(
      title: 'Welcome',
      description: 'Discover the app that makes your life easier',
      imagePath: 'assets/on_boarding_images/onboarding1.gif',
    ),
  ];

  void _skip() {
    _pageController.animateToPage(
      _pages.length - 1,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  void _onNext() {
    _currentIndex < _pages.length - 1
        ? _pageController.nextPage(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          )
        : _onFinish();
  }

  void _onFinish() {
    // context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) => _pages[index],
          ),
          if (_currentIndex == _pages.length - 1)
            const SizedBox.shrink()
          else
            Positioned(
              bottom: 40,
              left: 20,
              child: TextButton(
                onPressed: _skip,
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
          // Next button
          Positioned(
            bottom: 40,
            right: 20,
            child: TextButton(
              onPressed: _onNext,
              child: Text(
                _currentIndex == _pages.length - 1 ? 'Login' : 'Next',
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
                controller: _pageController,
                count: _pages.length,
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
