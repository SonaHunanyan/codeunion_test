import 'package:codeunion_test/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static ScaffoldMessengerState showSnackBar(String? text, Color? color) {
    final snackBar = SnackBar(
      content: Text(text ?? ''),
      backgroundColor: color,
    );

    return messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showLoading(BuildContext context) {
    FocusScope.of(context).unfocus();
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(
                color: context.themeData.secondaryHeaderColor,
              ),
            ));
  }
}
