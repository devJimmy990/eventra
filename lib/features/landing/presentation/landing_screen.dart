import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/landing/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserLoaded) {
              context.goNamed(state.user.role == "user"
                  ? UserRoutes.home
                  : AdminRoutes.home);
            } else if (state is UserError) {
              Fluttertoast.showToast(
                msg: "user-error",
                textColor: Colors.white,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red,
                toastLength: Toast.LENGTH_SHORT,
              );
            } else {
              Fluttertoast.showToast(
                msg: "another-scenario",
                textColor: Colors.white,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red,
                toastLength: Toast.LENGTH_SHORT,
              );
            }
          },
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
