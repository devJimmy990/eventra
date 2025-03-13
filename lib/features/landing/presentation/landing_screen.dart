import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/landing/cubit/user_state.dart';
import 'package:eventra/features/notification/cubit/notification_cubit.dart';
import 'package:eventra/features/admin/presentation/screens/home_screen.dart';
import 'package:eventra/features/user/home/presentation/screens/home_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserError) {
              Fluttertoast.showToast(
                msg: "user-error",
                textColor: Colors.white,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red,
                toastLength: Toast.LENGTH_SHORT,
              );
            } else if (state is UserLoaded) {
              if (state.user.role == "user") {
                context.read<NotificationCubit>().subscribeToTopic();
              }
            }
          },
          builder: (context, state) {
            if (state is UserLoaded) {
              return state.user.role == "user"
                  ? UserHomeScreen()
                  : AdminHomeScreen();
            } else if (state is UserLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Text("Landing Screen");
          },
        ),
      ),
    );
  }
}
