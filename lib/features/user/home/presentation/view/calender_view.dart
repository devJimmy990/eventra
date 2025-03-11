import 'package:eventra/core/routes/routes.dart';
import 'package:eventra/features/admin/event/extension/event.dart';
import 'package:eventra/features/user/home/cubit/event_cubit.dart';
import 'package:eventra/features/user/home/cubit/event_state.dart';
import 'package:eventra/features/user/home/controller/calender_data_source.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:eventra/features/user/home/data/model/booked_event.dart';

class EventCalendarView extends StatelessWidget {
  const EventCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Event Calendar"))),
      body: BlocBuilder<UserEventCubit, UserEventState>(
        builder: (context, state) {
          if (state is EventLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EventError) {
            return Center(child: Text("Error: ${state.error}"));
          } else if (state is EventLoaded) {
            final dataSource = UserEventCalendarDataSource(state.events);
            return SfCalendar(
              dataSource: dataSource,
              view: CalendarView.month,
              monthViewSettings: const MonthViewSettings(
                showAgenda: true,
              ),
              appointmentBuilder:
                  (BuildContext context, CalendarAppointmentDetails details) {
                final event = details.appointments.first as UserEvent;
                final index = dataSource.appointments!.indexOf(event);
                final tileColor = dataSource.getColor(index);

                return ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  dense: true,
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  title: Text(
                    event.title,
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(event.encodeLongTime(),
                      style: TextStyle(color: Colors.white)),
                  tileColor: tileColor,
                  onTap: () =>
                      context.pushNamed(UserRoutes.event, extra: event),
                );
              },
            );
          }
          return const Center(child: Text("No events available"));
        },
      ),
    );
  }
}
