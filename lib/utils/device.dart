import 'package:flutter/widgets.dart';

class DeviceUtil {
  static late double scaleWidth;
  static late double scaleHeight;

  static late double screenWidth;
  static late double screenHeight;

  /// 初始化屏幕工具类
  /// 初始化，在 app 启动时调用一次
  static void init(BuildContext context, {double designWidth = 393, double designHeight = 852}) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    scaleWidth = screenWidth / designWidth;
    scaleHeight = screenHeight / designHeight;
  }

  /// 获取宽度的百分比
  static double widthPercent(double percent) {
    return screenWidth * percent;
  }

  /// 获取高度的百分比
  static double heightPercent(double percent) {
    return screenHeight * percent;
  }
}