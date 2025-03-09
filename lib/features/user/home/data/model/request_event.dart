enum EventStatus {
  pending,
  paid, //price > 0
  approved, //price = 0
}

class RequestEvent {
  final int price;
  final String? id;
  final EventStatus event;
  final String userId, eventId;
  RequestEvent({
    this.id,
    required this.price,
    required this.userId,
    required this.eventId,
    this.event = EventStatus.pending,
  });

  factory RequestEvent.fromJson(Map<String, dynamic> json) {
    return RequestEvent(
      id: json['id'],
      userId: json['userId'],
      eventId: json['eventId'],
      price: json['price'] as int,
      event: EventStatus.values.firstWhere((e) => e.index == json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'userId': userId,
      'eventId': eventId,
      'status': event.index,
    };
  }

  @override
  String toString() {
    return 'RequestEvent{id: $id, userId: $userId, eventId: $eventId}';
  }
}
