class Regex {
  static bool matchEmail(String value) =>
      RegExp(r"^[a-zA-Z0-9_-]+@([a-zA-Z]+\.)+[a-zA-Z]{2,}$").hasMatch(value);

  static bool matchPhone(String value) =>
      RegExp(r"^01[0125]\d{8}$").hasMatch(value);
}
