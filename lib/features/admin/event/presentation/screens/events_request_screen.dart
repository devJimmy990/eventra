import 'package:flutter/material.dart';

class EventsRequestScreen extends StatelessWidget {
  const EventsRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Events Request'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, inx) => Text("data"),
      ),
    );
  }
}
