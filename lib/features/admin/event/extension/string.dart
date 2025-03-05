import 'package:intl/intl.dart';

extension StringDateExtension on String {
  String encodeDate() {
    try {
      DateTime dateTime = DateTime.parse(this);
      final DateFormat formatter = DateFormat('d MMMM, y');
      return formatter.format(dateTime);
    } catch (e) {
      return "Invalid date format";
    }
  }

  String encodeTime() {
    try {
      DateTime dateTime = DateTime.parse(this);
      final DateFormat formatter = DateFormat('h:mm a');
      String formattedTime = formatter.format(dateTime);
      return formattedTime;
    } catch (e) {
      return "Invalid date format";
    }
  }

  String encodeLongTime(String end) {
    DateTime dateTime = DateTime.parse(this);

    final DateFormat formatter = DateFormat('EEEE h:mm a');

    String formattedDateTime = formatter.format(dateTime);

    return "$formattedDateTime - ${end.encodeTime()}";
  }
}
