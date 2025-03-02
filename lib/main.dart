import 'package:eventra/core/theme/theme_cubit.dart';
import 'package:eventra/core/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:eventra/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
<<<<<<< HEAD
import 'package:eventra/core/routes/go_router.dart';
import 'package:eventra/core/firebase_options.dart';
=======
import 'package:eventra/core/firebase/firebase_options.dart';
>>>>>>> authentication
import 'package:eventra/core/shared_preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/firebase/provider.dart';
import 'core/style/app_theme.dart';
import 'features/authentication/sign_in/presentation/pages/sign_in_view.dart';
import 'features/authentication/sign_up/presentation/pages/sign_up_view.dart';
import 'features/home/presentation/pages/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreference.initialize();

  print("🔥 Firebase initialized successfully!");

  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthUserProvider(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit()..loadTheme(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          ThemeData themeData = ThemeData.light();

          if (state is ThemeLoaded || state is ToggleThemeState) {
            themeData = (state as dynamic).theme;
          }
          return MaterialApp.router(
            localizationsDelegates: [
              S.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: themeData,
            debugShowCheckedModeBanner: false,
            supportedLocales: S.delegate.supportedLocales,
            routerConfig: router,
          );
        },
      ),
=======
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: child,
          routes: {
            SignUpPage.routeName:(_)=> SignUpPage(),
            SignInPage.routeName:(_)=>  SignInPage(),
            HomeView.routeName:(_)=>  HomeView()},
          theme: AppTheme.lightTheme,
        );
      },
      child: SignInPage(),
>>>>>>> authentication
    );
  }
}