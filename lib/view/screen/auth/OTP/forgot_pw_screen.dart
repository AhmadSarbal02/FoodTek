import 'package:flutter/material.dart';
import 'package:foodtek/view/screen/auth/OTP/otp_screen.dart';
import '../../../widgets/auth/OTP/custom_auth_card.dart';
import '../../../widgets/auth/custom_foodtek_logo_widget.dart';
import '../../../widgets/auth/OTP/reusable_scaffold.dart';
import '../../../widgets/auth/custom_text_felid_widget.dart';
import '../../../widgets/auth/foodtek_button.dart';

class ForgotPwScreen extends StatelessWidget {
  const ForgotPwScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();

    return ReusableScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomFoodtekLogoWidget(),
            const SizedBox(height: 15),
            CustomAuthCard( // a custom container for the forgot and reset screens
              backTo: 'back to ',
              login: 'login',
              page: ' page?',
              title: "Reset Password",
              description:
                  "Enter your email or phone number, and we'll send you a link to reset your password.",
              titleAlign: TextAlign.center,
              descriptionAlign: TextAlign.center,
              children: [
                CustomTextFelidWidget(
                  controller: _emailController,
                  label: "Email",
                  hintText: "example@email.com", type: TextInputType.emailAddress, obscure: false,
                ),
                const SizedBox(height: 24),
                FoodtekButton(
                  text: "Send",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OtpScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
