import 'package:eventra/features/admin/event/model/event.dart';
import 'package:intl/intl.dart';

extension EventExtension on Event {
  String castDate() {
    try {
      DateTime dateTime = DateTime.parse(schedule.date.toString());
      final DateFormat formatter = DateFormat('d MMMM, y');
      return formatter.format(dateTime);
    } catch (e) {
      return "Invalid date format";
    }
  }
}
