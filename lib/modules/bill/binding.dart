import 'package:get/get.dart';
import 'package:travel_track/modules/bill/controller.dart';

class BillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BillController(), fenix: true);
  }
}