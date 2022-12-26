import 'package:get/get.dart';
import 'package:iftariye_v2/view/home/viewmodel/service/IHome.dart';
import 'package:iftariye_v2/view/home/viewmodel/service/data/stroage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeController extends GetxController {
  final IHomeService service;
  var countries = <String>[].obs;
  var towns = <String>[].obs;
  var responsee = "".obs;
  var selectedValueCountry = "İl Seçiniz".obs;
  var selectedValueTown = " İlçe Seçiniz".obs;
  HomeController(this.service);

  @override
  void onInit() async {
    if (await checkConnection()) {
      if (await BasicPref().getString("country") != "none") {
        selectedValueCountry.value = await BasicPref().getString("country");
        selectedValueTown.value = await BasicPref().getString("town");
        await getTimes();
      }
    }
    else{
      
    }

    super.onInit();
  }

  getCities() async {
    var list = await service.getCities();
    countries.value = list;
  }

  getTowns() async {
    var list = await service.getTowns(selectedValueCountry.value);
    towns.value = list;
  }

  getTimes() async {
    var response = await service.getTimes(
        selectedValueCountry.value, selectedValueTown.value);
    responsee.value = response;
    print("times requested");
  }

  saveValue() {
    BasicPref().setString("country", selectedValueCountry.value);
    BasicPref().setString("town", selectedValueTown.value);
    BasicPref().setString("times", responsee.value);
  }

  checkConnection() async {
    bool result = await InternetConnectionChecker.createInstance(
            checkTimeout: const Duration(seconds: 7))
        .hasConnection;
    if (result == true) {
      print('YAY! Free cute dog pics!');
    } else {
      print('No internet :( Reason:');
    }
  }
}
