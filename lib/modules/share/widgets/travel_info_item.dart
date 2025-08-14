import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TravelInfoItem extends StatelessWidget {
  final String type;
  final String title;
  final String date;
  final int people;
  final double money;
  final int looks;
  final int collects;

  const TravelInfoItem({
    super.key,
    required this.type,
    required this.title,
    required this.date,
    required this.people,
    required this.money,
    required this.looks,
    required this.collects,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/list/location_icon.svg',
                width: 16,
                height: 16,
              ),
              SizedBox(width: 8,),
              Text('广东之旅', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              SvgPicture.asset(
                'assets/images/list/location_icon.svg',
                width: 16,
                height: 16,
              ),
              SizedBox(
                width: 4,
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  '深圳',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  '广州',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              SvgPicture.asset(
                'assets/images/list/people_icon.svg',
                width: 16,
                height: 16,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '16',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                width: 12,
              ),
              SvgPicture.asset(
                'assets/images/list/wallet_icon.svg',
                width: 16,
                height: 16,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '24444',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                width: 12,
              ),
              SvgPicture.asset(
                'assets/images/common/clock_icon.svg',
                width: 16,
                height: 16,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '2025/12/04 12d',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/list/tag_icon.svg',
                width: 20,
                height: 20,
              ),
              SizedBox(
                width: 4,
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(150, 232, 186, 0.8),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Text(
                  type,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          )
        ],
      ),
      Positioned(
        right: 8,
        top: -4,
        child: SvgPicture.asset(
          'assets/images/list/planing_icon.svg',
          width: 16,
          height: 16,
        ),
      ),
      Positioned(
        bottom: 0,
        right: 8,
        child: Column(
          children: [
            Text(
              '16喜欢',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(
              '16收藏',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      )
    ]);
  }
}
