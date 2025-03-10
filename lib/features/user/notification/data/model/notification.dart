enum NotificationType { info, warning, error }

class Notification {
  String? id;
  final NotificationType type;
  final String image, title, desc;
  final DateTime time;

  Notification({
    this.id,
    required this.desc,
    required this.type,
    required this.time,
    required this.image,
    required this.title,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'],
      desc: json['desc'],
      type: json['type'],
      image: json['image'],
      title: json['title'],
      time: DateTime.parse(json['time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'desc': desc,
      'image': image,
      'title': title,
      'type': type.index,
      'time': time.toIso8601String(),
    };
  }

  @override
  String toString() =>
      'Notification(id: $id, image: $image, title: $title, desc: $desc, type: $type)';
}
