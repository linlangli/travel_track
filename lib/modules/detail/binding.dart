import 'package:get/get.dart';

import 'controller.dart';

class TravelDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TravelDetailController());
  }
}