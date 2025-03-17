import 'package:eventra/features/user/event/data/models/booked_event.dart';
import 'package:eventra/features/user/home/presentation/screens/home_screen.dart';
import 'package:eventra/features/user/event/presentation/user_event_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/admin/data/model/admin_event.dart';
import 'package:eventra/features/onboarding/page/onboarding_screen.dart';
import 'package:eventra/features/landing/presentation/landing_screen.dart';
import 'package:eventra/features/settings/presentation/settings_screen.dart';
import 'package:eventra/features/user/contact-us/screens/contact_us_screen.dart';
import 'package:eventra/features/admin/presentation/screens/home_screen.dart';
import 'package:eventra/features/authentication/presentation/pages/auth_screen.dart';
import 'package:eventra/features/user/profile/profile_screen.dart';
import 'package:eventra/features/user/bookmarks/presentation/screens/bookmark_screen.dart';
import 'package:eventra/features/admin/presentation/screens/event_details_screen.dart';
import 'package:eventra/features/admin/presentation/screens/event_attendees_list_screen.dart';

import '../../features/user/home/presentation/view/calender_view.dart';

String? _handleRedirect(BuildContext context, GoRouterState state) {
  final bool onboardingComplete =
      SharedPreference.getBool(key: "onboarding_complete") ?? false;

  if (!onboardingComplete) {
    return "/onboarding";
  }

  final String? userId = SharedPreference.getString(key: 'uid');

  if (userId == null) {
    return "/auth";
  }

  return null;
}

final router = GoRouter(
  redirect: _handleRedirect,
  initialLocation: "/",
  routes: [
    // General Routes ================================================
    GoRoute(
      path: "/auth",
      name: Routes.auth,
      builder: (context, state) => AuthenticationScreen(),
    ),
    GoRoute(
      path: "/onboarding",
      name: Routes.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      name: Routes.settings,
      path: "/settings",
      builder: (context, state) => const SettingsScreen(),
    ),

    // Parent Route (LandingScreen) =================================
    GoRoute(
      path: "/",
      name: Routes.landing,
      builder: (context, state) => LandingScreen(),
      routes: [
        // Admin Routes =============================================
        GoRoute(
          path: "admin",
          name: AdminRoutes.home,
          builder: (context, state) => AdminHomeScreen(),
          routes: [
           
            GoRoute(
              path: "event",
              name: AdminRoutes.eventDetails,
              builder: (context, state) {
                final AdminEvent event = state.extra as AdminEvent;
                return AdminEventDetailsScreen(event: event);
              },
            ),
            GoRoute(
              path: "event/attendees",
              name: AdminRoutes.eventAttendees,
              builder: (context, state) {
                final List<User> attendees = state.extra as List<User>;
                return EventAttendeesListScreen(attendees);
              },
            ),
          ],
        ),

        // User Routes ==============================================
        GoRoute(
          path: "user",
          name: UserRoutes.home,
          builder: (context, state) => UserHomeScreen(),
          routes: [
            GoRoute(
              path: "contact",
              name: UserRoutes.contact,
              builder: (context, state) => ContactUsScreen(),
            ),
            GoRoute(
              path: "bookmark",
              name: UserRoutes.bookmark,
              builder: (context, state) => BookmarkScreen(),
            ),
            GoRoute(
              path: "profile",
              name: UserRoutes.profile,
              builder: (context, state) => UserProfileScreen(),
            ),
            GoRoute(
              path: "calendar",
              name: UserRoutes.calendar,
              builder: (context, state) => EventCalendarView(),
            ),
            GoRoute(
                path: "event",
                name: UserRoutes.event,
                builder: (context, state) {
                  final UserEvent event = state.extra as UserEvent;
                  return UserEventDetailsScreen(event: event);
                }),
          ],
        ),
      ],
    ),
  ],
);
