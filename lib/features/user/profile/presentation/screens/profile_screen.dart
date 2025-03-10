import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/user/profile/presentation/widgets/profile_events_tab.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = context.read<UserCubit>().user!;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.avatar ?? ""),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                TabBar(tabs: [
                  Tab(text: 'About'),
                  Tab(text: 'Events'),
                ]),
                Expanded(
                  child: TabBarView(
                    children: [
                      ProfileAboutTab(),
                      Center(
                        child: Text('Events'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
