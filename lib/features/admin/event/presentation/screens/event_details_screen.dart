import 'dart:io';
import 'package:eventra/features/admin/event/extension/date_time.dart';
import 'package:eventra/features/admin/event/extension/string.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/core/helper/external_launcher.dart';
import 'package:eventra/features/admin/event/model/admin_event.dart';
import 'package:eventra/features/admin/event/extension/event.dart';

class EventDetailsScreen extends StatelessWidget {
  // final Event event = Event(
  //   adminID: "adminID",
  //   schedule: EventSchedule(
  //     start: DateTime.parse("2025-03-05 15:00:34.000").encodeTime(),
  //     end: DateTime.parse("2025-03-05 17:00:34.000").encodeTime(),
  //     date: DateTime.parse("2025-03-05 19:00:34.000").encodeDate(),
  //   ),
  //   category: EventCategory.software,
  // );

  final AdminEvent event;
  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Event Details"),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  event.cover == null
                      ? Image.asset(event.cover!, fit: BoxFit.cover)
                      : event.cover!.startsWith('/')
                          ? Image.file(File(event.cover!), fit: BoxFit.cover)
                          : Image.asset(event.cover!, fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color.fromARGB(255, 79, 79, 79).withAlpha(500),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: IconButton(
                  icon: Icon(
                    Icons.qr_code_scanner,
                    size: 38,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    // Implement QR code scanning
                  },
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    event.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                ListTile(
                  leading: Card(
                    margin: EdgeInsets.zero,
                    color: Color(0xFFECEEFD),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        color: Color(0xFF5669FD),
                        Icons.calendar_month_outlined,
                        size: 30,
                      ),
                    ),
                  ),
                  title: Text(event.schedule.date.encodeDate()),
                  subtitle: Text(event.encodeLongTime()),
                ),
                ListTile(
                  onTap: () => ExternalLauncher.launchLocation(
                      location: event.location.url),
                  leading: Card(
                    margin: EdgeInsets.zero,
                    color: Color(0xFFECEEFD),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        color: Color(0xFF5669FD),
                        Icons.location_on,
                        size: 30,
                      ),
                    ),
                  ),
                  title: Text(event.location.name),
                  subtitle: Text(event.location.address),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "About Event",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    event.desc,
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Attendees",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      if (event.attendees.isNotEmpty)
                        TextButton(
                            onPressed: () => context.pushNamed(
                                  AdminRoutes.eventAttendees,
                                  extra: event.attendees,
                                ),
                            child: Text(
                              "see all",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (_, inx) => inx == 24
                    ? CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 30,
                          child: Text(
                            "+${event.attendees.length - 24}",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      )
                    : event.attendees[inx].avatar != null
                        ? CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.grey,
                            child: CircleAvatar(
                              radius: 30,
                              child:
                                  Image.network(event.attendees[inx].avatar!),
                            ),
                          )
                        : CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.grey,
                            child: CircleAvatar(
                              radius: 30,
                              child: Text(event.attendees[inx].name.nameAbb()),
                            ),
                          ),
                childCount: event.attendees.length > 25 ? 25 : 10,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
