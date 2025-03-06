import 'package:eventra/core/validator/input.dart';

class ContactUsValidator extends InputValidator {
  ContactUsValidator(super.context);

  String? validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'required';
    } else if (value.trim().length < 10) {
      return 'too short';
    }
    return null;
  }
}
