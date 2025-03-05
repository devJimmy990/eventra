import 'package:eventra/core/helper/external_launcher.dart';
import 'package:eventra/features/admin/event/model/event.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event = Event(
      adminID: "adminID",
      schedule: EventSchedule(
        start: DateTime.now().toString(),
        end: DateTime.now().toString(),
        date: "4 March, 2025",
      ),
      location: EventLocation(
        name: "U.S. Embassy Cairo",
        address: "5 Tawfik Diab Street, Garden City",
        url: "https://maps.app.goo.gl/XFgU1GQnb54WtviN9",
      ),
      category: EventCategory.software);

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
            title: Text(event.schedule.date),
            subtitle: Row(
              spacing: 5,
              children: [
                Text("Tuesday,"),
                Text("12:00PM"),
                Text(" - "),
                Text("5:00PM"),
              ],
            ),
          ),

          ListTile(
            onTap: ExternalLauncher.launchLocation(location: event.location.url),
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
