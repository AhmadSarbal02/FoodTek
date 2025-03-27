import 'package:flutter/material.dart';
import 'package:foodtek/view/screen/Splash_Screen.dart';
import 'package:foodtek/view/screen/onBoarding_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SplashScreen()),
            );
          },
          child: Text("Go to the OnBoarding Screen"),
        ),
      ),
    );
  }
}
