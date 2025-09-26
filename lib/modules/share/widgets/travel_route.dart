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
        'dining': "摇窈",
        "accommodation": "定位定位",
        'active': true,
      },
      {
        'day': '第2天',
        'city': '大理',
        'transport': '高铁',
        'cost': 180,
        'description': '洱海骑行，古城闲逛，晚餐苍山脚下客栈',
        'dining': "摇窈",
        "accommodation": "定位定位",
        'active': false,
      },
    ];

    return Column(




      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(itinerary.length, (index) {
        final item = itinerary[index];
        return Column(
          children: [
            // 顶部行: 日期 + 节点 + 基础信息
            Row(
              children: [
                Text(item['day']),
                const SizedBox(width: 4),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: item['active'] == true ? Colors.amber : Colors.grey.shade400,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                Text(item['city'], style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: 12),
                Text("餐饮: ${item['cost']}", style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: 8),
                Text("住宿: ${item['cost']}", style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: 8),
                Text("娱乐: ${item['cost']}", style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
            // 描述行: 使用 IntrinsicHeight 让竖线自适应文本高度
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(width: 12),
                  Container(width: 2, color: Colors.black.withOpacity(0.7)),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Text(
                      item['description'] ?? '',
                      style: Theme.of(context).textTheme.titleSmall,
                    ).marginOnly(bottom: 12, top: 8),
                  ),
                ],
              ),
            )
          ],
        ).paddingOnly(left: 4, top: 4, bottom: 4);
      }),
    );
  }
}
