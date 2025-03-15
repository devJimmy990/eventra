import 'package:flutter/material.dart';

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
        fillColor: Colors.white,
        alignLabelWithHint: maxLines != null && maxLines! > 1,
        border: _buildInputBorder(),
        enabledBorder: _buildInputBorder(),
        focusedBorder: _buildInputBorder(),
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
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.lock),
        border: _buildInputBorder(),
        enabledBorder: _buildInputBorder(),
        focusedBorder: _buildInputBorder(),
        labelStyle: const TextStyle(color: Colors.black),
        suffixIcon: IconButton(
          icon: Icon(
            color: Colors.black,
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () => setState(() => obscureText = !obscureText),
        ),
      ),
    );
  }
}

InputBorder _buildInputBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.grey),
    );
