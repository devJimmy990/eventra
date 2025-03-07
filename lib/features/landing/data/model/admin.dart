import 'package:eventra/features/landing/data/model/person.dart';

class Admin extends Person {
  Admin({
    super.id,
    super.phone,
    super.avatar,
    required super.name,
    super.role = "admin",
    required super.email,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      avatar: json['avatar'] ?? "",
      role: json['role'] ?? "admin",
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

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, avatar: $avatar, role: $role)';
  }
}
