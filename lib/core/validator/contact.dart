import 'package:eventra/core/validator/input.dart';

class ContactUsValidator extends InputValidator {
  ContactUsValidator(super.context);

  String? validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) {
      return super.strings.validatorEmpty;
    } else if (value.trim().length < 10) {
      return super.strings.validatorShortMessage;
    }
    return null;
  }
}
