import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:travel_track/modules/share/widgets/travel_info_item.dart';
import 'package:travel_track/widgets/search.dart';

class DiscoverWidget extends StatelessWidget{
  const DiscoverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/icons/search_icon.svg',
              width: 24,
              height: 24,
            ),
            SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: 32,
                child: SearchWidget(),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            SvgPicture.asset(
              'assets/images/icons/filter_icon.svg',
              width: 24,
              height: 24,
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              // 在此处定义每个列表项的构建逻辑
              return TravelInfoItem(
                type: '徒步',
                title: '行行行行行',
                date: '2023-12-01',
                people: 5,
                money: 1200.0,
                looks: 100,
                collects: 20,
              ).marginOnly(bottom: 12);
            },
            separatorBuilder: (context, index) {
              // 在此处定义分隔符的构建逻辑
              return SizedBox(height: 12,);
            },
            itemCount: 10, // 设置列表项的数量
          ),
        )
      ],
    ).paddingSymmetric(horizontal: 20, vertical: 8);
  }
}