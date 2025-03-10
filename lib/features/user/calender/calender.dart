import 'package:eventra/features/user/calender/calender_data_source.dart';
import 'package:eventra/features/user/home/cubit/event_cubit.dart';
import 'package:eventra/features/user/home/cubit/event_state.dart';
import 'package:eventra/features/user/home/data/model/booked_event.dart'; // for UserEvent
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventCalendarPage extends StatelessWidget {
  const EventCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: const Center(child: Text("Event Calendar"))),
      body: BlocProvider(
        create: (context) => EventCubit(),
        child: BlocBuilder<EventCubit, EventState>(
          builder: (context, state) {
            if (state is EventInitial) {
              context.read<EventCubit>().getEvents();
              return const Center(child: CircularProgressIndicator());
            } else if (state is EventLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EventError) {
              return Center(child: Text("Error: ${state.error}"));
            } else if (state is EventLoaded) {
              final dataSource =
              UserEventCalendarDataSource(state.events);
              return SfCalendar(
                view: CalendarView.month,
                dataSource: dataSource,
                monthViewSettings: const MonthViewSettings(
                  showAgenda: true,
                ),
                onTap: (CalendarTapDetails details) {
                  // Check if an appointment (or appointments) is tapped.
                  if (details.appointments != null &&
                      details.appointments!.isNotEmpty) {
                    final appointments = details.appointments!;
                    if (appointments.length == 1) {
                      // Single event tapped. Navigate directly.
                      final event = appointments.first as UserEvent;
                      // context.goNamed(UserRoutes.home);event: event),
                      //   ),
                      // );
                    } else {
                      // Multiple events on this day. Show a dialog for selection.
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Select Event'),
                            content: SizedBox(
                              width: double.maxFinite,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: appointments.length,
                                itemBuilder: (context, index) {
                                  final event =
                                  appointments[index] as UserEvent;
                                  return ListTile(
                                    title: Text(event.title),
                                    subtitle: Text(
                                      "${event.schedule.start} - ${event.schedule.end}",
                                    ),
                                    onTap: () {
                                      Navigator.pop(context); // close dialog
                                      //todo Will navigate to the event details page
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         EventDetailsPage(
                                      //             event: event),
                                      //   ),
                                      // );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }
                },
              );
            }
            return const Center(child: Text("No events available"));
          },
        ),
      ),
    );
  }
}