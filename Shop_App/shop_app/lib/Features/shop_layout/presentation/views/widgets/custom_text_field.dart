import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.keyboardType,
      this.hintText,
      this.prefixIcon});
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field must not be empty';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
