import 'package:get/get.dart';
import 'package:iftariye_v2/view/home/viewmodel/controllers/homecontroller.dart';
import 'package:iftariye_v2/view/home/viewmodel/service/home_service.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(HomeService()));
  }
}
