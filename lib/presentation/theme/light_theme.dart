import 'package:codeunion_test/presentation/theme/app_colors.dart';
import 'package:codeunion_test/presentation/theme/app_fonts.dart';
import 'package:flutter/material.dart';

final base = ThemeData.light();

final lightTheme = base.copyWith(
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: const ColorScheme.light(
    primaryContainer: AppColors.white,
    primary: AppColors.grey,
    secondary: AppColors.purple,
    error: AppColors.red,
  ),
  secondaryHeaderColor: AppColors.black,
  primaryColor: AppColors.bgContentGrey,
  dividerColor: AppColors.stroke,
  textTheme: base.primaryTextTheme.copyWith(
    //   displayLarge: base.primaryTextTheme.displayLarge!.copyWith(
    //     fontFamily: FontFamily.inter,
    //     fontWeight: FontWeight.w500,
    //     fontSize: 20.awr,
    //   ),
    displayMedium: base.primaryTextTheme.displayMedium!.copyWith(
      fontFamily: FontFamily.manrope,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      height: 1.5,
      color: Colors.white,
    ),
    displaySmall: base.primaryTextTheme.displaySmall!.copyWith(
      fontFamily: FontFamily.manrope,
      fontWeight: FontWeight.normal,
      fontSize: 10,
      height: 1.4,
      color: AppColors.black,
    ),
    //   headlineLarge: base.primaryTextTheme.headlineLarge?.copyWith(
    //     height: 1.3,
    //     fontWeight: FontWeight.w700,
    //     fontSize: 32.awr,
    //     letterSpacing: -.1,
    //     fontFamily: FontFamily.poppins,
    //     color: AppColors.mail,
    //   ),
    //   headlineMedium: base.primaryTextTheme.headlineMedium!.copyWith(
    //     fontFamily: FontFamily.inter,
    //     fontWeight: FontWeight.w500,
    //     fontSize: 28.awr,
    //     letterSpacing: -.52,
    //     height: 1.25,
    //   ),
    //   headlineSmall: base.primaryTextTheme.headlineSmall!.copyWith(
    //     fontFamily: FontFamily.poppins,
    //     fontWeight: FontWeight.w600,
    //     fontSize: 22.awr,
    //     height: 1.3,
    //     color: Colors.white,
    //   ),
    titleLarge: base.primaryTextTheme.titleLarge!.copyWith(
      fontFamily: FontFamily.manrope,
      fontWeight: FontWeight.w600,
      fontSize: 24,
      height: 1.66,
      color: AppColors.black,
    ),
    titleMedium: base.primaryTextTheme.titleMedium!.copyWith(
      fontFamily: FontFamily.manrope,
      fontWeight: FontWeight.w500,
      fontSize: 15,
      height: 1.3,
      color: AppColors.black,
    ),
    //   titleSmall: base.primaryTextTheme.titleSmall!.copyWith(
    //     fontFamily: FontFamily.inter,
    //     fontWeight: FontWeight.w400,
    //     fontSize: 16.awr,
    //     height: 1.25,
    //     color: AppColors.longTextColor,
    //   ),
    //   bodyLarge: base.primaryTextTheme.bodyLarge!.copyWith(
    //     fontFamily: FontFamily.inter,
    //     fontWeight: FontWeight.w600,
    //     fontSize: 18.awr,
    //     letterSpacing: -.18,
    //     height: 1.3,
    //     color: AppColors.mail,
    //   ),
    bodyMedium: base.primaryTextTheme.bodyMedium!.copyWith(
      fontFamily: FontFamily.manrope,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.375,
      color: AppColors.black,
    ),
    //   bodySmall: TextStyle(
    //       fontFamily: FontFamily.poppins,
    //       fontWeight: FontWeight.normal,
    //       fontSize: 12.awr,
    //       height: 1.3,
    //       letterSpacing: -.12,
    //       color: Colors.grey),
    //   labelSmall: TextStyle(
    //     fontFamily: FontFamily.poppins,
    //     fontWeight: FontWeight.w500,
    //     fontSize: 14.awr,
    //     height: 1.3,
    //     letterSpacing: -.14,
    //     color: AppColors.mail,
    //   ),
    //   labelLarge: TextStyle(
    //     color: AppColors.mail,
    //     fontFamily: FontFamily.inter,
    //     fontWeight: FontWeight.w400,
    //     fontSize: 17.awr,
    //     height: 1.25,
    //   ),
    // ),
  ),
);
