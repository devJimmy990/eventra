import 'package:eventra/core/helper/localization.dart';
import 'package:flutter/material.dart';

class EventsRequestScreen extends StatelessWidget {
  const EventsRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {    final Localization strings = Localization(context);

  return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(strings.eventsRequest),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, inx) => Text(strings.data),
      ),
    );
  }
}
