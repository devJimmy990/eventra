import 'package:eventra/core/validator/input.dart';
import 'package:eventra/core/helper/localization.dart';

class ContactUsValidator extends InputValidator {
  ContactUsValidator(super.context);

  String? validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) {
      return Localization.validatorEmpty;
    } else if (value.trim().length < 10) {
      return Localization.validatorShortMessage;
    }
    return null;
  }
}
