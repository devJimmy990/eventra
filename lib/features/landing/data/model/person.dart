abstract class Person {
  String? id, avatar, phone;
  final String name, email, role;

  Person({
    this.id,
    this.phone,
    this.avatar = "",
    required this.name,
    required this.role,
    required this.email,
  });
}
