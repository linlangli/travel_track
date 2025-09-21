import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TravelRouteWidget extends StatelessWidget {
  const TravelRouteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> itinerary = [
      {
        'day': '第1天',
        'city': '昆明',
        'transport': '飞机',
        'cost': 120,
        'description': '早上去花市，晚上去四季餐厅吃饭，住香格里拉酒店',
        'highlight': [
          {'text': '四季餐厅', 'emoji': '🍜'},
          {'text': '香格里拉酒店', 'emoji': '🏨'},
        ],
        'active': true,
      },
      {
        'day': '第2天',
        'city': '大理',
        'transport': '高铁',
        'cost': 180,
        'description': '洱海骑行，古城闲逛，晚餐苍山脚下客栈',
        'highlight': [
          {'text': '洱海', 'emoji': '🚴'},
          {'text': '古城', 'emoji': '🏯'},
        ],
        'active': false,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(itinerary.length, (index) {
        final item = itinerary[index];
        return Column(
          children: [
            Row(
              children: [
                Text("第1天"),
                SizedBox(width: 4,),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 4,),
                Text(item['city'], style: Theme.of(context).textTheme.titleSmall,),
                SizedBox(width: 12,),
                Text("餐饮: ${item['cost']}", style: Theme.of(context).textTheme.titleSmall,),
                SizedBox(width: 8,),
                Text("住宿: ${item['cost']}", style: Theme.of(context).textTheme.titleSmall,),
                SizedBox(width: 8,),
                Text("娱乐: ${item['cost']}", style: Theme.of(context).textTheme.titleSmall,)
              ],
            ),
            Row(
              children: [
                SizedBox(width: 12,),
                Container(
                  width: 2,
                  height: 48,
                  color: Colors.black,
                ),
                SizedBox(width: 24,),
                Expanded(child: Text("${item['description']}", style: Theme.of(context).textTheme.titleSmall,)),
              ],
            )
          ]
        ).paddingOnly(left: 4);
      }),
    );
  }
}
