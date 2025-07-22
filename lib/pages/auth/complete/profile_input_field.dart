import 'package:flutter/material.dart';

class ProfileInputField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isObscured;
  final TextEditingController controller;

  const ProfileInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.isObscured = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF0A0A0A),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextField(
          controller: controller,
          obscureText: isObscured,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color(0xFFF4F4F4),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
          ),
        ),
      ],
    );
  }
}
