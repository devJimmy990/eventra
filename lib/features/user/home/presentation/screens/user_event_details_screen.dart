import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:eventra/core/helper/external_launcher.dart';
import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/admin/event/extension/event.dart';
import 'package:eventra/features/admin/event/extension/date_time.dart';
import 'package:eventra/features/user/home/data/model/booked_event.dart';

class UserEventDetailsScreen extends StatelessWidget {
  final UserEvent event;
  const UserEventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Details"),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark),
            tooltip: 'Bookmark',
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  event.cover == null
                      ? Image.asset(
                          StringsManager.eventImage,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          event.cover!,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              StringsManager.eventImage,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            );
                          },
                        ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      event.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),

                  ListTile(
                    leading: Card(
                      margin: EdgeInsets.zero,
                      color: const Color(0xFFECEEFD),
                      child: const CircleAvatar(
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
                    subtitle: Text(event.encodeLongDateTime()),
                  ),

                  ListTile(
                    onTap: () => ExternalLauncher.launchLocation(
                      location: event.location.url,
                    ),
                    leading: Card(
                      margin: EdgeInsets.zero,
                      color: const Color(0xFFECEEFD),
                      child: const CircleAvatar(
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

                  const SizedBox(height: 16),

                  // About Event Section
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
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
                  QrImageView(
                    data: event.toString(),
                    version: QrVersions.auto,
                    size: 320,
                    gapless: false,
                    embeddedImage:
                        AssetImage('assets/images/my_embedded_image.png'),
                    embeddedImageStyle: QrEmbeddedImageStyle(
                      size: Size(80, 80),
                    ),
                  ),
                  QrImageView(
                    data: json.encode(event),
                    version: QrVersions.auto,
                    size: 200.0,
                    backgroundColor: Colors.white,
                    eyeStyle: QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Book/Buy Ticket Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  event.price == 0 ? "Book Now" : "Buy Ticket \$${event.price}",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
