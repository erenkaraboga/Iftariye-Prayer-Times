import 'dart:convert';

class CountryResponseModel{
List<String> responseModelFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));
String responseModelToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
}