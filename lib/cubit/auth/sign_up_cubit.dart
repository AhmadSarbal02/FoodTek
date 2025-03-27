import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/state/auth/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  bool isEmailText = true;
  bool isPassword = true;
  bool obscureText = true;
  bool isEmpty = false;
  bool isLong = false;
  SignUpCubit() : super(SignUpInitial());

  checkEmpty({required String val}) {
    if (val.isEmpty) {
      emit(SignUpError("Please fill in all fields."));
    } else {
      emit(SignUpSuccess());
    }

    // return isEmpty;
  }

  checkLength({required String val}) {
    if (val.length > 40) {
      emit(SignUpError("Longer than 40 characters"));
    } else {
      emit(SignUpSuccess());
    }

    // return isLong;
  }

  bool isEmail({required String email}) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);

    if (!regExp.hasMatch(email)) {
      emit(SignUpError("Invalid email"));
      return false;
    } else {
      emit(SignUpSuccess());
      return true;
    }
  }

  bool isStrongPassword({required String password}) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(password)) {
      emit(
        SignUpError(
          "Enter a strong password, longer than 8 characters with special characters and numbers.",
        ),
      );
      return false;
    } else {
      emit(SignUpSuccess());
      return true;
    }
  }

  // //Make Sure Same Password (confirm Password)
  // bool isSamePassword(String pass1, String pass2) {
  //   return pass1 == pass2;
  // }

  // checkPassword({required String password}) {
  //   isPassword = password.isNotEmpty;
  //   notifyListeners();
  // }

  changeOpscureTextPassword() {
    obscureText = !obscureText;
    emit(SignUpInitial());
  }
}
