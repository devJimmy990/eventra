import 'dart:convert';

import 'package:eventra/core/constants/extensions.dart';
import 'package:eventra/core/helper/localization.dart';
import 'package:eventra/features/landing/cubit/user_cubit.dart';
import 'package:eventra/features/user/event/cubit/request_cubit.dart';
import 'package:eventra/features/user/event/cubit/request_state.dart';
import 'package:eventra/features/user/home/data/model/request_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/external_launcher.dart';
import 'package:eventra/core/constants/strings_manager.dart';
import 'package:eventra/features/admin/extension/event.dart';
import 'package:eventra/features/user/event/data/models/booked_event.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserEventDetailsScreen extends StatelessWidget {
  final UserEvent event;
  const UserEventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
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
                  tooltip: Localization.userEventDetailsBookmark,
                  onPressed: () {},
                ),
              ],
            ),
            // Content below the app bar with rounded top corners.
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                decoration: const BoxDecoration(
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
                        Localization.userEventDetailsAbout,
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
              } else if (state is EventRequestEmpty) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<UserEventRequestCubit>().bookEvent(
                          event,
                          context.read<UserCubit>().user!,
                        );
                  },
                  child: Text(
                    event.price == 0
                        ? Localization.userEventDetailsBook
                        : "${Localization.userEventDetailsBuy} \$${event.price}",
                  ),
                );
              } else if (state is EventRequestError) {
                return Center(
                    child:
                        Text(state.error, style: TextStyle(color: Colors.red)));
              } else if (state is EventRequestLoaded) {
                final RequestEvent request = state.request;
                return request.status == RequestStatus.waiting
                    ? Text(
                        Localization.userEventDetailsWait,
                        textAlign: TextAlign.center,
                      )
                    : request.status == RequestStatus.rejected
                        ? Text(
                            Localization.userEventDetailsReject,
                            textAlign: TextAlign.center,
                          )
                        : ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  content: SizedBox(
                                    width: 300,
                                    height: 300,
                                    child: QrImageView(
                                      data: json.encode(request),
                                      version: QrVersions.auto,
                                      size: 300,
                                      backgroundColor: Colors.transparent,
                                      eyeStyle: const QrEyeStyle(
                                        eyeShape: QrEyeShape.square,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Text(Localization.userEventDetailsQR),
                          );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
