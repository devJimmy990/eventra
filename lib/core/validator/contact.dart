class ContactUsValidator {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'required';
    } else if (value.trim().length < 3) {
      return 'too short';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'required';
    } else if (!RegExp(
      r"^[a-z0-9]+@[a-z]+\.[a-z]{2,}$",
    ).hasMatch(value.trim().toLowerCase())) {
      return 'invalid email';
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'required';
    } else if (!RegExp(
      r"^01[0125][0-9]{8}$",
    ).hasMatch(value.trim().toLowerCase())) {
      return 'invalid phone number';
    }

    return null;
  }

  static String? validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'required';
    } else if (value.trim().length < 10) {
      return 'too short';
    }
    return null;
  }
}
