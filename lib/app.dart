import 'package:codeunion_test/presentation/router/app_router.dart';
import 'package:codeunion_test/presentation/theme/app_strings.dart';
import 'package:codeunion_test/presentation/theme/light_theme.dart';
import 'package:codeunion_test/presentation/util/constants.dart';
import 'package:codeunion_test/presentation/util/utils.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: Utils.messengerKey,
      key: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      theme: lightTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
