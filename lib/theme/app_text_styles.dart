import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: 'ZCOOLKuaiLe', // 建议用手写风格字体
  );

  static const TextStyle headline6 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: 'ZCOOLKuaiLe',
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
    fontFamily: 'ZCOOLKuaiLe',
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
    fontFamily: 'ZCOOLKuaiLe',
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
    fontFamily: 'ZCOOLKuaiLe',
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: 'ZCOOLKuaiLe',
  );

  static const TextStyle label = TextStyle(
    fontSize: 12,
    color: AppColors.secondary,
    fontFamily: 'ZCOOLKuaiLe',
  );
}