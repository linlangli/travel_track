import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_track/extensions/number.dart';
import 'package:travel_track/extensions/widget.dart';

class StateWidget extends StatelessWidget {
  final Function? onTap;
  final String text;
  final String image;

  const StateWidget(
      {super.key, this.onTap, this.text = '', required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          image,
          width: 300.w(),
          height: 300.h(),
        ),
        onTap == null
            ? SizedBox()
            : Text(text).button(
          width: 64,
          height: 32,
          color: Theme.of(context).colorScheme.primary,
          onTap: () {
            onTap?.call();
          },
        ),
        SizedBox(
          height: 64,
        ),
      ],
    );
  }
}
