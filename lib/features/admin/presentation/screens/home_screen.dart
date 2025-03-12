import 'package:eventra/features/admin/presentation/widget/admin_drawer.dart';
import 'package:flutter/material.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/admin/presentation/views/explore_view.dart';
import 'package:eventra/features/admin/presentation/views/profile_view.dart';
import 'package:eventra/features/admin/presentation/views/events_requests_view.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int _index = 0;

  final List<Widget> _pages = <Widget>[
    AdminExploreView(),
    AdminEventsRequestsView(),
    AdminProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final Localization strings = Localization(context);

    return Scaffold(
      appBar: AppBar(),
      drawer: AdminDrawer(),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[500],
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _index = index),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.explore, size: 28),
            label: strings.explore,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications, size: 28),
            label: "requests",
          ),
          BottomNavigationBarItem(
            icon: const CircleAvatar(
              radius: 14,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 20,
              ),
            ),
            label: "profile",
          ),
        ],
      ),
    );
  }
}
