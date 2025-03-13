import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    final List<String> parts = split(" ");
    return parts.length == 1
        ? "${parts[0][0].toUpperCase()}${parts[0].substring(1)}"
        : split(" ").map((e) => e[0].toUpperCase() + e.substring(1)).join(" ");
  }

  String abbreviate() {
    final List<String> parts = split(" ");
    if (parts.length > 1) {
      return "${parts[0][0].toUpperCase()}${parts[1][0]}".toUpperCase();
    } else {
      return "${parts[0][0].toUpperCase()}${parts[0][1]}".toUpperCase();
    }
  }
}

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

  String encodeMonth() {
    final DateFormat formatter = DateFormat('MMMM');
    String formattedTime = formatter.format(this);
    return formattedTime;
  }
}
