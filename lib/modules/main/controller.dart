import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_track/enums/navigator_bar.dart';
import 'package:travel_track/enums/page_state.dart';

import 'enums/mine_tab.dart';

class MainController extends GetxController {
  NavigatorTab selectedTab = NavigatorTab.home;
  PageState pageState = PageState.normal;

  void changeTab(NavigatorTab tab) {
    selectedTab = tab;
    update();
  }

  void setPageState(PageState state) {
    pageState = state;
    update();
  }

  MineTab mineTab = MineTab.posts;
  bool searchVisible = false;

  final posts = [
    {
      'icon': Icons.emoji_emotions,
      'title': '雨崩之行',
      'date': '2024-12-04',
      'people': 12,
      'likes': 134,
      'viewed': 132,
      'collected': 132,
    },
    {
      'icon': Icons.emoji_emotions,
      'title': '勇闯哈沐溪',
      'date': '2024-12-04',
      'people': 12,
      'likes': 134,
      'viewed': 132,
      'collected': 132,
    },
    {
      'icon': Icons.assignment,
      'title': '徒步香格里拉',
      'date': '2024-12-04',
      'people': 12,
      'likes': 134,
      'viewed': 132,
      'collected': 132,
    },
  ];

  void switchMineTab(MineTab tab) {
    mineTab = tab;
    update();
  }

  void setSearchVisible(bool visible) {
    searchVisible = visible;
    update();
  }
}