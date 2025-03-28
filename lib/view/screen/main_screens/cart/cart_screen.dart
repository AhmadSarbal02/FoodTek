import 'package:flutter/material.dart';
import 'package:foodtek/view/screen/onBoarding_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnboardingScreen()),
            );
          },
          child: Text("onBoarding"),
        ),
      ),
    );
  }
}
