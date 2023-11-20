import 'package:codeunion_test/presentation/page/auth/bloc/auth_event.dart';
import 'package:codeunion_test/presentation/page/auth/bloc/auth_state.dart';
import 'package:codeunion_test/presentation/util/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<LoginValidationEvent>(_onLoginValidationEvent);
    on<PasswordValidationEvent>(_onPasswordValidationEvent);
    on<FormValidationEvent>(_onFormValidationEvent);
  }

  Future<void> _onLoginValidationEvent(
      LoginValidationEvent event, Emitter<AuthState> emit) async {
    final error = Validators.emptyValidators(event.value);
    if (error == null) {
      emit(LoginValidState());
      return;
    }
    emit(
      LoginInvalidState(error: error),
    );
  }

  Future<void> _onPasswordValidationEvent(
      PasswordValidationEvent event, Emitter<AuthState> emit) async {
    final error = Validators.emptyValidators(event.value);
    if (error == null) {
      emit(PasswordValidState());
      return;
    }
    emit(
      PasswordInvalidState(error: error),
    );
  }

  Future<void> _onFormValidationEvent(
      FormValidationEvent event, Emitter<AuthState> emit) async {
    final loginError = Validators.emptyValidators(event.login);
    final passwordError = Validators.emptyValidators(event.password);
    if (loginError == null && passwordError == null) {
      emit(FormValidState());
      return;
    }
    emit(
        FormInvalidState(loginError: loginError, passwordError: passwordError));
  }
}
