import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/admin/event/model/base_event.dart';

class BookedEvent extends BaseEvent {
  final User admin;
  BookedEvent({
    super.id,
    super.cover,
    super.location,
    super.price = 0,
    required super.desc,
    required this.admin,
    required super.title,
    required super.schedule,
    required super.category,
  });
  factory BookedEvent.fromJson(Map<String, dynamic> json) {
    return BookedEvent(
      id: json['id'],
      desc: json['desc'],
      title: json['title'],
      cover: json['cover'],
      price: json['price'],
      category: json['category'],
      admin: User.fromJson(json['admin']),
      schedule: EventSchedule.fromJson(json['schedule']),
      location: EventLocation.fromJson(json['location']),
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
    };
  }

  @override
  String toString() {
    return 'Event{title: $title, desc: $desc, price: $price, category: $category, location: $location, schedule: $schedule}';
  }
}
