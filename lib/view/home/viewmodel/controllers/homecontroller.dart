import 'package:get/get.dart';
import 'package:iftariye_v2/view/home/viewmodel/service/IHome.dart';

class HomeController extends GetxController {
  final IHomeService service;
  var countries = <String>[].obs;
  var towns= <String>[].obs;
  
  var selectedValueCountry = "Seçiniz".obs;
  var selectedValueTown = "Seçiniz".obs;
  HomeController(this.service);

  @override
  void onInit() async {
    await getCities();
    super.onInit();
  }

  getCities() async {
    var list = await service.getCities();
    list.add("Seçiniz");
    countries.value = list;
  }

  getTowns(String country) async {
    var list = await service.getTowns(country);
    list.add("Seçiniz");
    towns.value=list;
  }
}
