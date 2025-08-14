import 'package:get/get.dart';
import 'package:travel_track/modules/detail/binding.dart';
import 'package:travel_track/modules/detail/view.dart';
import 'package:travel_track/modules/login/binding.dart';
import 'package:travel_track/modules/login/view.dart';
import 'package:travel_track/modules/main/binding.dart';
import 'package:travel_track/modules/main/view.dart';

class AppRoute {
  static const loginPage = '/login_page';
  static const mainPage = '/main_page';
  static const travelDetailPage = '/travel_detail_page';

  static final routers = [
    GetPage(
      name: loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: mainPage,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
        name: travelDetailPage,
        page: () => const TravelDetailPage(),
        binding: TravelDetailBinding()
    ),
  ];
}
