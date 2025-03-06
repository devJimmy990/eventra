import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/features/authentication/cubit/auth_cubit.dart';
import 'package:eventra/features/authentication/presentation/pages/sign_in_view.dart';
import 'package:eventra/features/authentication/presentation/pages/sign_up_view.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthenticationCubit(),
      child: Scaffold(
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            children: [
              SignInPage(),
              SignUpPage(),
            ],
          ),
        ),
      ),
    );
  }
}
