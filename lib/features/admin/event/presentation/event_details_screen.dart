import 'package:eventra/features/admin/event/extension/event.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:eventra/core/helper/external_launcher.dart';
import 'package:eventra/features/admin/event/model/event.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event = Event(
      adminID: "adminID",
      schedule: EventSchedule(
        start: DateTime.parse("2025-03-05 15:00:34.000"),
        end: DateTime.parse("2025-03-05 17:00:34.000"),
        date: DateTime.parse("2025-03-05 17:00:34.000"),
      ),
      category: EventCategory.software);
//dateTime: [2025-03-05 15:00:34.000, 2025-03-05 17:00:34.000]
  EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(event);
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Details"),
        actions: [
          IconButton(
            icon: Icon(Bootstrap.qr_code_scan),
            onPressed: () {
              // Navigate to edit event screen
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            event.cover,
            fit: BoxFit.cover,
            height: 300,
          ),
          SizedBox(height: 16),
          Text(
            event.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: Card(
              margin: EdgeInsets.zero,
              color: Colors.amber,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.calendar_month_outlined,
                  size: 30,
                ),
              ),
            ),
            title: Text(event.encodeDate()),
            subtitle: Text(event.encodeLongTime()),
          ),

          ListTile(
            onTap: () =>
                ExternalLauncher.launchLocation(location: event.location.url),
            leading: Card(
              margin: EdgeInsets.zero,
              color: Colors.amber,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.location_on,
                  size: 30,
                ),
              ),
            ),
            title: Text(event.location.name),
            subtitle: Text(event.location.address),
          ),

          // Card(
          //   child: Row(
          //     children: [Image.network(src)],
          //   ),
          // ),
          // Text(
          //   '${event.start.toLocal()} - ${event.end.toLocal()}',
          // ),
          SizedBox(height: 16),
          Text(
            "About Event",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            event.desc,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
