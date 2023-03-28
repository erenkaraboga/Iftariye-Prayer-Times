import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iftariye_v2/core/constants/asset_paths.dart';
import 'package:iftariye_v2/core/constants/base/app_text.dart';
import 'package:iftariye_v2/view/home/viewmodel/service/IHome.dart';
import 'package:iftariye_v2/view/home/viewmodel/service/data/stroage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:is_first_run/is_first_run.dart';

class HomeController extends GetxController {
  final IHomeService service;
  var countries = <String>[].obs;
  var towns = <String>[].obs;
  var responsee = "".obs;
  var message = "".obs;
  var backImageUrl = "".obs;
  var selectedValueCountry = "İl Seçiniz".obs;
  var selectedValueTown = " İlçe Seçiniz".obs;
  var datetimes = <int>[].obs;
  var countDate = <int>[].obs;
  var isloading=true.obs;
  var timeIndex = 0.obs;
  var timeName = "Kalan Süre".obs;
  var timeData = <String>[
    "          ",
    "          ",
    "          ",
    "          ",
    "          ",
    "          "
  ].obs;
  HomeController(this.service);

  @override
  void onInit() async {
    checkImageChange();
     isloading.value=true;
    bool firstRun = await IsFirstRun.isFirstRun();
    if (firstRun) {
      isloading.value=false;
      print("first run");
      await getCities();
    }

    listenConnection();
    super.onInit();
  }

  buildApp() async {
    isloading.value =true;
    if (await BasicPref().getString("country") != "none") {
      selectedValueCountry.value = await BasicPref().getString("country");
      selectedValueTown.value = await BasicPref().getString("town");
      await getTimes();
    }
       isloading.value =false;
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
    timeData.value = response;
    isloading.value=false;
    dateformatter(timeData);
    
  }

  saveValue() {
    BasicPref().setString("country", selectedValueCountry.value);
    BasicPref().setString("town", selectedValueTown.value);
    BasicPref().setString("times", responsee.value);
  }

  checkImageChange() {
    var time = DateTime.now().hour;
    if (time >= 4 && time < 12) {
      backImageUrl.value = AssetPaths.morning;
      message.value = AppTexts.morning;
    } else if (time >= 12 && time <= 17) {
      backImageUrl.value = AssetPaths.afternoon;
      message.value = AppTexts.afternoon;
    } else {
      backImageUrl.value = AssetPaths.evening;
      message.value = AppTexts.evening;
    }
  }

  listenConnection() {
    var listener = InternetConnectionChecker.createInstance(
            checkTimeout: const Duration(seconds: 2))
        .onStatusChange
        .listen((status) async {
      switch (status) {
        case InternetConnectionStatus.connected:
          Get.closeCurrentSnackbar();
          await buildApp();

          break;
        case InternetConnectionStatus.disconnected:
          showSnack();
          print('You are disconnected from the internet.');
          break;
      }
    });
  }

  dateformatter(List<String> times) {
    List<int> list = [];
    List<int> list2 = [];
    for (var element in times) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String date = formatter.format(DateTime.now());
      DateTime tempDate =
          DateFormat("yyyy-MM-dd HH:mm").parse("$date $element");
      print(tempDate);

      var diff = tempDate.difference(DateTime.now().toUtc()).inMilliseconds;
      list.add(diff);
      list2.add(diff);
    }
    datetimes.value = list;
    countDate.value = list2;
    findTime();
  }

  findTime() {
    countDate.value.removeWhere((element) => element < 0);
    countDate.value.sort();
    var current = countDate.value.first;
    countDate.value.remove(current);
    var timeName = datetimes.indexOf(current);

    timeIndex.value = timeName;
    bindName();
  }

  bindName() {
    if (timeIndex.value == 0) {
      timeName.value = "İmsak'a Kalan Süre";
    } else if (timeIndex.value == 1) {
      timeName.value = "Sabah'a Kalan Süre";
    } else if (timeIndex.value == 2) {
      timeName.value = "Öğlen'e Kalan Süre";
    } else if (timeIndex.value == 3) {
      timeName.value = "İkindi'ye Kalan Süre";
    } else if (timeIndex.value == 4) {
      timeName.value = "İftar'a Kalan Süre";
    } else if (timeIndex.value == 5) {
      timeName.value = "Yatsı'ya Kalan Süre";
    }
  }

  showSnack() {
    return Get.showSnackbar(
      const GetSnackBar(
          title: "İnternet Yok",
          message: 'İnternete Bağlanın',
          icon: Icon(Icons.refresh),
          duration: null),
    );
  }
}
