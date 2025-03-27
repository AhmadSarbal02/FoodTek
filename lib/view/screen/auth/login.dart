import 'package:flutter/material.dart';
import 'package:foodtek/view/screen/auth/OTP/forgot_pw_screen.dart';
import 'package:foodtek/view/screen/auth/sign_up_screen.dart';
import 'package:foodtek/view/screen/main_screens/home/home_screen.dart';
import 'package:foodtek/view/screen/main_screens/main_page.dart';
import 'package:foodtek/view/widgets/auth/OTP/custom_auth_card.dart';
import 'package:foodtek/view/widgets/auth/OTP/reusable_scaffold.dart';
import 'package:foodtek/view/widgets/auth/custom_foodtek_logo_widget.dart';
import 'package:foodtek/view/widgets/auth/custom_social_login_button.dart';
import 'package:foodtek/view/widgets/auth/custom_text_felid_widget.dart';
import 'package:foodtek/view/widgets/auth/foodtek_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReusableScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                // شعار التطبيق
                CustomFoodtekLogoWidget(),

                // بطاقة تسجيل الدخول
                CustomAuthCard(
                  arrowIcon: false,
                  title: "Login",
                  backTo: "",
                  login: "",
                  page: "",
                  titleAlign: TextAlign.center,
                  description: "Don't have an account?",
                  descriptionAlign: TextAlign.center,
                  descriptionword: " Sign Up",
                  descriptionWordOnTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  children: [
                    // حقل البريد الإلكتروني
                    CustomTextFelidWidget(
                      controller: _emailController,
                      label: "Email",
                      hintText: 'example@email.com',
                      type: TextInputType.emailAddress,
                      obscure: false,
                    ),

                    // حقل كلمة المرور
                    CustomTextFelidWidget(
                      controller: _passwordController,
                      label: "Password",
                      hintText: '*******',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      type: TextInputType.text,
                      obscure: _obscurePassword,
                    ),

                    // تذكرني ونسيت كلمة المرور
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // تذكرني
                        Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                                activeColor: Color(0xFF38B443),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),

                        // نسيت كلمة المرور
                        GestureDetector(
                          onTap: () {
                            // التنقل إلى صفحة نسيت كلمة المرور
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPwScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password ?',
                            style: TextStyle(
                              color: Color(0xFF38B443),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // زر تسجيل الدخول
                    SizedBox(height: 24),
                    FoodtekButton(
                      text: "Login",
                      onPressed: () {
                        // state is LoginLoading
                        //     ? null
                        //     : () {
                        //       // استدعاء دالة تسجيل الدخول من cubit
                        //       context.read<LoginCubit>().login(
                        //         _emailController.text,
                        //         _passwordController.text,
                        //         _rememberMe,
                        //       );
                        //     };

                        // just to check if the location is saved in the SharedPreferences
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
                      },
                    ),

                    //فاصل
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(color: Colors.grey[300], thickness: 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Or',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: Colors.grey[300], thickness: 1),
                        ),
                      ],
                    ),

                    // أزرار تسجيل الدخول بحسابات أخرى
                    SizedBox(height: 16),
                    CustomSocialLoginButton(
                      text: 'Continue with Google',
                      iconPath: 'assets/images/auth/google.png',
                    ),

                    SizedBox(height: 12),
                    CustomSocialLoginButton(
                      text: 'Continue with Facebook',
                      iconPath: 'assets/images/auth/facebook_icon.png',
                    ),

                    SizedBox(height: 12),
                    CustomSocialLoginButton(
                      text: 'Continue with Apple',
                      iconPath: 'assets/images/auth/apple.png',
                    ),
                  ],
                ),
                SizedBox(height: 32),
              ],
            ),
          ],
        ),
      ),
    );
    //     },
    //   ),
    // );
  }
}
