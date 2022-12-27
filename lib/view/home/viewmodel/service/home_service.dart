import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:iftariye_v2/core/constants/serive_url.dart';
import 'package:intl/intl.dart';

import '../../../model/CountryResponseModel.dart';
import 'IHome.dart';

class HomeService extends IHomeService {
  var dio = Dio();
  @override
  Future<List<String>> getCities() async {
    var response = await dio.get(ServiceUrl.countryUrl);
    var jsonString = json.encode(response.data);
    var newData = List<String>.from(json.decode(jsonString));
    return newData;
  }

  @override
  Future<List<String>> getTowns(String country) async {
    var response = await dio.get(ServiceUrl.getTownUrl(country));
    var jsonString = json.encode(response.data);
    var newData = List<String>.from(json.decode(jsonString));
    return newData;
  }

  @override
  getTimes(String country, String town) async {
    var response = await dio.get(ServiceUrl.getTimes(country, town));
     Map<String, dynamic> jsonMap = jsonDecode(response.toString());
    Map<String, dynamic> timesData = jsonMap['times'];
    Times times = Times(
      dates: Map.from(timesData)
          .map((date, times) => MapEntry(date, List.from(times))),
    );
    var now =  DateTime.now();
    var formatter =  DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return times.dates![formattedDate]!;
  }
}
