import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextStyle? hintStyle;
  final String? Function(String? value)? validator;
  const TextFormFieldWidget(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.obscureText,
      this.controller,
      this.hintStyle,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0XFF342F3F),
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          hintStyle: hintStyle,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        ),
        keyboardType: textInputType,
        style: const TextStyle(
          color: Colors.white, // Text color inside the input field
        ),
      ),
    );
  }
}
