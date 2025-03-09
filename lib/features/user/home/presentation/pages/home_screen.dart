import 'package:eventra/features/user/home/presentation/pages/explore_view.dart';
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, size: 28),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event, size: 28),
            label: 'Calendar',
          ),
        ],
      ),
    );
  }
}

var pages = [
  ExploreView(),
  const Center(
      child: Text("Calendar",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
];
/**
 * Browse upcoming Events from today to end of the year {sorted by date}
 * Bookmarked, open event details
 * 
 */
