import 'package:iftariye_v2/core/constants/asset_paths.dart';

 iconmap(String index) {
  
  Map<String, String> list= {
    "İmsak:": AssetPaths.imsak,
    "Akşam": AssetPaths.aksam,
    "Güneş": AssetPaths.gunes,
    "İkindi": AssetPaths.ikindi,
    "Öğle": AssetPaths.ogle,
    'Yatsı':AssetPaths.yatsi
  };
    return list[index];
}
