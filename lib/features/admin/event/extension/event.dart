import 'package:eventra/features/admin/event/model/event.dart';
import 'package:intl/intl.dart';

extension EventExtension on Event {
  String encodeDate() {
    try {
      DateTime dateTime = DateTime.parse(schedule.date.toString());
      final DateFormat formatter = DateFormat('d MMMM, y');
      return formatter.format(dateTime);
    } catch (e) {
      return "Invalid date format";
    }
  }

  String encodeTime(DateTime value) {
    try {
      DateTime dateTime = DateTime.parse(value.toString());
      final DateFormat formatter = DateFormat('h:mm a');
      String formattedTime = formatter.format(dateTime);
      return formattedTime;
    } catch (e) {
      return "Invalid date format";
    }
  }

  String encodeLongTime() {
    DateTime dateTime = DateTime.parse(schedule.start.toString());

    final DateFormat formatter = DateFormat('EEEE h:mm a');

    String formattedDateTime = formatter.format(dateTime);

    return "$formattedDateTime - ${encodeTime(schedule.end)}";
  }
}
