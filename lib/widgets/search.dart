import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: '请输入内容',
        hintStyle: Theme.of(context).textTheme.labelMedium,
        contentPadding:
        EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0), // 圆角半径
          borderSide: BorderSide(
            color: Colors.grey, // 边框颜色
            width: 1.0, // 边框宽度
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color:
            Theme.of(context).colorScheme.primary, // 聚焦时的边框颜色
            width: 2.0,
          ),
        ),
      ),
    );
  }

}