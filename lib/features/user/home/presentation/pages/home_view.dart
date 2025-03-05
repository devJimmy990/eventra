import 'package:eventra/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => context.push(Routes.settings),
              icon: Icon(Icons.settings))
        ],
      ),
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
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, size: 28),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 28),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

const pages = [
  Center(
      child: Text("Explore",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
  Center(
      child: Text("Events",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
  Center(
      child: Text("Map",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
  Center(
      child: Text("Profile",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
];
/**
 * Browse upcoming Events from today to end of the year {sorted by date}
 * Bookmarked, open event details
 * 
 */
