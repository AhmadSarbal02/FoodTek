import 'package:flutter/material.dart';
import 'package:foodtek/view/screen/auth/OTP/otp_screen.dart';
import 'package:foodtek/view/screen/auth/login.dart';
import 'package:foodtek/view/widgets/auth/OTP/custom_auth_card.dart';
import 'package:foodtek/view/widgets/auth/OTP/reusable_scaffold.dart';
import 'package:foodtek/view/widgets/auth/custom_foodtek_logo_widget.dart';
import 'package:foodtek/view/widgets/auth/custom_text_felid_widget.dart';
import 'package:foodtek/view/widgets/auth/foodtek_button.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController? _emailController = TextEditingController();
  TextEditingController? _passwordController = TextEditingController();
  TextEditingController? _nameController = TextEditingController();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomFoodtekLogoWidget(),
            CustomAuthCard(
              arrowIcon: true,
              title: "sign up",
              backTo: "",
              login: "",
              page: "",
              titleAlign: TextAlign.start,
              description: "Already have an account ? ",
              descriptionword: "Login",
              descriptionWordOnTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              descriptionAlign: TextAlign.start,
              children: [
                CustomTextFelidWidget(
                  controller: _nameController,
                  label: "Full Name",
                  hintText: "Your Name",
                  type: TextInputType.text,
                  obscure: false,
                ),

                CustomTextFelidWidget(
                  controller: _emailController,
                  label: "Email",
                  hintText: "example@email.com",
                  type: TextInputType.emailAddress,
                  obscure: false,
                ),

                CustomTextFelidWidget(
                  controller: _nameController,
                  label: "Birth of date",
                  hintText: "DD/MM/YYYY",
                  type: TextInputType.datetime,
                  obscure: false,
                ),

                CustomTextFelidWidget(
                  controller: _nameController,
                  label: "Phone",
                  hintText: "0770000000",
                  type: TextInputType.number,
                  obscure: false,
                ),
                CustomTextFelidWidget(
                  controller: _passwordController,
                  label: "Set Password",
                  hintText: '*******',
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.visibility_off_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  type: TextInputType.text,
                  obscure: true,
                ),
                const SizedBox(height: 24),
                FoodtekButton(
                  text: "Register",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => OtpScreen(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                            ),
                      ),
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
