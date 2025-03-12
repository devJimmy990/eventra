enum EventStatus {
  waiting, // when user create request and admin didn`t take action {accepted, rejected}
  rejected, // when admin rejects request
  pending, // when admin accepts request but the user didn`t attend the event
  approved, // when user is approved to enter event
}

class RequestEvent {
  final String? id;
  final EventStatus status;
  final String userId, eventId, adminId;
  RequestEvent({
    this.id,
    required this.userId,
    required this.eventId,
    required this.adminId,
    this.status = EventStatus.waiting,
  });

  factory RequestEvent.fromJson(Map<String, dynamic> json) {
    return RequestEvent(
      id: json['id'],
      userId: json['userId'],
      eventId: json['eventId'],
      adminId: json['adminId'],
      status: EventStatus.values[json['status']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'eventId': eventId,
      'adminId': adminId,
      'status': status.index,
    };
  }

  @override
  String toString() {
    return 'RequestEvent{id: $id, userId: $userId, eventId: $eventId}';
  }
}
