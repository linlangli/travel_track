import 'package:get/get.dart';

import 'controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController(), fenix: true);
  }
}