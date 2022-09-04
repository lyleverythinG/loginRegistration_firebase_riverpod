import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final void Function(String? onChanged) onChanged;
  final String? Function(String?)? validator;
  final String initialValue;
  final String labelText;
  final IconData icon;
  const CustomTextFormField(
      {Key? key,
      required this.onChanged,
      required this.validator,
      required this.initialValue,
      required this.labelText,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      initialValue: initialValue,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: labelText,
      ),
    );
  }
}
