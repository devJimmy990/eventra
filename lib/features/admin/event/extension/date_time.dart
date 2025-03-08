import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String encodeDate() {
    final DateFormat formatter = DateFormat('d MMMM, y');
    return formatter.format(this);
  }

  String encodeTime() {
    final DateFormat formatter = DateFormat('h:mm a');
    String formattedTime = formatter.format(this);
    return formattedTime;
  }
}
