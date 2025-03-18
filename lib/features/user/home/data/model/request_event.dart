import 'package:eventra/features/landing/data/model/user.dart';

enum RequestStatus {
  waiting, // when user create request and admin didn`t take action {accepted, rejected}
  rejected, // when admin rejects request
  pending, // when admin accepts request but the user didn`t attend the event
  approved, // when user is approved to enter event
}

class RequestEvent {
  final String? id;
  final User user;

  final RequestStatus status;
  final String admin, eventId, eventName;
  RequestEvent({
    this.id,
    required this.user,
    required this.admin,
    required this.eventId,
    required this.eventName,
    this.status = RequestStatus.waiting,
  });

  factory RequestEvent.fromJson(Map<String, dynamic> json) {
    return RequestEvent(
      id: json['id'],
      admin: json['admin'],
      eventId: json['eventId'],
      eventName: json['eventName'],
      user: User.fromJson(json['user']),
      status: RequestStatus.values[json['status']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eventId': eventId,
      'eventName': eventName,
      'admin': admin,
      'user': user.toJson(),
      'status': status.index,
    };
  }

  set status(RequestStatus val) => status = val;

  @override
  String toString() {
    return 'RequestEvent{id: $id, userId: $user, eventId: $eventId}';
  }

  RequestEvent copyWith({required RequestStatus status}) {
    return RequestEvent(
      id: id,
      user: user,
      admin: admin,
      eventId: eventId,
      eventName: eventName,
      status: status,
    );
  }
}
