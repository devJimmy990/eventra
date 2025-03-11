import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/user/home/presentation/view/calender_view.dart';
import 'package:eventra/features/user/home/presentation/view/explore_view.dart';
import 'package:eventra/features/user/home/presentation/widgets/user_drawer.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final strings = Localization(context);
    return Scaffold(
      drawer: UserDrawer(),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (val) => setState(() => _selectedIndex = val),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[500],
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.explore, size: 28),
            label: strings.explore,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.event, size: 28),
            label: strings.calendar,
          ),
        ],
      ),
    );
  }
}

var pages = [
  EventExploreView(),
  EventCalendarView(),
];
