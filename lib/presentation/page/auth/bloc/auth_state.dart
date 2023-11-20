abstract class AuthState {}

class AuthInitialState extends AuthState {}

class LoginInvalidState extends AuthState {
  LoginInvalidState({required this.error});
  final String error;
}

class LoginValidState extends AuthState {}

class PasswordInvalidState extends AuthState {
  PasswordInvalidState({required this.error});
  final String error;
}

class PasswordValidState extends AuthState {}

class FormInvalidState extends AuthState {
  FormInvalidState({required this.loginError, required this.passwordError});
  final String? loginError;
  final String? passwordError;
}

class FormValidState extends AuthState {}

class LoginInProgressState extends AuthState {}

class LoginSuccessState extends AuthState {}

class FailToLoginState extends AuthState {
  FailToLoginState({required this.error});
  final String error;
}
