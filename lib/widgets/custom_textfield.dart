import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? initialValue;
  final bool readOnly;
  final int maxLines;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  CustomTextField({    this.initialValue,
    this.readOnly = false,
    this.maxLines = 1,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: readOnly,
      maxLines: maxLines,
      decoration: InputDecoration(
        fillColor: Colors.grey[400],
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onSaved: onSaved,
      validator: validator,
    );
  }
}
