import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_track/extensions/widget.dart';
import 'package:travel_track/modules/share/widgets/partner.dart';
import 'package:travel_track/modules/share/widgets/progress.dart';
import 'package:travel_track/modules/share/widgets/travel_route.dart';

class TravelInfoWidget extends StatelessWidget{
  const TravelInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/card_icon.svg', width: 16, height: 16,),
            Text("雨崩之行"),
            Container(
              child: Text("进行中"),
            )
          ],
        ),
        Row(
          children: [
            Text("参与人员"),
            PartNerWidget(),
            Column(
              children: [
                SvgPicture.asset('assets/icons/card_icon.svg', width: 16, height: 16,),
                Text("邀请其它好友一起")
              ],
            ),
            SvgPicture.asset('assets/icons/card_icon.svg', width: 16, height: 16,).button(),
          ],
        ),
        Row(
          children: [
            Text("旅行时间"),
            Text("2024.05.01 - 2024.05.07"),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                Text("注意事项: "),
                Text("别忘了带身份证")
              ],
            ),
            SvgPicture.asset('assets/icons/card_icon.svg', width: 16, height: 16,),
          ],
        ),
        Row(
          children: [
            Text("旅行路线"),
            SvgPicture.asset('assets/icons/card_icon.svg', width: 16, height: 16,),
            Text("查看路线"),
          ],
        ),
        TravelRouteWidget(),
        Row(
          children: [
            Text("实时统计"),
            SvgPicture.asset('assets/icons/card_icon.svg', width: 16, height: 16,),
          ],
        ),
        Row(
          children: [
            Text("进度: "),
            ProgressWidget()
          ],
        ),
        Row(
          children: [
            Text("消费: "),
            ProgressWidget()
          ],
        ),
        Row(
          children: [
            SvgPicture.asset('assets/icons/card_icon.svg', width: 16, height: 16,),
            Column(
              children: [
                Text("点我卡擦一下"),
                SvgPicture.asset('assets/icons/card_icon.svg', width: 64, height: 64,)
              ],
            )
          ],
        )
      ],
    );
  }
}