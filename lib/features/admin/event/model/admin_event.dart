import 'package:eventra/features/admin/event/model/base_event.dart';

class AdminEvent extends BaseEvent {
  final List<String> attendees;
  final String adminID;
  AdminEvent({
    super.id,
    super.cover,
    super.location,
    super.price = 0,
    required super.desc,
    required super.title,
    required this.adminID,
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
      adminID: json['adminID'],
      category: _categoryFromString(json['category']),
      schedule: EventSchedule.fromJson(json['schedule']),
      location: EventLocation.fromJson(json['location']),
      attendees: json['attendees'] != null
          ? (json['attendees'] as List<dynamic>).map((e) => e as String).toList()
          : [],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'desc': desc,
      'title': title,
      'cover': cover,
      'price': price,
      'adminID': adminID,
      "location": location.toJson(),
      'schedule': schedule.toJson(),
      'category': category.toString(),
      'attendees': attendees.map((txt) => txt).toList(),
    };

  }
  static EventCategory _categoryFromString(String categoryString) {
    switch (categoryString) {
      case 'EventCategory.software':
        return EventCategory.software;
      case 'EventCategory.hardware':
        return EventCategory.hardware;
            default:
        throw Exception("Unknown category: $categoryString");
    }}

  @override
  String toString() {
    return 'Event{title: $title, desc: $desc, price: $price, category: $category, location: $location, schedule: $schedule}';
  }
}
