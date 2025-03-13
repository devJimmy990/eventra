import 'package:eventra/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:eventra/features/landing/data/model/user.dart';

class EventAttendeesListScreen extends StatelessWidget {
  final List<User> attendees;
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
        itemBuilder: (context, inx) => CircleAvatar(
          radius: 32,
          backgroundColor: Colors.grey,
          child: CircleAvatar(
            radius: 30,
            child: Text(attendees[inx].name.abbreviate()),
          ),
        ),
      ),
    );
  }
}
