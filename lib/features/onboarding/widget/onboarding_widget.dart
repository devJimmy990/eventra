import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel onBoarding({
  required String title,
  required String body,
  required String imagePath,
  double imageHeight = 300,
  double paddingTop = 100,
}) {
  return PageViewModel(
    title: title,
    body: body,
    image: Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Center(
        child: Image.asset(
          imagePath,
          height: imageHeight,
        ),
      ),
    ),
  );
}

final List<PageViewModel> onboardingModel = [
  onBoarding(
    title: 'Welcome',
    body: 'Discover the app that makes your life easier',
    imagePath: 'assets/images/on_boarding_images/onboarding1.gif',
    paddingTop: 100,
  ),
  onBoarding(
    title: 'Feature Highlight',
    body: 'Explore our exciting features',
    imagePath: 'assets/images/on_boarding_images/onboardingC.gif',
  ),
  onBoarding(
    title: 'Stay Connected',
    body: 'Stay connected with friends and family',
    imagePath: 'assets/images/on_boarding_images/onboarding1.gif',
    paddingTop: 120,
  ),
  onBoarding(
    title: 'Get Started',
    body: 'Let’s get you started!',
    imagePath: 'assets/images/on_boarding_images/onboarding1.gif',
    paddingTop: 140,
  ),
];
