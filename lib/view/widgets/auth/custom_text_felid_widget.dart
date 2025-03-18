import 'package:flutter/material.dart';

class CustomTextFelidWidget extends StatelessWidget {
  TextEditingController? controller;
  String label, hintText;
  Widget? suffixIcon;
  CustomTextFelidWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey[700], fontSize: 14)),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,

          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon ?? SizedBox(),

            filled: true,
            fillColor: Colors.grey[100],
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFF38B443), width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
