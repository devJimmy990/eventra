import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TextInputField extends StatelessWidget {
  final Icon? icon;
  final String label;
  final int? maxLines;
  final String? hint;
  final bool? email, phone, enabled;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const TextInputField({
    super.key,
    this.icon,
    this.hint,
    this.email,
    this.phone,
    this.maxLines,
    this.validator,
    this.onChanged,
    this.enabled = true,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      maxLines: maxLines,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      textAlignVertical: maxLines == null || maxLines == 1
          ? TextAlignVertical.center
          : TextAlignVertical.top,
      keyboardType: email == true
          ? TextInputType.emailAddress
          : phone == true
              ? TextInputType.phone
              : TextInputType.multiline,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: icon,
        labelText: label,
        hintText: hint,
        alignLabelWithHint: maxLines != null && maxLines! > 1,
      ),
    );
  }
}

class PasswordInputField extends StatefulWidget {
  final Icon? icon;
  final String label;
  final String? hint;

  final TextEditingController controller;
  final String? Function(String?)? validator;
  const PasswordInputField({
    super.key,
    this.icon,
    this.hint,
    this.validator,
    required this.label,
    required this.controller,
  });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: widget.validator,
      controller: widget.controller,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hint,
        labelText: widget.label,
        prefixIcon: Icon(Iconsax.password_check),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Iconsax.eye : Iconsax.eye_slash),
          onPressed: () => setState(() => obscureText = !obscureText),
        ),
      ),
    );
  }
}
