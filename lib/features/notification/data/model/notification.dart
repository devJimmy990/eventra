enum NotificationType { info, warning, error }

class Notification {
  String? id;
  late NotificationType type;
  final String image, title, body;
  late DateTime time;
  late Map<String, dynamic> payload;

  Notification({
    this.id,
    required this.body,
    required this.image,
    required this.title,
    required this.payload,
  });
  Notification.action({
    this.id,
    required this.body,
    required this.type,
    required this.time,
    required this.image,
    required this.title,
    required this.payload,
  });
  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification.action(
      id: json['id'],
      body: json['body'],
      type: json['type'],
      image: json['image'],
      title: json['title'],
      payload: json['payload'],
      time: DateTime.parse(json['time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'body': body,
      'image': image,
      'title': title,
      'type': type.index,
      'payload': payload,
      'time': time.toIso8601String(),
    };
  }

  @override
  String toString() =>
      'Notification(id: $id, image: $image, title: $title, body: $body, type: $type)';
}
