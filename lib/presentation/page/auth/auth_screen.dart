import 'package:auto_route/auto_route.dart';
import 'package:codeunion_test/presentation/page/auth/bloc/auth_bloc.dart';
import 'package:codeunion_test/presentation/page/auth/bloc/auth_event.dart';
import 'package:codeunion_test/presentation/page/auth/bloc/auth_state.dart';
import 'package:codeunion_test/presentation/page/auth/widgets/widgets.dart';
import 'package:codeunion_test/presentation/page/widgets/custom_app_bar.dart';
import 'package:codeunion_test/presentation/page/widgets/primary_button.dart';
import 'package:codeunion_test/presentation/theme/app_strings.dart';
import 'package:codeunion_test/presentation/theme/app_theme.dart';
import 'package:codeunion_test/presentation/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<AuthScreen> {
  String? _loginError;
  String? _passwordError;
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  final _bloc = AuthBloc();

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => _bloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: blocListener,
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) => Scaffold(
            backgroundColor: context.themeData.scaffoldBackgroundColor,
            appBar: CustomAppBar(
              context,
              title: AppStrings.authorization,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthTextField(
                      onChanged: (value) => _bloc.add(
                        LoginValidationEvent(value: value),
                      ),
                      error: _loginError,
                      controller: _loginController,
                      hint: AppStrings.loginOrEmail,
                      hasBorder: true,
                    ),
                    AuthTextField(
                      onChanged: (value) => _bloc.add(
                        PasswordValidationEvent(value: value),
                      ),
                      error: _passwordError,
                      controller: _passwordController,
                      hint: AppStrings.password,
                    ),
                    SizedBox(
                      height: 32 * rh(context),
                    ),
                    PrimaryButton(
                      onTap: () {
                        _bloc.add(
                          FormValidationEvent(
                              login: _loginController.text,
                              password: _passwordController.text),
                        );
                      },
                      title: AppStrings.login,
                    ),
                    SizedBox(
                      height: 19 * rh(context),
                    ),
                    const PrimaryButton(
                      title: AppStrings.register,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension _StateAddititon on _State {
  void blocListener(BuildContext context, AuthState state) {
    if (state is LoginInvalidState) {
      _loginError = state.error;
    }
    if (state is LoginValidState) {
      _loginError = null;
    }
    if (state is PasswordInvalidState) {
      _passwordError = state.error;
    }
    if (state is PasswordValidState) {
      _passwordError = null;
    }
    if (state is FormInvalidState) {
      _passwordError = state.passwordError;
      _loginError = state.loginError;
    }
  }
}
