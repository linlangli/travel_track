import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:travel_track/theme/app_theme.dart';

import 'app/binding.dart';
import 'app/router.dart';
import 'i18n/translation.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TravelTrackApp());
}

class TravelTrackApp extends StatelessWidget {
  const TravelTrackApp({super.key});


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return GetMaterialApp(
      title: 'Travel Track',
      initialBinding: AppBinding(),
      initialRoute: AppRoute.mainPage, // 设置初始路由
      getPages: AppRoute.routers,
      translations: AppTranslations(), // 设置翻译类
      locale: const Locale('en', 'US'),      // 默认语言
      fallbackLocale: const Locale('en', 'US'), // 备用语言
      theme: AppTheme.lightTheme, // 默认亮色主题
      darkTheme: AppTheme.lightTheme, // 暗色主题
      themeMode: ThemeMode.light, // 默认主题模式
    );
  }
}