import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ButtonType {
  text,
  image,
}

extension WidgetExtension on Widget {
  Widget button(
      {GestureTapCallback? onTap,
        Color? color,
        double? width,
        double? height,
        ButtonType type = ButtonType.text}) {
    if (type == ButtonType.image) {
      return GestureDetector(
        onTap: onTap,
        child: this,
      );
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: this,
      ),
    );
  }

  Widget backgroundColor(Color color) {
    return Container(
      color: color,
      child: this,
    );
  }
}
