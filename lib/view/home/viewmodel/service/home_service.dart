import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:iftariye_v2/core/constants/text.dart';

import 'IHome.dart';

class HomeService extends IHomeService {
  var dio = Dio();
  @override
  Future<List<String>> getCities() async {
    var response = await dio.get(AppConstants.countryUrl);
    var jsonString = json.encode(response.data);
    var newData = List<String>.from(json.decode(jsonString));
    return newData;
  }
  
  @override
  Future<List<String>> getTowns(String country)async {
    var response = await dio.get(AppConstants.getTownUrl(country));
    var jsonString = json.encode(response.data);
    var newData = List<String>.from(json.decode(jsonString));
    return newData;
  }
}
