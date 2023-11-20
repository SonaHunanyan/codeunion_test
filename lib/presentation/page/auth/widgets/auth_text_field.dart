import 'package:codeunion_test/presentation/theme/app_theme.dart';
import 'package:codeunion_test/presentation/util/constants.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    this.controller,
    this.hint,
    this.hasBorder = false,
    super.key,
  });

  final String? hint;
  final bool hasBorder;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 60 * rh(context),
          padding: EdgeInsets.symmetric(
            horizontal: 16 * rw(context),
          ),
          decoration: BoxDecoration(
            color: context.themeData.colorScheme.primaryContainer,
          ),
          child: TextField(
            controller: controller,
            style: context.themeData.textTheme.bodyMedium,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: context.themeData.textTheme.bodyMedium?.copyWith(
                color: context.themeData.colorScheme.primary,
              ),
            ),
          ),
        ),
        if (hasBorder)
          Container(
            color: context.themeData.colorScheme.primaryContainer,
            padding: EdgeInsets.symmetric(
              horizontal: 16 * rw(context),
            ),
            child: Divider(
              height: 1,
              color: context.themeData.dividerColor,
            ),
          )
      ],
    );
  }
}
