import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel onBoarding({
  required String title,
  required String body,
  required String imagePath,
  double imageHeight = 300,
  double paddingTop = 100,
}) {
  return PageViewModel(
    titleWidget: const SizedBox(),
    bodyWidget: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            body,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    image: Padding(
      padding: EdgeInsets.only(top: paddingTop.h),
      child: Center(
        child: Image.asset(
          imagePath,
          height: imageHeight.h,
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

  ),
  onBoarding(
    title: 'Get Started',
    body: 'Let’s get you started!',
    imagePath: 'assets/images/on_boarding_images/onboarding1.gif',

  ),
];
