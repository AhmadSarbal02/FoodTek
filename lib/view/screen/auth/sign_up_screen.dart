import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/auth/sign_up_cubit.dart';
import 'package:foodtek/state/auth/sign_up_state.dart';
import 'package:foodtek/view/screen/auth/OTP/otp_screen.dart';
import 'package:foodtek/view/screen/auth/login.dart';
import 'package:foodtek/view/widgets/auth/OTP/custom_auth_card.dart';
import 'package:foodtek/view/widgets/auth/OTP/reusable_scaffold.dart';
import 'package:foodtek/view/widgets/auth/custom_foodtek_logo_widget.dart';
import 'package:foodtek/view/widgets/auth/custom_text_felid_widget.dart';
import 'package:foodtek/view/widgets/auth/foodtek_button.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();
  final TextEditingController? nameController = TextEditingController();
  final TextEditingController? dateController = TextEditingController();
  final TextEditingController? phoneController = TextEditingController();
  String texterror = "";
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableScaffold(
      child: SingleChildScrollView(
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpError) {
              texterror = state.message;
            } else if (state is SignUpSuccess) {
              texterror = "";
            }
          },
          builder:
              (context, state) => BlocBuilder<SignUpCubit, SignUpState>(
                builder:
                    (context, state) => Column(
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
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          descriptionAlign: TextAlign.start,
                          children: [
                            Form(
                              key: formkey,
                              child: Column(
                                children: [
                                  CustomTextFelidWidget(
                                    controller: nameController,
                                    label: "Full Name",
                                    hintText: "Your Name",
                                    type: TextInputType.text,
                                    obscure: false,
                                    validator: (value) {
                                      context.read<SignUpCubit>().checkEmpty(
                                        val: value ?? "",
                                      );
                                      context.read<SignUpCubit>().checkLength(
                                        val: value ?? "",
                                      );
                                      return null;
                                    },
                                    errorText: texterror,
                                  ),

                                  CustomTextFelidWidget(
                                    controller: emailController,
                                    label: "Email",
                                    hintText: "example@email.com",
                                    type: TextInputType.emailAddress,
                                    obscure: false,
                                    validator: (value) {
                                      context.read<SignUpCubit>().checkEmpty(
                                        val: value ?? "",
                                      );
                                      context.read<SignUpCubit>().isEmail(
                                        email: value ?? "",
                                      );
                                      return null;
                                    },
                                    errorText: texterror,
                                  ),

                                  CustomTextFelidWidget(
                                    controller: dateController,
                                    label: "Birth of date",
                                    hintText: "DD/MM/YYYY",
                                    type: TextInputType.datetime,
                                    obscure: false,
                                    validator: (value) {
                                      context.read<SignUpCubit>().checkEmpty(
                                        val: value ?? "",
                                      );
                                      return null;
                                    },
                                    errorText: texterror,
                                  ),

                                  CustomTextFelidWidget(
                                    controller: phoneController,
                                    label: "Phone",
                                    hintText: "0770000000",
                                    type: TextInputType.number,
                                    obscure: false,
                                    validator: (value) {
                                      context.read<SignUpCubit>().checkEmpty(
                                        val: value ?? "",
                                      );
                                      context.read<SignUpCubit>().checkLength(
                                        val: value ?? "",
                                      );
                                      return null;
                                    },
                                    errorText: texterror,
                                  ),

                                  CustomTextFelidWidget(
                                    controller: passwordController,
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
                                    validator: (value) {
                                      context.read<SignUpCubit>().checkEmpty(
                                        val: value ?? "",
                                      );
                                      context
                                          .read<SignUpCubit>()
                                          .isStrongPassword(
                                            password: value ?? "",
                                          );
                                      return null;
                                    },
                                    errorText: texterror,
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 24),
                            FoodtekButton(
                              text: "Register",
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => OtpScreen(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          LoginScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                    ),
                                  );
                                }
                                // if (state is SignUpError) {
                                //   texterror = state.message;
                                // } else if (state is SignUpSuccess) {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder:
                                //           (context) => OtpScreen(
                                //             onPressed: () {
                                //               Navigator.pushReplacement(
                                //                 context,
                                //                 MaterialPageRoute(
                                //                   builder:
                                //                       (context) =>
                                //                           LoginScreen(),
                                //                 ),
                                //               );
                                //             },
                                //           ),
                                //     ),
                                //   );
                                // }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
              ),
        ),
      ),
    );
  }
}
