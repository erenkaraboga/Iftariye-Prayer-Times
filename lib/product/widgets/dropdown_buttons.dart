import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/home/homepage.dart';

dropCount() {
  return SizedBox(
    height: Get.height / 7.81,
    width: Get.width / 2.30909090909,
    child: DropdownSearch<String>(
      dropdownButtonProps: DropdownButtonProps(
        constraints: BoxConstraints(
          maxHeight: Get.height / 13.0166666667,
        ),
        color: Colors.black,
      ),
      asyncItems: (String filter) async {
        await homeController.getCities();
        return homeController.countries.value;
      },
      popupProps: PopupProps.menu(
        showSelectedItems: true,
        showSearchBox: false,
        itemBuilder: (context, item, isSelected) => Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            item.toString(),
            style: const TextStyle(
                color: Colors.black, fontSize: 15, fontFamily: "Schyler"),
          ),
        ),
      ),
      dropdownDecoratorProps: const DropDownDecoratorProps(
        baseStyle: TextStyle(
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
            fontFamily: "Schyler"),
        textAlign: TextAlign.center,
        dropdownSearchDecoration: InputDecoration(
          enabled: false,
          hintText: "İl Seçiniz",
          hintStyle: TextStyle(color: Colors.black, fontFamily: "Schyler"),
          hoverColor: Colors.black,
        ),
      ),
      onChanged: ((value) {
        homeController.selectedValueCountry.value = value!;
        homeController.selectedValueTown.value = " İlçe Seçiniz";
      }),
      selectedItem: homeController.selectedValueCountry.value,
    ),
  );
}

dropTown(BuildContext context) {
  return SizedBox(
    height: Get.height / 7.81,
    width: Get.width / 2.30909090909,
    child: DropdownSearch<String>(
      dropdownButtonProps: DropdownButtonProps(
        constraints: BoxConstraints(
          maxHeight: Get.height / 13.0166666667,
        ),
        color: Colors.black,
      ),
      asyncItems: (String filter) async {
        await homeController.getTowns();
        return homeController.towns.value;
      },
      popupProps: PopupProps.menu(
        itemBuilder: (context, item, isSelected) => Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            item.toString(),
            style: const TextStyle(
                color: Colors.black, fontSize: 15, fontFamily: "Schyler"),
          ),
        ),
      ),
      dropdownDecoratorProps: const DropDownDecoratorProps(
        baseStyle: TextStyle(
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
            fontFamily: "Schyler"),
        textAlign: TextAlign.center,
        dropdownSearchDecoration: InputDecoration(
          enabled: false,
          hintText: "İl Seçiniz",
          hintStyle: TextStyle(color: Colors.black, fontFamily: "Schyler"),
          hoverColor: Colors.black,
        ),
      ),
      onChanged: ((value) {
        homeController.selectedValueTown.value = value!;
        homeController.saveValue();
        homeController.getTimes();
        Navigator.pop(context);
      }),
      selectedItem: homeController.selectedValueTown.value,
    ),
  );
}
