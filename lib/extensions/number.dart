import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_track/utils/device.dart';

extension NumExtension on num {
  /// 限制最小值，如果当前值小于最小值，则返回最小值
  num min(num minValue) {
    return this < minValue ? minValue : this;
  }

  /// 限制最大值，如果当前值大于最大值，则返回最大值
  num max(num maxValue) {
    return this > maxValue ? maxValue : this;
  }

  /// 对当前数值四舍五入到指定小数位
  double roundTo(double fractionDigits) {
    final mod = pow(10.0, fractionDigits);
    return ((this * mod).round().toDouble()) / mod;
  }

  /// 将数值转换为百分比（保留指定小数位）
  String toPercentage({double fractionDigits = 2}) {
    return '${(this * 100).roundTo(fractionDigits)}%';
  }

  /// 判断当前数值是否在指定范围内（闭区间）
  bool isBetween(num start, num end) {
    return this >= start && this <= end;
  }

  /// 将当前数值转化为货币格式（包含千位分隔符）
  String toCurrency({double fractionDigits = 2}) {
    final number = roundTo(fractionDigits);
    final currencyFormatter = NumberFormat.simpleCurrency(decimalDigits: fractionDigits.toInt());
    return currencyFormatter.format(number);
  }

  /// 将当前数值转换为带千分位的字符串
  String toThousands() {
    final formatter = NumberFormat("#,##0", "en_US");
    return formatter.format(this);
  }

  /// 将当前数值转换为以 `KB`, `MB`, `GB` 为单位的字符串
  String toFileSize({double fractionDigits = 2}) {
    double size = toDouble();
    if (size < 1024) {
      return '$size B';
    } else if (size < 1024 * 1024) {
      return "${(size / 1024).roundTo(fractionDigits)} KB";
    } else if (size < 1024 * 1024 * 1024) {
      return "${(size / (1024 * 1024)).roundTo(fractionDigits)} MB";
    } else {
      return "${(size / (1024 * 1024 * 1024)).roundTo(fractionDigits)} GB";
    }
  }

  double scale({ double reference = 393.0 }) {
    final globalContext = Get.context;
    double scaleFactor = 1;
    if(globalContext != null) {
      final size = MediaQuery.of(globalContext).size;
      scaleFactor = size.width / reference; // 基于设计稿宽度
    }
    return this * scaleFactor;
  }

  /// 宽度适配
  double w() {
    return this * DeviceUtil.scaleWidth;
  }

  /// 高度适配
  double h() {
    return this * DeviceUtil.scaleHeight;
  }

  /// 字体大小适配，默认按宽度
  double sp() {
    return this * DeviceUtil.scaleWidth;
  }
}