import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/user/home/cubit/event/event_state.dart';
import 'package:eventra/features/user/home/cubit/request/request_cubit.dart';
import 'package:eventra/features/user/home/cubit/request/request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final strings = Localization(context);
    return BlocProvider(
      create: (context) => UserEventRequestCubit(event.id!),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              expandedHeight: 250,
              pinned: true,
              // Display the event cover image in the flexible space.
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  strings.eventDetails,
                  style: TextStyle(color: Colors.white),
                ),
                background: event.cover == null
                    ? Image.asset(
                        StringsManager.eventImage,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        event.cover!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            StringsManager.eventImage,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                  tooltip: strings.bookmark,
                  onPressed: () {},
                ),
              ],
            ),
            // Content below the app bar with rounded top corners.
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Event Title
                      Text(
                        event.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Date Section
                      ListTile(
                        leading: Card(
                          margin: EdgeInsets.zero,
                          color: const Color(0xFFECEEFD),
                          child: const CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.calendar_month_outlined,
                              color: Color(0xFF5669FD),
                              size: 30,
                            ),
                          ),
                        ),
                        title: Text(event.schedule.date.encodeDate()),
                        subtitle: Text(event.encodeLongDateTime()),
                      ),
                      // Location Section
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
                              Icons.location_on,
                              color: Color(0xFF5669FD),
                              size: 30,
                            ),
                          ),
                        ),
                        title: Text(event.location.name),
                        subtitle: Text(event.location.address),
                      ),
                      const SizedBox(height: 16),
                      // About Event Section
                      Text(
                        strings.aboutEvent,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        event.desc,
                        textAlign: TextAlign.justify,
                      ),
                      // const SizedBox(height: 16),
                      // First QR Code
                      // QrImageView(
                      //   data: event.toString(),
                      //   version: QrVersions.auto,
                      //   size: 320,
                      //   gapless: false,
                      //   embeddedImage: const AssetImage(
                      //       'assets/images/my_embedded_image.png'),
                      //   embeddedImageStyle: QrEmbeddedImageStyle(
                      //     size: const Size(80, 80),
                      //   ),
                      // ),
                      // const SizedBox(height: 16),
                      // // Second QR Code
                      // QrImageView(
                      //   data: json.encode(event),
                      //   version: QrVersions.auto,
                      //   size: 200.0,
                      //   backgroundColor: Colors.white,
                      //   eyeStyle: const QrEyeStyle(
                      //     eyeShape: QrEyeShape.square,
                      //     color: Colors.black,
                      //   ),
                      // ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        // Book/Buy Ticket Button
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<UserEventRequestCubit, UserEventRequestState>(
            builder: (context, state) {
              if (state is EventRequestLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is EventRequestLoaded) {
                return Text("data");
              } else if (state is EventLoaded) {
                return Text("EventLoaded");
              } else if (state is EventRequestEmpty) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<UserEventRequestCubit>().bookEvent(event);
                  },
                  child: Text(
                    event.price == 0
                        ? strings.bookNow
                        : "${strings.buyTicket} \$${event.price}",
                  ),
                );
              } else if (state is EventRequestError) {
                return Text(state.error);
              } else if (state is EventRequestInitial) {
                return Text("initial");
              }
              return Text(state.toString());
            },
          ),
        ),
      ),
    );
  }
}
