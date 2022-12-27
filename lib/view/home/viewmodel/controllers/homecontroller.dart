import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iftariye_v2/core/constants/asset_paths.dart';
import 'package:iftariye_v2/view/home/viewmodel/service/IHome.dart';
import 'package:iftariye_v2/view/home/viewmodel/service/data/stroage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
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
   bool firstRun = await IsFirstRun.isFirstRun();
   if(firstRun){
    print("first run");
    await getCities();
   }
    checkImageChange();
    listenConnection();
    super.onInit();
  }

  buildApp() async {
    if (await BasicPref().getString("country") != "none") {
      selectedValueCountry.value = await BasicPref().getString("country");
      selectedValueTown.value = await BasicPref().getString("town");
      await getTimes();
    }
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
    inspect(timeData.value);
  }

  saveValue() {
    BasicPref().setString("country", selectedValueCountry.value);
    BasicPref().setString("town", selectedValueTown.value);
    BasicPref().setString("times", responsee.value);
  }

  checkImageChange() {
    print(DateTime.now());
    var time = DateTime.now().hour;
    if (time >= 4 && time <= 12) {
      backImageUrl.value = AssetPaths.morning;
      message.value = "Hayırlı Sabahlar";
    } else if (time >= 12 && time <= 17) {
      backImageUrl.value = AssetPaths.afternoon;
      message.value = "Hayırlı Öğlenler";
    } else {
      backImageUrl.value = AssetPaths.evening;
      message.value = "Hayırlı Geceler";
    }
  }

  listenConnection() {
    var listener = InternetConnectionChecker.createInstance(
            checkTimeout: const Duration(seconds: 2))
        .onStatusChange
        .listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          Get.closeCurrentSnackbar();
          buildApp();
          break;
        case InternetConnectionStatus.disconnected:
          showSnack();
          print('You are disconnected from the internet.');
          break;
      }
    });
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
