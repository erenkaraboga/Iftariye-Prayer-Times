import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iftariye_v2/product/widgets/dropdown_buttons.dart';
import 'package:iftariye_v2/view/home/viewmodel/controllers/homecontroller.dart';

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
                Positioned(
                  left: 130,
                  right: 130,
                  bottom: 60,
                  child: SizedBox(
                    width: 100,
                    height: 25,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60.withOpacity(0.3)),
                      onPressed: () {
                        showModalBottomSheet(
                            constraints: const BoxConstraints(maxWidth: 400),
                            isDismissible: true,
                            elevation: 20,
                            barrierColor: Colors.black.withOpacity(0.5),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                width: Get.width / 1.15,
                                height: Get.height / 10.4133333333,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [dropCount(), dropTown(context)],
                                ),
                              );
                            });
                      },
                      icon: const Icon(
                        size: 12,
                        Icons.location_on,
                      ),
                      label: const Text(
                        "Adres Seç",
                        style: TextStyle(
                            fontSize: 11,
                            fontFamily: "Schyler",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ],
    ));
  }

  Obx message() {
    return Obx(() => Positioned(
          bottom: Get.width / 3.50,
          left: Get.width / 10,
          right: Get.width / 10,
          child: Text(
            textAlign: TextAlign.center,
            homeController.message.value,
            style: const TextStyle(
              fontFamily: 'Schyler',
              fontSize: 30,
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

  prayerBoard() {
    return Positioned(
      top: Get.width * 0.95,
      left: Get.width / 18.95,
      right: Get.width / 18.95,
      child: Column(
        children: [
          SizedBox(
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
        ],
      ),
    );
  }
}
