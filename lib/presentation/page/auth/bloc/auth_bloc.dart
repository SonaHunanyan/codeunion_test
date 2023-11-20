import 'package:codeunion_test/domain/repository/auth_repository.dart';
import 'package:codeunion_test/presentation/page/auth/bloc/auth_event.dart';
import 'package:codeunion_test/presentation/page/auth/bloc/auth_state.dart';
import 'package:codeunion_test/presentation/util/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(AuthInitialState()) {
    on<LoginValidationEvent>(_onLoginValidationEvent);
    on<PasswordValidationEvent>(_onPasswordValidationEvent);
    on<FormValidationEvent>(_onFormValidationEvent);
    on<LoginEvent>(_onLoginEvent);
  }

  final IAuthRepository authRepository;

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

  Future<void> _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoginInProgressState());
      final result = await authRepository.login(
          email: event.login, password: event.password);
      final error = result.error;
      if (error == null) {
        emit(LoginSuccessState());
        return;
      }
      emit(FailToLoginState(error: error.data?['message']));
    } catch (e) {
      emit(
        FailToLoginState(
          error: e.toString(),
        ),
      );
    }
  }
}
