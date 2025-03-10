import 'package:eventra/features/user/calender/calender.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/admin/home/cubit/event_cubit.dart';
import 'package:eventra/features/admin/event/model/admin_event.dart';
import 'package:eventra/features/onboarding/page/onboarding_screen.dart';
import 'package:eventra/features/user/bookmarks/cubit/bookmark_cubit.dart';
import 'package:eventra/features/landing/presentation/landing_screen.dart';
import 'package:eventra/features/settings/presentation/settings_screen.dart';
import 'package:eventra/features/user/home/presentation/pages/home_screen.dart';
import 'package:eventra/features/user/contact-us/screens/contact_us_screen.dart';
import 'package:eventra/features/admin/home/presentation/screens/home_screen.dart';
import 'package:eventra/features/authentication/presentation/pages/auth_screen.dart';
import 'package:eventra/features/user/profile/presentation/screens/profile_screen.dart';
import 'package:eventra/features/user/bookmarks/presentation/screens/bookmark_screen.dart';
import 'package:eventra/features/admin/event/presentation/screens/event_details_screen.dart';
import 'package:eventra/features/admin/event/presentation/screens/events_request_screen.dart';
import 'package:eventra/features/admin/event/presentation/screens/event_attendees_list_screen.dart';

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
  initialLocation: "/landing",
  routes: [
    // General Routes ================================================
    GoRoute(
      path: "/auth",
      name: Routes.auth,
      builder: (context, state) => AuthenticationScreen(),
    ),

    GoRoute(
      path: "/landing",
      name: Routes.landing,
      builder: (context, state) => LandingScreen(),
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
    //================================================================

    // User Routes ===================================================
    GoRoute(
      path: "/user/contact",
      name: UserRoutes.contact,
      builder: (context, state) => ContactUsScreen(),
    ),
    GoRoute(
      path: "/user/home",
      name: UserRoutes.home,
      builder: (context, state) => UserHomeScreen(),
    ),
    GoRoute(
        path: "/user/bookmark",
        name: UserRoutes.bookmark,
        builder: (context, state) => BlocProvider<BookmarkCubit>(
              create: (context) => BookmarkCubit(),
              child: BookmarkScreen(),
            )),
    GoRoute(
        path: "/user/profile",
        name: UserRoutes.profile,
        builder: (context, state) => MyProfilePage()),

    //================================================================

    // Admin Routes ==================================================
    GoRoute(
        path: "/admin/home",
        name: AdminRoutes.home,
        builder: (context, state) {
          return BlocProvider<EventCubit>(
            create: (context) => EventCubit(),
            child: AdminHomeScreen(),
          );
        }),
    GoRoute(
      path: "/admin/requests",
      name: AdminRoutes.eventRequests,
      builder: (context, state) => EventsRequestScreen(),
    ),
    GoRoute(
      path: "/admin/event",
      name: AdminRoutes.eventDetails,
      builder: (context, state) {
        final AdminEvent event = state.extra as AdminEvent;
        return EventDetailsScreen(event: event);
      },
    ),
    GoRoute(
      path: "/admin/event/attendees",
      name: AdminRoutes.eventAttendees,
      builder: (context, state) {
        final List<User> attendees = state.extra as List<User>;
        return EventAttendeesListScreen(attendees);
      },
    ),
    //================================================================
  ],
);
