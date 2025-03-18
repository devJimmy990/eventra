
class Notification {
  final String title, body;
  Notification({
    required this.body,
    required this.title,
  });

  Map<String, String> toJson() => {
        'title': title,
        'body': body,
      };
}
