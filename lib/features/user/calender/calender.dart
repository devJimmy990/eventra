import 'package:eventra/features/admin/home/cubit/event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:eventra/features/admin/event/model/admin_event.dart';
import 'package:eventra/features/admin/home/cubit/event_cubit.dart';

class UserCalendarPage extends StatefulWidget {
  const UserCalendarPage({super.key});

  @override
  State<UserCalendarPage> createState() => _UserCalendarPageState();
}

class _UserCalendarPageState extends State<UserCalendarPage> {
  late CalendarController _calendarController;
  List<_Meeting> _meetings = [];

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    // Optionally trigger event fetching if not already done:
    // context.read<EventCubit>().getEvents();
  }

  /// Convert the list of AdminEvent objects into _Meeting objects required by the calendar.
  List<_Meeting> _convertEventsToMeetings(List<AdminEvent> events) {
    return events.map((event) {
      return _Meeting(
        event.title, // Use the admin event title as the meeting subject
        event.admin, // Use the admin field as organizer info
        "", // contactID, if applicable
        0, // capacity (if available, otherwise 0)
        event.schedule.start,
        event.schedule.end,
        Colors
            .blue, // Choose a color (you can use event.category to decide color)
        false, // isAllDay: adjust if needed
        null, // startTimeZone
        null, // endTimeZone
        null, // recurrenceRule (set if the event is recurring)
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Calendar"),
      ),
      body: BlocBuilder<EventCubit, EventState>(
        builder: (context, state) {
          if (state is EventLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is EventLoaded) {
            _meetings = _convertEventsToMeetings(state.events);
            final _MeetingDataSource dataSource = _MeetingDataSource(_meetings);
            return SfCalendar(
              view: CalendarView.month,
              controller: _calendarController,
              showDatePickerButton: true,
              dataSource: dataSource,
              monthViewSettings: MonthViewSettings(
                showAgenda: true,
              ),
            );
          } else if (state is EventError) {
            return Center(child: Text("Error: ${state.message}"));
          } else {
            return Center(child: Text("No events available."));
          }
        },
      ),
    );
  }
}

/// Data source class for the Syncfusion Calendar widget.
class _MeetingDataSource extends CalendarDataSource {
  _MeetingDataSource(List<_Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return (appointments![index] as _Meeting).from;
  }

  @override
  DateTime getEndTime(int index) {
    return (appointments![index] as _Meeting).to;
  }

  @override
  bool isAllDay(int index) {
    return (appointments![index] as _Meeting).isAllDay;
  }

  @override
  String getSubject(int index) {
    return (appointments![index] as _Meeting).eventName;
  }

  @override
  Color getColor(int index) {
    return (appointments![index] as _Meeting).background;
  }

  @override
  String? getRecurrenceRule(int index) {
    return (appointments![index] as _Meeting).recurrenceRule;
  }
}

/// Custom meeting object which holds the event details to be rendered on the calendar.
class _Meeting {
  _Meeting(
    this.eventName,
    this.organizer,
    this.contactID,
    this.capacity,
    this.from,
    this.to,
    this.background,
    this.isAllDay,
    this.startTimeZone,
    this.endTimeZone,
    this.recurrenceRule,
  );

  String eventName;
  String? organizer;
  String? contactID;
  int? capacity;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  String? startTimeZone;
  String? endTimeZone;
  String? recurrenceRule;
}
