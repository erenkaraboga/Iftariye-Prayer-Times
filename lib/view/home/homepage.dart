import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iftariye_v2/view/home/viewmodel/controllers/homecontroller.dart';

import '../../product/widgets/dropdown_buttons.dart';
import '../../product/widgets/prayer_time.dart';
import '../utility/clip_path.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final homeController = Get.find<HomeController>();
final TextEditingController searchController = TextEditingController();

//392.72727272727275
//781.0909090909091
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Obx(() => Stack(
              clipBehavior: Clip.none,
              children: [
                topBackroundImage(),
                prayerBoard(),
                message(),
                dropCount(),
                dropTown(),
              ],
            )),
      ],
    ));
  }

  Obx message() {
    return Obx(() => Positioned(
          bottom: 100,
          left: 100,
          right: 100,
          child: Text(
            textAlign: TextAlign.center,
            homeController.message.value,
            style: const TextStyle(
              fontFamily: 'Schyler',
              fontSize: 26,
              color: Color(0xffffffff),
              fontWeight: FontWeight.bold,
            ),
            softWrap: false,
          ),
        ));
  }

  topBackroundImage() {
    return ClipPath(
        clipper: RoundedClipper(),
        child: Image.asset(homeController.backImageUrl.value));
  }

  Obx prayerBoard() {
    return Obx(() => Positioned(
          top: Get.width * 0.95,
          left: Get.width / 18.95,
          right: Get.width / 18.95,
          child: SizedBox(
            width: Get.width * 1.30,
            height: Get.width * 1.73,
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.white,
                elevation: 30,
                child: times()),
          ),
        ));
  }
}