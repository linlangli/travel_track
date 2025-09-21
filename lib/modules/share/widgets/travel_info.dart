import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:travel_track/extensions/widget.dart';
import 'package:travel_track/modules/share/widgets/invite_dialog.dart';
import 'package:travel_track/modules/share/widgets/partner.dart';
import 'package:travel_track/modules/share/widgets/progress.dart';
import 'package:travel_track/modules/share/widgets/travel_route.dart';

class TravelInfoWidget extends StatelessWidget {
  const TravelInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/icons/road_sign_icon.svg',
                    width: 28,
                    height: 28,
                  ),
                  Text(
                    "雨崩之行",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: 'MuyaoSoftbrush',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Spacer(flex: 1),
                  SvgPicture.asset(
                    'assets/images/icons/begin_button_icon.svg',
                    width: 48,
                    height: 48,
                  ).button(),
                ],
              ).marginOnly(top: 16, bottom: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "参与人员:",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 12),
                  PartNerWidget(),
                  SizedBox(width: 8),
                  SvgPicture.asset(
                    'assets/images/icons/invite_message_icon.svg',
                    width: 32,
                    height: 32,
                  ).button(onTap: () {
                    InviteDialog.show(context, tripName: "雨崩", inviteCode: "2222");
                  }),
                ],
              ).marginOnly(bottom: 24),
              Row(
                children: [
                  Text(
                    "旅行时间: ",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "2024.05.01 - 2024.05.07",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "注意事项: ",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ).marginOnly(bottom: 8),
                      Text("别忘了带身份证"),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/images/icons/surprise_icon.svg',
                    width: 80,
                    height: 80,
                  ),
                ],
              ).marginOnly(bottom: 12),
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Text(
                        "旅行路线",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Positioned(
                        left: 60,
                        top: -16,
                        child: SvgPicture.asset(
                          'assets/images/icons/yellow_rocket.svg',
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 48),
                  SvgPicture.asset(
                    'assets/images/icons/red_car_icon.svg',
                    width: 28,
                    height: 28,
                  ),
                  SizedBox(width: 4),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xFFE67A92),
                    ),
                    child: Text("飞机"),
                  ),
                  SizedBox(width: 12),
                  SvgPicture.asset(
                    'assets/images/icons/money_bag_icon.svg',
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 4),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xFFE67A92),
                    ),
                    child: Text("飞机"),
                  ),
                ],
              ),
              SizedBox(height: 12),
              TravelRouteWidget(),
              SizedBox(height: 24),
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Text(
                          "旅行统计",
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        left: 64,
                        top: -10,
                        child: SvgPicture.asset(
                          'assets/images/icons/yellow_paint.svg',
                          width: 22,
                          height: 22,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Text("进度: ", style: Theme.of(context).textTheme.titleSmall),
                  ProgressWidget(),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Text("消费: ", style: Theme.of(context).textTheme.titleSmall),
                  ProgressWidget(),
                ],
              ),
            ],
          ).paddingSymmetric(horizontal: 24),
        ),
        Positioned(
          bottom: 8,
          right: 32,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/images/icons/camera_icon.svg',
                width: 74,
                height: 74,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
