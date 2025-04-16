import 'package:eventra/features/admin/data/model/booked_event.dart';

class User {
  List<BookedEvent>? _events;
  final String? avatar, phone;
  final String id, name, email, role;

  User._({
    this.avatar,
    required this.id,
    required this.name,
    this.role = "user",
    required this.phone,
    required this.email,
    List<BookedEvent>? events,
  }) : _events = events ?? [];

  factory User.register({
    required String id,
    required String name,
    required String email,
    required String phone,
  }) =>
      User._(
        id: id,
        name: name,
        email: email,
        phone: phone,
        role: "user",
        avatar: null,
      );

  factory User.copyWith(User user, {required Map<String, dynamic> json}) =>
      User._(
        id: user.id,
        role: user.role,
        email: user.email,
        name: json['name'] ?? user.name,
        phone: json['phone'] ?? user.phone,
        avatar: json['avatar'] ?? user.avatar,
      );

  factory User.event({
    String? avatar,
    required String id,
    required String name,
    required String email,
    required String phone,
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
      id: json['id'],
      role: json['role'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'email': email,
      'phone': phone,
      'avatar': avatar,
    };
  }

  List<BookedEvent>? get events => _events;

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, avatar: $avatar, role: $role)';
  }
}
