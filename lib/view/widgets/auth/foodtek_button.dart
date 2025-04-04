import 'package:flutter/material.dart';
import 'package:foodtek/constant/colors.dart';

class FoodtekButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const FoodtekButton({super.key, required this.text, required this.onPressed, });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
