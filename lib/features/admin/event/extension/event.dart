import 'package:eventra/features/admin/event/extension/date_time.dart';
import 'package:eventra/features/admin/event/model/base_event.dart';
import 'package:intl/intl.dart';

extension AdminEventExtension on BaseEvent {
  String encodeLongDateTime() {
    final DateFormat formatter = DateFormat('EEEE h:mm a');
    String formattedDateTime = formatter.format(schedule.start);
    return "$formattedDateTime - ${schedule.end.encodeTime()}";
  }

  String encodeLongTime() {
    final DateFormat formatter = DateFormat('h:mm a');
    String formattedDateTime = formatter.format(schedule.start);
    return "$formattedDateTime - ${schedule.end.encodeTime()}";
  }
}
