import 'package:eventra/features/admin/event/extension/string.dart';
import 'package:eventra/features/user/profile/widgets/profile_about_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/user/profile/widgets/profile_events_tab.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = context.read<UserCubit>().user!;
    print("avatar: ${user.avatar?.length ?? user.avatar}");
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      user.avatar != null ? NetworkImage(user.avatar!) : null,
                  child: user.avatar == null ? Text(user.name.nameAbb()) : null,
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
                      ProfileEventsTab(),
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
