import 'package:auto_route/auto_route.dart';
import 'package:codeunion_test/presentation/page/auth/widgets/widgets.dart';
import 'package:codeunion_test/presentation/page/widgets/custom_app_bar.dart';
import 'package:codeunion_test/presentation/page/widgets/primary_button.dart';
import 'package:codeunion_test/presentation/theme/app_strings.dart';
import 'package:codeunion_test/presentation/theme/app_theme.dart';
import 'package:codeunion_test/presentation/util/constants.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<AuthScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: _loginController,
                hint: AppStrings.loginOrEmail,
                hasBorder: true,
              ),
              AuthTextField(
                controller: _passwordController,
                hint: AppStrings.password,
              ),
              SizedBox(
                height: 32 * rh(context),
              ),
              const PrimaryButton(
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
    );
  }
}
