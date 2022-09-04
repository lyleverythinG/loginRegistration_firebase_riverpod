import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final void Function(String? onChanged) onChanged;
  final String? Function(String?)? validator;
  final String initialValue;
  final String labelText;
  const CustomTextFormField(
      {Key? key,
      required this.onChanged,
      required this.validator,
      required this.initialValue,
      required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => onChanged,
      validator: validator,
      initialValue: initialValue,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined),
        labelText: labelText,
      ),
    );
  }
}
