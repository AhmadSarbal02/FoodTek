////////  this class is just for testing ///////

import 'package:flutter/material.dart';
import 'package:foodtek/constant/colors.dart';

class CategoryCell extends StatelessWidget {
  final String cObj;
  final String image;
  final VoidCallback onTap;

  const CategoryCell({super.key, required this.cObj, required this.onTap, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: 85,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              cObj,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.onBoardingtextColor,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
