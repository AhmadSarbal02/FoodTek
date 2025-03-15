import 'package:flutter/material.dart';
import '../../../responseve.dart';

class OnboardingWidget extends StatelessWidget {
  final String title, description, image, firstButton, secondButton;
  final VoidCallback onPressedOne, onPressedTwo;
  final bool isVisible;

  const OnboardingWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.firstButton,
    required this.secondButton,
    required this.onPressedOne,
    required this.onPressedTwo,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // Ensures text is centered
        children: [
          Image.asset(
            image,
            height: responsiveHeight(context, 328),
            width: responsiveWidth(context, 328),
          ),
          const SizedBox(height: 30),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 300,
            child: Text(
              description,
              textAlign: TextAlign.center,
              softWrap: true,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF25AE4B), Color(0xFF0F481F)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ElevatedButton(
              onPressed: onPressedOne,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                // Keep button transparent
                shadowColor: Colors.transparent,
                // Remove shadow
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                // Adjust size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                firstButton,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Visibility(
            visible: isVisible,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,

                shadowColor: Colors.transparent,

                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 14),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: onPressedTwo,
              child: Text(
                secondButton,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
