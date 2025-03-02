import 'package:eventra/features/user/home/page.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/features/user/contact-us/presentation/page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: "home",
      path: "/",
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name: Routes.sContact,
      path: "/contact-us",
      builder: (context, state) => ContactUsScreen(),
    ),
  ],
);
