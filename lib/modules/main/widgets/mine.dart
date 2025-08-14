import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:travel_track/modules/main/enums/mine_tab.dart';
import 'package:travel_track/extensions/widget.dart';
import 'package:travel_track/modules/main/controller.dart';
import 'package:travel_track/modules/share/widgets/person_info.dart';
import 'package:travel_track/modules/share/widgets/travel_info_item.dart';
import 'package:travel_track/widgets/search.dart';

class MineWidget extends StatelessWidget {
  const MineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PersonInfoWidget(),
        SizedBox(height: 12,),
        Row(
          children: [
            Text('世界那么大，我想去看看', style: Theme.of(context).textTheme.bodySmall,),
          ],
        ),
        SizedBox(height: 20,),
        GetBuilder<MainController>(builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/images/common/search_icon.svg',
                width: 20,
                height: 20,
              ).button(onTap: () {
                controller.setSearchVisible(!controller.searchVisible);
              }).marginOnly(right: controller.searchVisible ? 16 : 0),
              controller.searchVisible ? Expanded(child: SizedBox(height: 36,child: SearchWidget(),)) : SizedBox(
                height: 36,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: controller.mineTab == MineTab.collections
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onSecondary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                      child: Text('收藏', style: Theme.of(context).textTheme.headlineSmall,),
                    ).button(
                      onTap: () {
                        controller.switchMineTab(MineTab.collections);
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: controller.mineTab == MineTab.posts
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onSecondary,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                      child: Text('内容', style: Theme.of(context).textTheme.headlineSmall,),
                    ).button(
                      onTap: () {
                        controller.switchMineTab(MineTab.posts);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20,),
            ],
          ).paddingSymmetric(horizontal: 4);
        }),
        SizedBox(height: 24,),
        TravelInfoItem(
          type: '徒步',
          title: '行行行行行',
          date: '2023-12-01',
          people: 5,
          money: 1200.0,
          looks: 100,
          collects: 20,
        ).marginOnly( bottom: 16),
        TravelInfoItem(
          type: '徒步',
          title: '行行行行行',
          date: '2023-12-01',
          people: 5,
          money: 1200.0,
          looks: 100,
          collects: 20,
        ).marginOnly( bottom: 16),
      ],
    ).paddingSymmetric(horizontal: 16, vertical: 12);
  }
}