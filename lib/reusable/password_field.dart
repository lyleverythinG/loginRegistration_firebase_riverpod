import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final void Function(String? onChanged) onChanged;
  final String? Function(String?)? validator;
  final String initialValue;
  final bool isObscure;
  final String labelText;

  final void Function() onPressed;
  const PasswordField({
    Key? key,
    required this.onChanged,
    this.validator,
    required this.initialValue,
    required this.labelText,
    required this.isObscure,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      initialValue: initialValue,
      keyboardType: TextInputType.visiblePassword,
      obscureText: isObscure,
      decoration: InputDecoration(
        prefixIcon: IconButton(
          icon: Icon(isObscure ? Icons.lock_clock_outlined : Icons.lock_open),
          onPressed: onPressed,
        ),
        labelText: labelText,
      ),
    );
  }
}
