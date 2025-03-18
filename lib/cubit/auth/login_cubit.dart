import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/state/auth/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // تسجيل الدخول بالبريد الإلكتروني وكلمة المرور
  Future<void> login(String email, String password, bool rememberMe) async {
    // التحقق من أن الحقول غير فارغة
    if (email.isEmpty || password.isEmpty) {
      emit(LoginError('Please fill in all fields'));
      return;
    }

    // التحقق من صحة تنسيق البريد الإلكتروني
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      emit(LoginError('Please enter a valid email address'));
      return;
    }

    try {
      emit(LoginLoading());
      // حفظ خيار "تذكرني" إذا تم تحديده
      if (rememberMe) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('rememberMe', true);
        await prefs.setString('userEmail', email);
      }

      emit(LoginSuccess());
    } catch (e) {
      String errorMessage;

      switch (e) {
        case 'user-not-found':
          errorMessage = 'No user found with this email address';
          break;
        case 'wrong-password':
          errorMessage = 'Invalid password, please try again';
          break;
        case 'invalid-email':
          errorMessage = 'Please enter a valid email address';
          break;
        case 'user-disabled':
          errorMessage = 'This account has been disabled';
          break;
        case 'too-many-requests':
          errorMessage =
              'Too many failed login attempts. Please try again later';
          break;
        default:
          errorMessage = 'An error occurred during login. Please try again';
      }

      emit(LoginError(errorMessage));
    }
  }

  // التحقق من وجود مستخدم مسجل مسبقاً
  Future<void> checkExistingUser() async {
    try {
      // التحقق من وجود بيانات "تذكرني"
      final prefs = await SharedPreferences.getInstance();
      final rememberMe = prefs.getBool('rememberMe') ?? false;

      if (rememberMe) {
        final userEmail = prefs.getString('userEmail');
        if (userEmail != null && userEmail.isNotEmpty) {
          // يجب أن يقوم المستخدم بإدخال كلمة المرور مجدداً
          // يمكننا فقط ملء حقل البريد الإلكتروني تلقائياً
        }
      }

      emit(LoginInitial());
    } catch (e) {
      emit(LoginInitial());
    }
  }
}
