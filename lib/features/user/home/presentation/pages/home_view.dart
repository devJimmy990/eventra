import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.logout_rounded))
        ],
      ),
    );
  }
}
/**
 * Browse upcoming Events from today to end of the year {sorted by date}
 * Bookmarked, open event details
 * 
 */