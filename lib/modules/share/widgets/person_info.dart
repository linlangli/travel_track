import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PersonInfoWidget extends StatelessWidget {
  // final String name;
  // final String imageUrl;

  const PersonInfoWidget({
    super.key,
    // required this.name,
    // required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Image.network(''),
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .colorScheme
                .onSecondary,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        SizedBox(width: 16,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('李林浪', style: Theme.of(context).textTheme.bodyLarge,),
                  SizedBox(width: 4,),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 2.0),
                    decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text('Lv.1',
                      style: Theme.of(context).textTheme.bodySmall,),
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    'assets/images/icons/card_icon.svg', width: 32, height: 32,),
                ],
              ),
              SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('UUID: 202312', style: Theme.of(context).textTheme.labelSmall,),
                  SizedBox(width: 8,),
                  Text('IP属地: 深圳', style: Theme.of(context).textTheme.labelSmall,),
                ],
              ),
              SizedBox(height: 4,),
              Row(
                children: [
                  Text('旅程: 12',
                    style: Theme.of(context).textTheme.bodySmall,),
                  SizedBox(width: 12,),
                  Text('点赞: 12',
                    style: Theme.of(context).textTheme.bodySmall,),
                  SizedBox(width: 12,),
                  Text('好友: 12',
                    style: Theme.of(context).textTheme.bodySmall,),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}