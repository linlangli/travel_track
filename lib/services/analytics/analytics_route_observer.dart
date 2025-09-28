import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';

/// 全局页面路由埋点观察者
class AnalyticsRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  AnalyticsRouteObserver._();
  static final AnalyticsRouteObserver instance = AnalyticsRouteObserver._();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  void _sendScreen(PageRoute<dynamic> route) {
    final name = route.settings.name ?? route.runtimeType.toString();
    print("Logging screen view: $name");
    _analytics.logScreenView(screenName: name, screenClass: name);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) _sendScreen(route);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) _sendScreen(newRoute);
  }

  // 当顶部路由被弹出时 previousRoute 重新可见，这里对 previousRoute 上报
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute) _sendScreen(previousRoute);
  }
}
