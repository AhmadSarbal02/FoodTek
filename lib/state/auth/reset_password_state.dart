abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordError extends ResetPasswordState {
  final String? passwordError;
  final String? confirmPasswordError;

  ResetPasswordError({this.passwordError, this.confirmPasswordError});
}

class ResetPasswordSuccess extends ResetPasswordState {}