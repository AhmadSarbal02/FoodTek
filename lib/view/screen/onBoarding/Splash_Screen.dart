import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'onBoarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkIfFirstLaunch();
  }

  Future<void> _checkIfFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    final showHome = prefs.getBool('showHome') ?? false;

    if (!showHome) {
      await prefs.setBool('showHome', true); // Save that onboarding was seen
    }

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => showHome ? HomePage() : OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background color
          Container(color: const Color.fromRGBO(37, 174, 75, 1)),
          Positioned.fill(
            child: Image.asset(
              "assets/picture.jpg",
              fit: BoxFit.cover,
              // Ensures the image covers the entire screen
              color: Colors.white.withOpacity(0.2),
              // Adjust opacity for transparency
              colorBlendMode:
                  BlendMode.modulate, // Blends color with background
            ),
          ),
          Center(
            child: Text(
              "FoodTek",
              style: TextStyle(
                color: Colors.white,
                fontSize: 55,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
