import 'package:eventra/features/admin/event/model/event.dart';
import 'package:eventra/features/admin/event/presentation/screens/event_attendees_list_screen.dart';
import 'package:eventra/features/admin/event/presentation/screens/event_details_screen.dart';
import 'package:eventra/features/admin/event/presentation/screens/events_request_screen.dart';
import 'package:eventra/features/admin/home/cubit/event_cubit.dart';
import 'package:eventra/features/admin/home/screens/home_screen.dart';
import 'package:eventra/features/authentication/presentation/pages/auth_screen.dart';
import 'package:eventra/features/landing/presentation/landing_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/features/onboarding/page/onboarding_screen.dart';
import 'package:eventra/features/settings/presentation/settings_screen.dart';
import 'package:eventra/features/user/home/presentation/pages/home_view.dart';
import 'package:eventra/features/user/contact-us/screens/contact_us_screen.dart';

final router = GoRouter(
  initialLocation: "/admin/home",
  routes: [
    // General Routes ================================================
    GoRoute(
      name: Routes.auth,
      path: "/auth",
      builder: (context, state) => AuthenticationScreen(),
    ),
    GoRoute(
      name: Routes.landing,
      path: "/landing",
      builder: (context, state) => LandingScreen(),
    ),

    GoRoute(
      name: Routes.onboarding,
      path: "/onboarding",
      builder: (context, state) => const OnboardingScreen(),
    ),

    GoRoute(
      name: Routes.settings,
      path: "/settings",
      builder: (context, state) => const SettingsScreen(),
    ),
    //================================================================

    // User Routes ===================================================
    GoRoute(
      name: UserRoutes.contact,
      path: "/user/contact",
      builder: (context, state) => ContactUsScreen(),
    ),

    GoRoute(
      name: UserRoutes.home,
      path: "/user/home",
      builder: (context, state) => HomeView(),
    ),
    //================================================================

    //Admin Routes ===================================================
    GoRoute(
      name: AdminRoutes.home,
      path: "/admin/home",
      builder: (context, state) =>
          BlocProvider(
            create: (context) => EventCubit()..getEvents(),
            child: AdminHomeScreen(),
          ),
    ),
    GoRoute(
      name: AdminRoutes.eventRequests,
      path: "/admin/requests",
      builder: (context, state) => EventsRequestScreen(),
    ),
    GoRoute(
      name: AdminRoutes.eventDetails,
      path: "/admin/event",
      builder: (context, state) {
        final Event event = state.extra as Event;
        return EventDetailsScreen(event: event);
      },
    ),

    GoRoute(
      name: AdminRoutes.eventAttendees,
      path: "/admin/event/attendees",
      builder: (context, state) {
        final List<String> attendees = state.extra as List<String>;
        return EventAttendeesListScreen(attendees);
      },
    ),
    //================================================================
  ],
  // redirect: (context, state) async {
  //   await SharedPreference.initialize();
  //   final bool? onboardingComplete =
  //       SharedPreference.getBool(key: 'onboarding_complete');

  //   if (onboardingComplete == null) {
  //     return Routes.sHome;
  //   }
  //   return state.matchedLocation;
  // },
);
