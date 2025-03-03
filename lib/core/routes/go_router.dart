import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/onboarding/page/onboarding_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/constants/routes.dart';
import 'package:eventra/features/user/home/presentation/pages/home_view.dart';
import 'package:eventra/features/user/contact-us/pages/contact_us_page.dart';
import 'package:eventra/features/authentication/sign_in/presentation/pages/sign_in_view.dart';
import 'package:eventra/features/authentication/sign_up/presentation/pages/sign_up_view.dart';

final router = GoRouter(
  initialLocation: Routes.sOnboarding,
  routes: [
    GoRoute(
      name: Routes.sContact,
      path: Routes.sContact,
      builder: (context, state) => ContactUsScreen(),
    ),
    GoRoute(
      name: Routes.sRegister,
      path: Routes.sRegister,
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      name: Routes.sLogin,
      path: Routes.sLogin,
      builder: (context, state) => SignInPage(),
    ),
    GoRoute(
      name: Routes.sHome,
      path: Routes.sHome,
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      name: Routes.sOnboarding,
      path: Routes.sOnboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
  ],
  redirect: (context, state) async {
    await SharedPreference.initialize();
    final bool? onboardingComplete = SharedPreference.getBool(key: 'onboarding_complete');

    if (onboardingComplete == true) {
      return Routes.sLogin;
    }
    return null;
  },
);
  // redirect: (context, state) {
  //   // final isOnBoarding = false;
  //   // final isLoggedIn = false;

  //   // if (!isLoggedIn && state.uri.toString() != Routes.sLogin) {
  //   //   return Routes.sLogin;
  //   // }

  //   // return null;
  // },

