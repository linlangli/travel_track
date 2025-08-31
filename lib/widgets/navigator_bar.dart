import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:travel_track/enums/navigator_bar.dart';
import 'package:travel_track/extensions/widget.dart';

class NavigatorBar extends StatefulWidget {
  final NavigatorTab currentTab;
  final ValueChanged<NavigatorTab> onTabChanged;

  const NavigatorBar({
    super.key,
    required this.currentTab,
    required this.onTabChanged,
  });

  @override
  NavigatorWidgetState createState() => NavigatorWidgetState();
}

class NavigatorWidgetState extends State<NavigatorBar> {
  late NavigatorTab selectedTab;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedTab = widget.currentTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Column(
        children: [
          SvgPicture.asset(
            selectedTab == NavigatorTab.home
                ? 'assets/images/icons/navigator_home_active.svg'
                : 'assets/images/icons/navigator_home.svg',
            width: 28,
            height: 28,
          ),
          Text('首页', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ).button(
        onTap: () {
          setState(() {
            // selectedTab = NavigatorTab.home;
            selectedTab = NavigatorTab.travelInfoPage;
          });
          widget.onTabChanged(selectedTab);
        },
      ),
      Column(
        children: [
          SvgPicture.asset(
            selectedTab == NavigatorTab.discover
                ? 'assets/images/icons/navigator_discover_active.svg'
                : 'assets/images/icons/navigator_discoversvg.svg',
            width: 28,
            height: 28,
          ),
          Text('探索', style: Theme.of(context).textTheme.headlineSmall)
        ],
      ).button(
        onTap: () {
          setState(() {
            selectedTab = NavigatorTab.discover;
          });
          widget.onTabChanged(selectedTab);
        },
      ),
      Column(
        children: [
          SvgPicture.asset(
            selectedTab == NavigatorTab.community
                ? 'assets/images/icons/navigator_community_active.svg'
                : 'assets/images/icons/navigator_community.svg',
            width: 32,
            height: 32,
          ),
          Text('社区', style: Theme.of(context).textTheme.headlineSmall)
        ],
      ).button(type: ButtonType.image,
        onTap: () {
          setState(() {
            selectedTab = NavigatorTab.community;
          });
          widget.onTabChanged(selectedTab);
        },
      ),
      Column(
        children: [
          SvgPicture.asset(
            selectedTab == NavigatorTab.mine
                ? 'assets/images/icons/navigator_mine_active.svg'
                : 'assets/images/icons/navigator_mine.svg',
            width: 28,
            height: 28,
          ),
          Text('我的', style: Theme.of(context).textTheme.headlineSmall)
        ],
      ).button(type: ButtonType.image,
        onTap: () {
          setState(() {
            selectedTab = NavigatorTab.mine;
          });
          widget.onTabChanged(selectedTab);
        },
      )
    ]).marginOnly(bottom: Platform.isAndroid ? 12 : 0);
  }
}
