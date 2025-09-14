import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class PartNerWidget extends StatefulWidget {
  const PartNerWidget({super.key});

  @override
  State<PartNerWidget> createState() => _PartNerWidgetState();
}

class _PartNerWidgetState extends State<PartNerWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ClipOval(
          child: SvgPicture.asset(
            'assets/images/icons/avatar_default.svg',
            width: 28,
            height: 28,
          ),
        ),
        SizedBox(width: 2,),
        ClipOval(
          child: SvgPicture.asset(
            'assets/images/icons/avatar_default.svg',
            width: 28,
            height: 28,
          ),
        ),
        SizedBox(width: 2,),
        ClipOval(
          child: SvgPicture.asset(
            'assets/images/icons/avatar_default.svg',
            width: 36,
            height: 36,
          ),
        ),
        SizedBox(width: 2,),
        ClipOval(
          child: SvgPicture.asset(
            'assets/images/icons/avatar_default.svg',
            width: 28,
            height: 28,
          ),
        ),
      ],
    );
  }
}