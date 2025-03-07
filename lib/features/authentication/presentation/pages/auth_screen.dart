import 'package:flutter/material.dart';
import 'package:eventra/features/authentication/presentation/pages/sign_in_screen.dart';
import 'package:eventra/features/authentication/presentation/pages/sign_up_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: "Sign In"),
                Tab(text: "Sign Up"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SignInScreen(onRegister: () => _tabController.animateTo(1)),
                  SignUpScreen(onLogin: () => _tabController.animateTo(0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
