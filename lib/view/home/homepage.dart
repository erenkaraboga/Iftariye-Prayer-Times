import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iftariye_v2/view/home/viewmodel/controllers/homecontroller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final homeController = Get.find<HomeController>();
final TextEditingController searchController = TextEditingController();

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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    buttonPadding: const EdgeInsets.all(20),
                    buttonDecoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 1.5),
                        borderRadius: BorderRadius.circular(15)),
                    isExpanded: false,
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: homeController.countries.value
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ))
                        .toList(),
                    value: homeController.selectedValueCountry.value,
                    onChanged: (valuee) {
                      homeController.selectedValueTown.value = "Seçiniz";
                      homeController.selectedValueCountry.value =
                          valuee as String;
                      homeController
                          .getTowns(homeController.selectedValueCountry.value);
                    },
                    buttonHeight: 60,
                    buttonWidth: 180,
                    itemHeight: 60,
                    dropdownDirection: DropdownDirection.left,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    dropdownMaxHeight: 300,
                    searchController: searchController,
                    searchInnerWidget: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 4,
                        right: 8,
                        left: 8,
                      ),
                      child: searchCountry(),
                    ),
                    searchMatchFn: (item, searchValue) {
                      return (item.value.toString().contains(searchValue));
                    },
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        searchController.clear();
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    buttonPadding: const EdgeInsets.all(20),
                    buttonDecoration: BoxDecoration(
                        border: Border.all(
                            width: 1.5,
                            color: Colors.green,
                            strokeAlign: StrokeAlign.center),
                        borderRadius: BorderRadius.circular(15)),
                    hint: Text(
                      'İlçe Seçiniz',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: homeController.towns.value
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: homeController.selectedValueTown.value,
                    onChanged: (value) {
                      homeController.selectedValueTown.value = value as String;
                    },
                    dropdownDirection: DropdownDirection.textDirection,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    dropdownMaxHeight: 300,
                    buttonHeight: 60,
                    buttonWidth: 180,
                    itemHeight: 60,
                  ),
                ),
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
