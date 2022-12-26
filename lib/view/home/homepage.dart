import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iftariye_v2/view/home/viewmodel/controllers/homecontroller.dart';
import 'package:iftariye_v2/view/home/viewmodel/service/data/stroage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final homeController = Get.find<HomeController>();
final TextEditingController searchController = TextEditingController();
final List<String> itemss = ['Seçiniz', 'Seçmeyiniz'];
String dropdownvalue = "Seçiniz";

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("İftariye"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                DropdownSearch<String>(
                  asyncItems: (String filter) async {
                    await homeController.getCities();
                    return homeController.countries.value;
                  },
                  popupProps: const PopupProps.menu(
                      showSelectedItems: true, showSearchBox: true),
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "İl Seçiniz",
                    ),
                  ),
                  onChanged: ((value) {
                    homeController.selectedValueCountry.value=value!;
                    homeController.selectedValueTown.value=" İlçe Seçiniz";
                  }),
                  selectedItem: homeController.selectedValueCountry.value,
                ),
                  DropdownSearch<String>(
                  asyncItems: (String filter) async {
                    await homeController.getTowns();
                    return homeController.towns.value;
                  },
                  popupProps: const PopupProps.menu(
                      showSelectedItems: true, showSearchBox: true),
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "İlçe Seçiniz",
                    ),
                  ),
                  onChanged: ((value) {
                    homeController.selectedValueTown.value=value!;
                    homeController.saveValue();
                    homeController.getTimes();
                  }),
                  selectedItem: homeController.selectedValueTown.value,
                ),
                Text(homeController.responsee.value.toString())
              ],
            ),
          ),
        ));
  }

  TextFormField searchCountry() {
    return TextFormField(
      controller: searchController,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        hintText: "İl Ara",
        hintStyle: const TextStyle(fontSize: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
