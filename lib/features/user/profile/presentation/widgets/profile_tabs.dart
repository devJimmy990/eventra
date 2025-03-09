import 'package:flutter/material.dart';
import 'package:eventra/features/user/profile/presentation/widgets/about_me.dart';
import 'package:eventra/features/user/profile/presentation/widgets/interests.dart';

class ProfileTabs extends StatelessWidget {
  final TabController tabController;

  const ProfileTabs({required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            tabs: const [
              Tab(text: 'About'),
              Tab(text: 'Events'),
            ],
            labelColor: Colors.deepPurpleAccent,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.deepPurpleAccent,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      AboutMeSection(),
                      InterestsWidget(),
                    ],
                  ),
                ),
                EventsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EventsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Events ',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
