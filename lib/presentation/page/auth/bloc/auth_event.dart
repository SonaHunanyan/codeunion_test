abstract class AuthEvent {}

class LoginValidationEvent extends AuthEvent {
  LoginValidationEvent({required this.value});
  final String value;
}

class PasswordValidationEvent extends AuthEvent {
  PasswordValidationEvent({required this.value});
  final String value;
}

class FormValidationEvent extends AuthEvent {
  FormValidationEvent({required this.login, required this.password});
  final String login;
  final String password;
}

class LoginEvent extends AuthEvent {
  LoginEvent({required this.login, required this.password});
  final String login;
  final String password;
}
