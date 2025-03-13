import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel onBoarding({
  required String title,
  required String body,
}) {
  return PageViewModel(
    titleWidget: const SizedBox(),
    bodyWidget: const SizedBox(),
    footer: Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
  );
}

final List<PageViewModel> onboardingModel = [
  onBoarding(
    title: 'Welcome',
    body: 'Discover the app that makes your life easier',
  ),
  onBoarding(
    title: 'Feature Highlight',
    body: 'Explore our exciting features',
  ),
  onBoarding(
    title: 'Stay Connected',
    body: 'Stay connected with friends and family',
  ),
  onBoarding(
    title: 'Get Started',
    body: 'Let’s get you started!',
  ),
];
