import 'dart:convert';

extension StringExtension on String {
  /// 将字符串转换为驼峰命名法
  String toCamelCase() {
    return split(' ').map((word) {
      return word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase();
    }).join('');
  }

  /// 将字符串转换为下划线命名法
  String toSnakeCase() {
    return replaceAll(' ', '_').toLowerCase();
  }

  /// 将字符串转换为大写
  String toUpperCase() {
    return this.toUpperCase();
  }

  /// 将字符串转换为小写
  String toLowerCase() {
    return this.toLowerCase();
  }

  String log({String? tag}) {
    final logTag = tag ?? '🚗';
    print('[$logTag] $this');
    return this;
  }

  /// 检查是否为正确的JSON格式
  bool isValidJson() {
    try {
      final json = jsonDecode(this);
      return json is Map || json is List;
    } catch (e) {
      return false;
    }
  }

  /// 检查是否为有效的URL
  bool isValidUrl() {
    final urlPattern = r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$';
    final regex = RegExp(urlPattern, caseSensitive: false);
    return regex.hasMatch(this);
  }

  /// 检查是否为有效的Email地址
  bool isValidEmail() {
    final emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern, caseSensitive: false);
    return regex.hasMatch(this);
  }
}