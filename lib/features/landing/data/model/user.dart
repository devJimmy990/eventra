import 'package:eventra/features/landing/data/model/person.dart';
import 'package:eventra/features/admin/event/model/booked_event.dart';

class User extends Person {
  List<BookedEvent>? _events;
  User._({
    super.id,
    super.phone,
    super.avatar,
    required super.name,
    super.role = "user",
    required super.email,
    List<BookedEvent>? events,
  }) : _events = events ?? [];

  factory User.register({
    required String name,
    required String email,
  }) =>
      User._(
        name: name,
        email: email,
        role: "user",
      );

  factory User.event({
    String? phone,
    String? avatar,
    required String id,
    required String name,
    required String email,
  }) =>
      User._(
        id: id,
        name: name,
        email: email,
        phone: phone,
        role: "admin",
        avatar: avatar,
      );

  factory User.fromJson(Map<String, dynamic> json) {
    return User._(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      avatar: json['avatar'] ?? "",
      role: json['role'] ?? "user",
      events: json['events']?.map((event) => event)?.toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'email': email,
      'phone': phone ?? "",
      'avatar': avatar ?? "",
    };
  }

  List<BookedEvent>? get events => _events;

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, avatar: $avatar, role: $role)';
  }
}
