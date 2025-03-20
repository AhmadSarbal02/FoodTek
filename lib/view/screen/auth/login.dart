import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/constant/colors.dart';
import 'package:foodtek/cubit/auth/login_cubit.dart';
import 'package:foodtek/responseve.dart';
import 'package:foodtek/state/auth/login_state.dart';
import 'package:foodtek/view/screen/auth/OTP/forgot_pw_screen.dart';
import 'package:foodtek/view/screen/auth/sign_up_screen.dart';
import 'package:foodtek/view/screen/home/home_page.dart';
import 'package:foodtek/view/widgets/auth/custom_foodtek_logo_widget.dart';
import 'package:foodtek/view/widgets/auth/custom_social_login_button.dart';
import 'package:foodtek/view/widgets/auth/custom_text_felid_widget.dart';
import 'package:foodtek/view/widgets/auth/foodtek_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (state is LoginError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor, // اللون الأخضر من الصورة
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      // Background color
                      Container(color: AppColors.primaryColor),
                      Positioned.fill(
                        child: Image.asset(
                          "assets/images/pattern.png",
                          fit: BoxFit.cover,
                          // Ensures the image covers the entire screen
                          color: const Color.fromARGB(255, 26, 92, 45),
                          // Adjust opacity for transparency
                          colorBlendMode:
                              BlendMode
                                  .modulate, // Blends color with background
                        ),
                      ),
                      Column(
                        children: [
                          // شعار التطبيق
                          CustomFoodtekLogoWidget(),

                          // بطاقة تسجيل الدخول
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // عنوان تسجيل الدخول
                                  Text(
                                    'Login',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),

                                  // نص "ليس لديك حساب؟"
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't have an account? ",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // التنقل إلى صفحة التسجيل
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => SignUpScreen(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            color: Color(0xFF38B443),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  // حقل البريد الإلكتروني
                                  SizedBox(height: 24),
                                  CustomTextFelidWidget(
                                    controller: _emailController,
                                    label: "Email",
                                    hintText: 'example@email.com',
                                    type: TextInputType.emailAddress, obscure: false,
                                  ),

                                  // حقل كلمة المرور
                                  SizedBox(height: 16),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                                borderRadius:
                                                    BorderRadius.circular(4),
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
                                              builder:
                                                  (context) => ForgotPwScreen(),
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
                                      state is LoginLoading
                                          ? null
                                          : () {
                                            // استدعاء دالة تسجيل الدخول من cubit
                                            context.read<LoginCubit>().login(
                                              _emailController.text,
                                              _passwordController.text,
                                              _rememberMe,
                                            );
                                          };
                                    },
                                  ),

                                  //فاصل
                                  SizedBox(height: 24),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          color: Colors.grey[300],
                                          thickness: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                        ),
                                        child: Text(
                                          'Or',
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          color: Colors.grey[300],
                                          thickness: 1,
                                        ),
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
                                    iconPath:
                                        'assets/images/auth/facebook_icon.png',
                                  ),

                                  SizedBox(height: 12),
                                  CustomSocialLoginButton(
                                    text: 'Continue with Apple',
                                    iconPath: 'assets/images/auth/apple.png',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 32),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
