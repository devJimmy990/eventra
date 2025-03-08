enum EventCategory { software, hardware }

abstract class BaseEvent {
  final int price;
  final String? id, cover;
  final String title, desc;
  final EventSchedule schedule;
  final EventCategory category;
  final EventLocation _location;

  BaseEvent({
    this.id,
    this.cover,
    required this.desc,
    required this.title,
    required this.price,
    required this.category,
    required this.schedule,
    EventLocation? location,
  }) : _location = location ??
            EventLocation(
              name: "U.S. Embassy Cairo",
              address: "5 Tawfik Diab Street, Garden City",
              url: "https://maps.app.goo.gl/XFgU1GQnb54WtviN9",
            );

  EventLocation get location => _location;
}

class EventSchedule {
  final DateTime start, end, date;

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
