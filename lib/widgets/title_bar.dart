import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:travel_track/extensions/widget.dart';

class TitleBar extends StatefulWidget {
  final Function onSetting;
  final Function onMessage;

  const TitleBar({
    super.key,
    required this.onSetting,
    required this.onMessage,
  });

  @override
  State<TitleBar> createState() => TitleBarState();
}

class TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset('assets/images/icons/setting_icon.svg',
          width: 32, height: 32,
        ).button(onTap: () {
          widget.onSetting();
        }),
        Text('app_name'.tr),
        SvgPicture.asset('assets/images/icons/message_icon.svg',
          width: 24, height: 28,
        ).button(
            type: ButtonType.image,
            onTap: () {
              widget.onMessage();
            }
        ),
      ],
    ).marginOnly(left: 16, right: 16, top: Platform.isAndroid ? 20 : 0);
  }

}