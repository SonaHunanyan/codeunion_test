import 'package:codeunion_test/presentation/theme/app_theme.dart';
import 'package:codeunion_test/presentation/util/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(
    BuildContext context, {
    required String title,
    super.key,
  }) : super(
          shadowColor: Colors.transparent,
          backgroundColor: context.themeData.colorScheme.primaryContainer,
          title: Text(
            title,
            style: context.themeData.textTheme.titleMedium,
          ),
          toolbarHeight: appBarHeight(context),
          centerTitle: true,
        );
}
