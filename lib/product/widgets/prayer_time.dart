import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iftariye_v2/core/constants/asset_paths.dart';
import 'package:iftariye_v2/view/home/homepage.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../core/styles/text_styles.dart';

times() {
  return Column(
    children: [
      const Spacer(
        flex: 2,
      ),
      homeController.datetimes.isEmpty
          ? const SizedBox(
              height: 0,
              width: 0,
            )
          : Column(
              children: [
                Text(
                  homeController.timeName.value,
                  style: const TextStyle(
                      fontSize: 15, color: Colors.black, fontFamily: "Schyler"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(() => SlideCountdownSeparated(
                      onDone: () {
                        homeController.findTime();
                      },
                      decoration: BoxDecoration(
                          color: Colors.black.withAlpha(20),
                          borderRadius: BorderRadius.circular(10)),
                      textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: "Schyler"),
                      height: 40,
                      width: 40,
                      duration: Duration(
                          milliseconds: homeController
                              .datetimes.value[homeController.timeIndex.value]),
                    )),
              ],
            ),
      const Spacer(
        flex: 2,
      ),
      homeController.timeIndex.value == 0
          ? body("İmsak", homeController.timeData.value[0], AssetPaths.imsak,
              Colors.green)
          : body("İmsak", homeController.timeData.value[0], AssetPaths.imsak,
              Colors.black45),
      const Spacer(
        flex: 1,
      ),
      homeController.timeIndex.value == 1
          ? body("Sabah", homeController.timeData.value[1], AssetPaths.imsak,
              Colors.green)
          : body("Sabah", homeController.timeData.value[1], AssetPaths.imsak,
              Colors.black45),
      const Spacer(
        flex: 1,
      ),
      homeController.timeIndex.value == 2
          ? body("Öğle", homeController.timeData.value[2], AssetPaths.imsak,
              Colors.green)
          : body("Öğle", homeController.timeData.value[2], AssetPaths.imsak,
              Colors.black45),
      const Spacer(
        flex: 1,
      ),
      homeController.timeIndex.value == 3
          ? body("İkindi", homeController.timeData.value[3], AssetPaths.imsak,
              Colors.green)
          : body("İkindi", homeController.timeData.value[3], AssetPaths.imsak,
              Colors.black45),
      const Spacer(
        flex: 1,
      ),
      homeController.timeIndex.value == 4
          ? body("Akşam", homeController.timeData.value[4], AssetPaths.imsak,
              Colors.green)
          : body("Akşam", homeController.timeData.value[4], AssetPaths.imsak,
              Colors.black45),
      const Spacer(
        flex: 1,
      ),
      homeController.timeIndex .value== 5
          ? body("Yatsı", homeController.timeData.value[5], AssetPaths.imsak,
              Colors.green)
          : body("Yatsı", homeController.timeData.value[5], AssetPaths.imsak,
              Colors.black45),
      const Spacer(
        flex: 30,
      ),
    ],
  );
}

body(String name, String time, String imagePath, Color color) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(Get.width / 11, 0, Get.width / 20, 0.0),
        child: Row(
          children: [
            SizedBox(
                width: Get.width / 5.57,
                child: Text(name, style: TextStlyes().prayerName(color))),
            const Spacer(
              flex: 10,
            ),
            Text(
              time,
              style: TextStlyes().prayerName(color),
            ),
            const Spacer(
              flex: 4,
            ),
            SvgPicture.asset(
              imagePath,
              height: Get.width / 19.5,
              width: Get.width / 19.5,
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
      Divider(
        thickness: 1,
        height: 15,
        indent: Get.width / 19.5,
        endIndent: Get.width / 19.5,
      ),
    ],
  );
}
