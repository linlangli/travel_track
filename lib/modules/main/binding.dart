import 'package:get/get.dart';
import 'package:travel_track/modules/main/controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(), fenix: true);
  }
}