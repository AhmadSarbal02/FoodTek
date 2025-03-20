import 'package:flutter/material.dart';
import 'package:foodtek/view/screen/auth/login.dart';

class CustomAuthCard extends StatelessWidget {
  final String title;
  final String? description;
  final String backTo;
  final String login;
  final String page;
  final List<Widget> children;
  final TextAlign titleAlign, descriptionAlign;

  const CustomAuthCard({
    super.key,
    required this.title,
    this.description,
    required this.children,
    required this.backTo,
    required this.login,
    required this.page,
    required this.titleAlign,
    required this.descriptionAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    // back arrow
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(backTo), // the text next to the back arrow
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      login,
                      style: const TextStyle(
                        color: Color(0xFF38B443),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(page),
                ],
              ),

              Text(// the rest password text
                title,
                textAlign: titleAlign,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              if (description != null) ...[// the descreption under it
                const SizedBox(height: 10),
                Text(description!, textAlign: descriptionAlign),
              ],
              const SizedBox(height: 20),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
