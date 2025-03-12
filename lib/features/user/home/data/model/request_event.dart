enum EventStatus {
  waiting,
  pending,
  rejected,
  approved,
}

class RequestEvent {
  final String? id;
  final EventStatus event;
  final String userId, eventId;
  RequestEvent({
    this.id,
    required this.userId,
    required this.eventId,
    this.event = EventStatus.waiting,
  });

  factory RequestEvent.fromJson(Map<String, dynamic> json) {
    return RequestEvent(
      id: json['id'],
      userId: json['userId'],
      eventId: json['eventId'],
      event: EventStatus.values[json['status']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
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
