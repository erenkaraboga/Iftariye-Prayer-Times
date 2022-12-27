import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iftariye_v2/view/home/homepage.dart';

import '../../core/styles/text_styles.dart';

times() {
  return Column(
    children: [
      const Spacer(
        flex: 1,
      ),
      body(
        "İmsak",
        homeController.timeData.value[0],
      ),
      const Spacer(
        flex: 1,
      ),
      body(
        "Sabah",
        homeController.timeData.value[1],
      ),
      const Spacer(
        flex: 1,
      ),
      body(
        "Öğle",
        homeController.timeData.value[2],
      ),
      const Spacer(
        flex: 1,
      ),
      body(
        "İkindi",
        homeController.timeData.value[3],
      ),
      const Spacer(
        flex: 1,
      ),
      body(
        "Akşam",
        homeController.timeData.value[4],
      ),
      const Spacer(
        flex: 1,
      ),
      body(
        "Yatsı",
        homeController.timeData.value[5],
      ),
      const Spacer(
        flex: 30,
      ),
    ],
  );
}

body(String name, String time) {
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: SizedBox(
                width: Get.width / 6.5,
                height: Get.height / 52,
                child: Text(name, style: TextStlyes().prayerName())),
          ),
          Padding(
            padding: EdgeInsets.only(left: Get.width / 3.26),
            child: Text(
              time,
              style: TextStlyes().prayerName(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: Get.width / 19.6),
            child: const Icon(Icons.sunny),
          ),
        ],
      ),
      const Divider(
        thickness: 1,
        height: 5,
        indent: 20,
        endIndent: 20,
      ),
    ],
  );
}
