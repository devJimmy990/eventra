import 'package:flutter/material.dart';

class EventAttendeesListScreen extends StatelessWidget {
  final List<String> attendees;
  const EventAttendeesListScreen(this.attendees, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        itemCount: attendees.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemBuilder: (context, index) => CircleAvatar(
          radius: 32,
          backgroundColor: Colors.amber,
          child: CircleAvatar(
            radius: 30,
            child: Text("JI"),
          ),
        ),
      ),
    );
  }
}
