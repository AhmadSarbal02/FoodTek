import 'package:flutter/material.dart';
import 'package:foodtek/view/screen/auth/OTP/reset_password_screen.dart';
import '../../../../constant/colors.dart';
import '../../../../responseve.dart';
import '../../../widgets/auth/custom_foodtek_logo_widget.dart';
import '../../../widgets/auth/OTP/custom_otp_text_field.dart';
import '../../../widgets/auth/foodtek_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> controllers = List.generate(
    //generates a list TextEditingController
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(
    4,
    (_) => FocusNode(),
  ); //generates a list FocusNode

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String getOtp() {
    return controllers
        .map((controller) => controller.text)
        .join(); // to join the four otp numbers
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(.85),
      body: Stack(
        children: [
          /// Full-Screen Background Image
          Positioned.fill(
            child: SizedBox.expand(
              child: Image.asset(
                "assets/images/pattern.png",
                fit: BoxFit.cover, // Ensures full coverage
                color: const Color.fromARGB(255, 26, 92, 45),
                // Adjust opacity for transparency
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          ),

          /// Main Content
          SizedBox(
            height:
                MediaQuery.of(
                  context,
                ).size.height, // Ensures full screen height
            child: SingleChildScrollView(
              // to Ensure a Scrollable view
              child: Column(
                children: [
                  CustomFoodtekLogoWidget(), // custom logo
                  Center(
                    // Password Reset Card
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
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10,),
                                  Image.asset(
                                    // the image
                                    "assets/images/auth/reset_password.png",
                                    height: responsiveHeight(context, 153),
                                    width: responsiveWidth(context, 153),
                                  ),
                                  const SizedBox(height: 10,),
                                  Text(
                                    "A 4-digit code has been sent to your email. Please enter it to verify.",
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(4, (index) {
                                // generates a list of custom text fields
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: CustomOtpTextField(
                                    controller: controllers[index],
                                    focusNode: focusNodes[index],
                                    nextFocusNode: // to jump to the next field
                                        index < 3
                                            ? focusNodes[index + 1]
                                            : null,
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 40),

                            /// Submit Button
                            FoodtekButton(
                              text: "Verify",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResetPasswordScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
