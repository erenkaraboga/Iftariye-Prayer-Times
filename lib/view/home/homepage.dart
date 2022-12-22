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
          () => Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton2(
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
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  value: homeController.selectedValueCountry.value ==""?null:homeController.selectedValueCountry.value,
                  
                  onChanged: (valuee) {
                    homeController.selectedValueCountry.value =
                        valuee as String;
                    homeController
                        .getTowns(homeController.selectedValueCountry.value);
                  },
                  buttonHeight: 40,
                  buttonWidth: 150,
                  itemHeight: 40,
                  dropdownMaxHeight: 200,
                  searchController: searchController,
                  searchInnerWidget: Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Search for an item...',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                  //This to clear the search value when you close the menu
                  onMenuStateChange: (isOpen) {
                    if (!isOpen) {
                      searchController.clear();
                    }
                  },
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
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
                  value: homeController.selectedValueTown.value ==""?null:homeController.selectedValueTown.value,
                  onChanged: (value) {
                    homeController.selectedValueTown.value = value as String;
                  },
                  buttonHeight: 40,
                  buttonWidth: 140,
                  itemHeight: 40,
                ),
              ),
            ],
          ),
        ));
  }
}
