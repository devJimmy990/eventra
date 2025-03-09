import 'package:eventra/features/admin/event/model/base_event.dart';
import 'package:eventra/features/landing/data/model/user.dart';

class AdminEvent extends BaseEvent {
  List<User> attendees;
  User admin;
  AdminEvent({
    super.id,
    super.cover,
    super.location,
    super.price = 0,
    required super.desc,
    required super.title,
    required this.admin,
    required super.schedule,
    required super.category,
    this.attendees = const [],
  });

  factory AdminEvent.fromJson(Map<String, dynamic> json) {
    return AdminEvent(
      id: json['id'],
      desc: json['desc'],
      title: json['title'],
      cover: json['cover'],
      price: json['price'],
      admin: User.fromJson(json['admin']),
      schedule: EventSchedule.fromJson(json['schedule']),
      location: json['location'] != null
          ? EventLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      attendees: [],
      category: EventCategory.values.firstWhere(
        (e) => e.toString().split('.').last == json['category'],
        orElse: () => EventCategory.software,
      ),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'desc': desc,
      'title': title,
      'cover': cover,
      'price': price,
      'admin': admin.toJson(),
      "location": location.toJson(),
      'schedule': schedule.toJson(),
      'category': category.toString(),
      'attendees': attendees.map((txt) => txt).toList(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AdminEvent) return false;

    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Event{id:$id, title: $title, desc: $desc, price: $price, category: $category, location: $location, schedule: $schedule}';
  }
}
