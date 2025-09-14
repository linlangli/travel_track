import 'package:flutter/material.dart';

class TravelRouteWidget extends StatelessWidget {
  const TravelRouteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // mock 行程数据
    final List<Map<String, dynamic>> itinerary = [
      {
        'day': '第1天',
        'city': '昆明',
        'transport': '飞机',
        'cost': 120,
        'description': '早上去花市，晚上去🍜四季餐厅吃饭，住🏨香格里拉酒店',
        'highlight': [
          {'text': '四季餐厅', 'emoji': '🍜'},
          {'text': '香格里拉酒店', 'emoji': '🏨'},
        ],
        'active': true,
      },
      {
        'day': '第2天',
        'city': '大理',
        'transport': '飞机',
        'cost': 120,
        'description': '',
        'active': true,
      },
      {
        'day': '第3天',
        'city': '大理',
        'description': '',
        'active': false,
      },
      {
        'day': '第4天',
        'city': '大理',
        'description': '',
        'active': false,
      },
      {
        'day': '第5天',
        'city': '大理',
        'description': '',
        'active': false,
      },
      {
        'day': '第6天',
        'city': '大理',
        'description': '',
        'active': false,
      },
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 16, right: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 左侧时间轴
          Column(
            children: List.generate(itinerary.length, (index) {
              final isLast = index == itinerary.length - 1;
              final item = itinerary[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      // 天数
                      SizedBox(
                        width: 48,
                        child: Text(
                          item['day'],
                          style: TextStyle(
                            color: item['active'] == true
                                ? Colors.grey[600]
                                : Colors.grey[400],
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      // 竖线
                      if (!isLast)
                        Container(
                          width: 2,
                          height: 48,
                          color: Colors.black,
                        ),
                    ],
                  ),
                  // 圆点
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 8, top: 4),
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          // 右侧内容
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(itinerary.length, (index) {
                final item = itinerary[index];
                final isActive = item['active'] == true;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            item['city'] ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: isActive ? Colors.grey[700] : Colors.grey[400],
                            ),
                          ),
                          if (item['transport'] != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                '交通工具：${item['transport']}  消费：${item['cost'] ?? ''}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: isActive ? Colors.black : Colors.grey[400],
                                ),
                              ),
                            ),
                        ],
                      ),
                      if ((item['description'] ?? '').isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 12, left: 8),
                          child: _buildDescription(item),
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(Map<String, dynamic> item) {
    // 处理高亮和表情
    String desc = item['description'] ?? '';
    List<InlineSpan> spans = [];
    if (item['highlight'] != null) {
      int last = 0;
      for (var h in item['highlight']) {
        String text = h['text'];
        String emoji = h['emoji'] ?? '';
        int idx = desc.indexOf(text, last);
        if (idx > last) {
          spans.add(TextSpan(text: desc.substring(last, idx), style: TextStyle(fontSize: 20, color: Colors.black)));
        }
        if (idx != -1) {
          spans.add(WidgetSpan(
            child: Text(emoji, style: TextStyle(fontSize: 22)),
            alignment: PlaceholderAlignment.middle,
          ));
          spans.add(TextSpan(
            text: text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.amber[800]),
          ));
          last = idx + text.length;
        }
      }
      if (last < desc.length) {
        spans.add(TextSpan(text: desc.substring(last), style: TextStyle(fontSize: 20, color: Colors.black)));
      }
      return RichText(text: TextSpan(children: spans));
    } else {
      return Text(desc, style: TextStyle(fontSize: 20));
    }
  }
}