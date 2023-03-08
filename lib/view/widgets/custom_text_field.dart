import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool? obscure;
  final String? Function(String?) validator;
  final TextEditingController? controller;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      this.suffixIcon,
      required this.validator,
      this.obscure,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscure ?? false,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black),
            suffixIcon: suffixIcon,
            border: const OutlineInputBorder()));
  }
}
