import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../state/auth/reset_password_state.dart';



class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void resetPassword() {
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (password.isEmpty || confirmPassword.isEmpty) {
      emit(ResetPasswordError(
        passwordError: password.isEmpty ? "Password cannot be empty" : null,
        confirmPasswordError: confirmPassword.isEmpty ? "Confirm Password cannot be empty" : null,
      ));
      return;
    }

    if (password != confirmPassword) {
      emit(ResetPasswordError(confirmPasswordError: "Passwords do not match!"));
      return;
    }

    // Emit success state
    emit(ResetPasswordSuccess());
  }
}