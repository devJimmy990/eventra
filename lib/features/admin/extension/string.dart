extension StringExtension on String {
  String nameAbb() {
    final List<String> parts = split(" ");
    if (parts.length > 1) {
      return "${parts[0][0].toUpperCase()} ${parts[1][0]}".toUpperCase();
    } else {
      return "${parts[0][0].toUpperCase()} ${parts[0][1]}".toUpperCase();
    }
  }
}
