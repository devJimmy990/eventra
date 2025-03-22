import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/features/authentication/cubit/auth_cubit.dart';
import 'package:eventra/features/authentication/presentation/pages/auth_screen.dart';
import 'package:eventra/features/authentication/presentation/pages/sign_in_screen.dart';
import 'package:eventra/features/authentication/presentation/pages/sign_up_screen.dart';
import 'package:eventra/generated/l10n.dart';

void main() {
  testWidgets(
      'AuthenticationScreen renders two tabs and displays SignInScreen by default',
          (WidgetTester tester) async {
        // Create an instance of AuthenticationCubit.
        final authCubit = AuthenticationCubit();

        await tester.pumpWidget(
          ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, child) {
              return MaterialApp(
                locale: const Locale('en'),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                home: BlocProvider<AuthenticationCubit>(
                  create: (_) => authCubit,
                  child: AuthenticationScreen(),
                ),
              );
            },
          ),
        );

        await tester.pumpAndSettle();

        // Verify that a TabBar exists.
        expect(find.byType(TabBar), findsOneWidget);

        // Verify that there are exactly two tabs.
        expect(find.byType(Tab), findsNWidgets(2));

        // By default, the SignInScreen (first tab) should be visible.
        expect(find.byType(SignInScreen), findsOneWidget);
        expect(find.byType(SignUpScreen), findsNothing);

        // Instead of using find.textContaining, tap on the second tab by index.
        await tester.tap(find.byType(Tab).at(1));
        await tester.pumpAndSettle();

        // After switching, verify that SignUpScreen is visible.
        expect(find.byType(SignUpScreen), findsOneWidget);
        expect(find.byType(SignInScreen), findsNothing);
      });
}
