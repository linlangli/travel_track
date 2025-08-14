import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageWidget extends StatelessWidget {
  final Widget child;
  final bool requireSafeArea;
  final Color? backgroundColor;
  final bool center;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final Widget? title;
  final Widget? navigation;

  const PageWidget({
    super.key,
    required this.child,
    this.requireSafeArea = true,
    this.backgroundColor,
    this.center = false,
    this.paddingVertical,
    this.paddingHorizontal,
    this.title,
    this.navigation
  });

  @override
  Widget build(BuildContext context) {
    Widget content = child;

    content = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title ?? SizedBox(),
        content,
        navigation?? SizedBox()
      ],
    );

    if (paddingVertical != null) {
      content = content.paddingSymmetric(vertical: paddingVertical!);
    }
    if (paddingHorizontal != null) {
      content = content.paddingSymmetric(horizontal: paddingHorizontal!);
    }

    if (center) {
      content = Center(
        child: content,
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      body: requireSafeArea ? SafeArea(
        child: content,
      ) : content,
    );
  }
}