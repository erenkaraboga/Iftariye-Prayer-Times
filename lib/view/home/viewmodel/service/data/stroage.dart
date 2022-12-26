import 'package:shared_preferences/shared_preferences.dart';
 
class BasicPref {
  Future<void> setInt(String key, int value) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(key, value);
  }
 
  Future<void> setString(String key, String value) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }
 
  Future<void> setBool(String key, bool value) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(key, value);
  }
 
  Future<int> getInt(String key) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }
 
  Future<String> getString(String key) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? 'none';
  }
 
  Future<bool> getBool(String key) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }
}