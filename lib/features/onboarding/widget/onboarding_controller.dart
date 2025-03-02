import 'package:flutter/material.dart';

class OnboardingController extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentIndex = 0;
  final int totalPages;
  final VoidCallback? onFinish;

  OnboardingController({required this.totalPages, this.onFinish});

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void next() {
    if (currentIndex < totalPages - 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    } else {
      finish();
    }
  }

  void skip() {
    pageController.animateToPage(
      totalPages - 1,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  void finish() {
    if (onFinish != null) {
      onFinish!();
    }
  }
}
