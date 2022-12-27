import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../view/home/homepage.dart';
dropCount(){
return  Positioned(
              bottom: 50,
              left: 40,
              right: 230,
              child: SizedBox(
                height: 50,
                width: 50,
                child: DropdownSearch<String>(
                  dropdownButtonProps: const DropdownButtonProps(
                    constraints: BoxConstraints(
                      maxHeight: 70,
                    ),
                    color: Colors.white,
                  ),
                  asyncItems: (String filter) async {
                    await homeController.getCities();
                    return homeController.countries.value;
                  },
                  popupProps: const PopupProps.dialog(
                      showSelectedItems: true, showSearchBox: false),
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    baseStyle: TextStyle(
                        color: Colors.white, overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.center,
                    dropdownSearchDecoration: InputDecoration(
                      enabled: false,
                      hintText: "İl Seçiniz",
                      hintStyle: TextStyle(color: Colors.white),
                      hoverColor: Colors.white,
                    ),
                  ),
                  onChanged: ((value) {
                    homeController.selectedValueCountry.value = value!;
                    homeController.selectedValueTown.value = " İlçe Seçiniz";
                  }),
                  selectedItem: homeController.selectedValueCountry.value,
                ),
              ),
            );

}
dropTown(){
  return Positioned(
              bottom: 50,
              left: 220,
              right: 40,
              child: SizedBox(
                height: 50,
                width: 50,
                child: DropdownSearch<String>(
                  dropdownButtonProps: const DropdownButtonProps(
                    constraints: BoxConstraints(
                      maxHeight: 70,
                    ),
                    color: Colors.white,
                  ),
                  asyncItems: (String filter) async {
                    await homeController.getTowns();
                    return homeController.towns.value;
                  },
                  popupProps: const PopupProps.dialog(showSelectedItems: true),
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    baseStyle: TextStyle(
                        color: Colors.white, overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.center,
                    dropdownSearchDecoration: InputDecoration(
                      enabled: false,
                      hintText: "İl Seçiniz",
                      hintStyle: TextStyle(color: Colors.white),
                      hoverColor: Colors.white,
                    ),
                  ),
                  onChanged: ((value) {
                    homeController.selectedValueTown.value = value!;
                    homeController.saveValue();
                    homeController.getTimes();
                  }),
                  selectedItem: homeController.selectedValueTown.value,
                ),
              ),
            );
}