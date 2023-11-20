import 'package:codeunion_test/presentation/theme/app_theme.dart';
import 'package:codeunion_test/presentation/util/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.title,
    this.onTap,
    this.isLoading = false,
    super.key,
  });

  final VoidCallback? onTap;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 32 * rw(context),
        alignment: Alignment.center,
        height: 64 * rh(context),
        decoration: BoxDecoration(
          color: context.themeData.colorScheme.secondary,
          borderRadius: BorderRadius.circular(
            6 * rh(context),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                color: context.themeData.colorScheme.primaryContainer,
              )
            : Text(
                title,
                style: context.themeData.textTheme.displayMedium,
              ),
      ),
    );
  }
}
