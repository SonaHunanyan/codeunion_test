import 'package:codeunion_test/presentation/theme/app_strings.dart';
import 'package:codeunion_test/presentation/theme/app_theme.dart';
import 'package:codeunion_test/presentation/util/constants.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        color: context.themeData.colorScheme.primaryContainer,
        padding: EdgeInsets.only(left: 29 * rw(context)),
        height: 55 * rh(context),
        width: MediaQuery.of(context).size.width,
        child: Text(
          AppStrings.logout,
          style: context.themeData.textTheme.bodyMedium?.copyWith(
            color: context.themeData.colorScheme.error,
            height: 1,
          ),
        ),
      ),
    );
  }
}
