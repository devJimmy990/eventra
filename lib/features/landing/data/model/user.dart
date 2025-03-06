class User {
  String? id, avatar, phone;
  final String name, email, role;

  User({
    this.id,
    this.phone,
    this.avatar = "",
    required this.name,
    this.role = "user",
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      avatar: json['avatar'] ?? "",
      role: json['role'] ?? "user",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'email': email,
      'phone': phone,
      'avatar': avatar,
    };
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, avatar: $avatar, role: $role)';
  }
}
