import 'package:eventra/features/onboarding/pages/onboarding.dart';
import 'package:go_router/go_router.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    // todo @marina GoRoute(
    //   path: '/login',
    //   builder: (context, state) => const LoginPage(),
    //  ),
  ],
);