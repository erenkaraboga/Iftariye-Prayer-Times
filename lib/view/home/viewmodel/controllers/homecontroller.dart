import 'package:get/get.dart';
import 'package:iftariye_v2/view/home/viewmodel/service/IHome.dart';

class HomeController extends GetxController {
  final IHomeService service;
  var countries = <String>[].obs;
  var towns= <String>[].obs;
  
  var selectedValueCountry = "".obs;
  var selectedValueTown = "".obs;
  HomeController(this.service);

  @override
  void onInit() async {
    await getCities();
    super.onInit();
  }

  getCities() async {
    var list = await service.getCities();
    countries.value = list;
  }

  getTowns(String country) async {
    var list = await service.getTowns(country);
    towns.value=list;
  }
}
