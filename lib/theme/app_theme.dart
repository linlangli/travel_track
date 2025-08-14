import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    textTheme: const TextTheme(
      headlineLarge: AppTextStyles.headline1,
      headlineMedium: AppTextStyles.headline6,
      headlineSmall: AppTextStyles.bodyText1,
      titleLarge: AppTextStyles.bodyText1,
      titleMedium: AppTextStyles.bodyText1,
      titleSmall: AppTextStyles.bodyText1,
      bodyLarge: AppTextStyles.bodyText2,
      bodyMedium: AppTextStyles.caption,
      bodySmall: AppTextStyles.caption,
      labelLarge: AppTextStyles.bodyText2,
      labelMedium: AppTextStyles.caption,
      labelSmall: AppTextStyles.caption,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      titleTextStyle: AppTextStyles.headline6,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}