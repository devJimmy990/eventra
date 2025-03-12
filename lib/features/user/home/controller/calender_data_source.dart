import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:eventra/features/user/event/data/models/booked_event.dart'; // UserEvent

class UserEventCalendarDataSource extends CalendarDataSource {
  UserEventCalendarDataSource(List<UserEvent> userEvents) {
    appointments = userEvents;
  }

  @override
  DateTime getStartTime(int index) {
    final userEvent = appointments![index] as UserEvent;
    return userEvent.schedule.start;
  }

  @override
  DateTime getEndTime(int index) {
    final userEvent = appointments![index] as UserEvent;
    return userEvent.schedule.end;
  }

  @override
  String getSubject(int index) {
    final userEvent = appointments![index] as UserEvent;
    return userEvent.title;
  }


  @override
  Color getColor(int index) {

    final List<Color> colorPalette = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
    ];

    // Assign a color based on the index (cyclic)
    return colorPalette[index % colorPalette.length];
  }



}
