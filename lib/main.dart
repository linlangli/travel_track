import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:travel_track/services/analytics/analytics_route_observer.dart';
import 'package:travel_track/theme/app_theme.dart';
import 'package:travel_track/utils/device.dart';
import 'app/binding.dart';
import 'app/router.dart';
import 'i18n/translation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // 捕获 Flutter 框架异常
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // 捕获 Zone 异常
  runZonedGuarded(
        () => runApp(const TravelTrackApp()),
        (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
  );
}

class TravelTrackApp extends StatelessWidget {
  const TravelTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceUtil.init(context);
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
      navigatorObservers: [AnalyticsRouteObserver.instance],
    );
  }
}