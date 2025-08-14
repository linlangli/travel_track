import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travel_track/modules/detail/controller.dart';
import 'package:travel_track/modules/share/widgets/travel_info.dart';
import 'package:travel_track/widgets/page.dart';

class TravelDetailPage extends GetView<TravelDetailController> {
  const TravelDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidget(child: TravelInfoWidget());
  }

}