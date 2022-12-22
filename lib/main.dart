import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iftariye_v2/view/home/viewmodel/bindings/homeBinding.dart';

import 'view/home/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    initialRoute: "/home",
      getPages: [
        GetPage(
          name: "/home",
          page: () => const HomePage(),
          binding: HomeBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 600),
        ),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
