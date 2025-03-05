import 'package:eventra/core/constants/strings_manager.dart';

enum EventCategory { software, hardware }

class Event {
  final int price;
  final String? id;
  final EventSchedule schedule;
  final EventCategory category;
  final EventLocation location;
  final String adminID, title, desc, cover;
  final List<String> attendees;

  Event(
      {this.id,
      this.desc =
          "lorem ipsum dolor sit amet, consectetur adip occum dolor sit amet, consectetur adip occum, dolor sit amet, consectetur adip occum, lorem ipsum dolor sit amet, consectetur adip occum dolor sit amet, consectetur adip occum, dolor sit amet, consectetur adip occum, ",
      this.title = "Stay Safe Online",
      required this.adminID,
      required this.category,
      required this.schedule,
      this.price = 0,
      this.cover = StringsManager.eventImage,
      EventLocation? location,
      List<String>? attendees})
      : attendees = attendees ?? List.generate(50, (index) => "User $index"),
        location = location ??
            EventLocation(
              name: "U.S. Embassy Cairo",
              address: "5 Tawfik Diab Street, Garden City",
              url: "https://maps.app.goo.gl/XFgU1GQnb54WtviN9",
            );
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      desc: json['desc'],
      title: json['title'],
      cover: json['cover'],
      price: json['price'],
      adminID: json['adminID'],
      category: json['category'],
      schedule: EventSchedule.fromJson(json['schedule']),
      location: EventLocation.fromJson(json['location']),
      attendees: json['attendees'].map((txt) => txt).toList(),
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

  @override
  String toString() {
    return 'Event{title: $title, desc: $desc, price: $price, category: $category, location: $location, schedule: $schedule}';
  }
}

class EventSchedule {
  final String start, end, date;

  EventSchedule({required this.start, required this.end, required this.date});
  factory EventSchedule.fromJson(Map<String, dynamic> json) {
    return EventSchedule(
      end: json['end'],
      date: json['date'],
      start: json['start'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'end': end,
      'date': date,
      'start': start,
    };
  }

  @override
  String toString() {
    return '(date: $date, from: $start - to: $end )';
  }
}

class EventLocation {
  final String name, address, url;
  EventLocation({required this.name, required this.address, required this.url});

  factory EventLocation.fromJson(Map<String, dynamic> json) {
    return EventLocation(
      url: json['url'],
      name: json['name'],
      address: json['address'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'name': name,
      'address': address,
    };
  }

  @override
  String toString() {
    return 'name: $name, address: $address';
  }
}
