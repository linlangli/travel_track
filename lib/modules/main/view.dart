import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_track/enums/navigator_bar.dart';
import 'package:travel_track/enums/page_state.dart';
import 'package:travel_track/modules/main/widgets/community.dart';
import 'package:travel_track/modules/main/widgets/discover.dart';
import 'package:travel_track/modules/main/widgets/mine.dart';
import 'package:travel_track/modules/share/widgets/travel_info.dart';
import 'package:travel_track/widgets/navigator_bar.dart';
import 'package:travel_track/widgets/page.dart';
import 'package:travel_track/widgets/state.dart';
import 'package:travel_track/widgets/title_bar.dart';
import 'controller.dart';

class MainPage extends GetView<MainController> {
  MainPage({super.key});

  final Map<NavigatorTab, Widget> _pages = {
    NavigatorTab.home: TravelInfoWidget(),
    NavigatorTab.discover: DiscoverWidget(),
    NavigatorTab.community: CommunityWidget(),
    NavigatorTab.mine: MineWidget(),
  };

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: TitleBar(
        onSetting: () {
          controller.setPageState(PageState.empty);
        },
        onMessage: () {
          controller.setPageState(PageState.error);
        },
      ),
      navigation: NavigatorBar(
        currentTab: NavigatorTab.travelInfoPage,
        onTabChanged: (selectedTab) {
          controller.changeTab(selectedTab);
        },
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Expanded(
        child: GetBuilder<MainController>(
          builder: (controller) {
            if (controller.pageState == PageState.empty) {
              return StateWidget(
                image: 'assets/images/common/state_empty.svg',
                onTap: () {
                  controller.setPageState(PageState.normal);
                },
                text: 'retry'.tr,
              );
            } else if (controller.pageState == PageState.error) {
              return StateWidget(
                image: 'assets/images/common/state_error.svg',
                onTap: () {
                  controller.setPageState(PageState.normal);
                },
                text: 'retry'.tr,
              );
            } else if (controller.pageState == PageState.loading) {
              return Center(child: CircularProgressIndicator());
            }
            return _pages[controller.selectedTab] ?? MineWidget();
          },
        ),
      ),
    );
  }
}
