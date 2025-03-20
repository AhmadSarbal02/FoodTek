import 'package:flutter/material.dart';
import 'package:foodtek/view/screen/auth/login.dart';
import '../../../../responseve.dart';
import '../../../widgets/auth/OTP/custom_auth_card.dart';
import '../../../widgets/auth/custom_foodtek_logo_widget.dart';
import '../../../widgets/auth/custom_text_felid_widget.dart';
import '../../../widgets/auth/OTP/reusable_scaffold.dart';
import '../../../widgets/auth/foodtek_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return ReusableScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomFoodtekLogoWidget(),
            const SizedBox(height: 15),
            CustomAuthCard(
              title: "Reset Password",
              titleAlign: TextAlign.start,
              description: "Want to try with my current password?",
              descriptionAlign: TextAlign.start,
              backTo: '',
              login: '',
              page: '',
              children: [
                CustomTextFelidWidget(
                  controller: passwordController,
                  label: "New Password",
                  hintText: '********',
                  type: TextInputType.visiblePassword,
                  obscure: false,
                ),
                SizedBox(height: 10),
                CustomTextFelidWidget(
                  type: TextInputType.visiblePassword,
                  controller: confirmPasswordController,
                  label: "Confirm New Password",
                  hintText: '********',
                  obscure: false,
                ),
                const SizedBox(height: 24),
                FoodtekButton(
                  text: "Update Password",
                  onPressed: () {
                    String password = passwordController.text.trim();
                    String confirmPassword =
                        confirmPasswordController.text.trim();

                    if (password.isEmpty || confirmPassword.isEmpty) {
                      // Show an error dialog for empty fields
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.black.withOpacity(.8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                  size: 50,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Error",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Both fields must be filled!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      return;
                    }

                    if (password == confirmPassword) {
                      // Show Success Dialog
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "assets/images/auth/reset_password_success.png",
                                  height: responsiveHeight(context, 287),
                                  width: responsiveWidth(context, 430.5),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Congratulations!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Password reset successfully",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );

                      // Delay navigation to login screen after 2 seconds
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.pop(context); // Close the dialog
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      });
                    } else {
                      // Passwords do not match Dialog
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.black.withOpacity(.8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                  size: 50,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Error",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Passwords do not match!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),

                // FoodtekButton(
                //   text: "Update Password",
                //   onPressed: () {
                //     if (confirmPasswordController.text ==
                //         passwordController.text) {
                //       // Passwords match, proceed with update
                //       print("Passwords match!");
                //       showDialog(
                //         // success alert
                //         context: context,
                //         builder: (context) {
                //           return AlertDialog(
                //             backgroundColor: Colors.transparent.withOpacity(.1),
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(15),
                //             ),
                //             content: Column(
                //               mainAxisSize: MainAxisSize.min,
                //               children: [
                //                 Image.asset(
                //                   "assets/images/auth/reset_password_success.png",
                //                   height: responsiveHeight(context, 287),
                //                   width: responsiveWidth(context, 430.5),
                //                 ),
                //                 Text(
                //                   "Congratulations!",
                //                   textAlign: TextAlign.center,
                //                   style: TextStyle(
                //                     fontSize: 24,
                //                     color: Colors.white,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 const SizedBox(height: 20),
                //                 Text(
                //                   "Password reset successfully",
                //                   textAlign: TextAlign.center,
                //                   style: TextStyle(
                //                     color: Colors.white,
                //                     fontSize: 16,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           );
                //         },
                //       );
                //     } else {
                //       // Show error message
                //       print("Passwords do not match!");
                //       showDialog(
                //         context: context,
                //         builder: (context) {
                //           return AlertDialog(
                //             backgroundColor: Colors.transparent.withOpacity(.1),
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(15),
                //             ),
                //             //title: Text("Congratulations!", textAlign: TextAlign.center),
                //             content: Column(
                //               mainAxisSize: MainAxisSize.min,
                //               children: [
                //                 Text(
                //                   "Passwords do not match!",
                //                   textAlign: TextAlign.center,
                //                   style: TextStyle(
                //                     color: Colors.white,
                //                     fontSize: 16,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           );
                //         },
                //       );
                //     }
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
