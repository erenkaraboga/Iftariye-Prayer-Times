class PrayerModel {
  Place? place;
  Times? times;

  PrayerModel({this.place, this.times});

  PrayerModel.fromJson(Map<String, dynamic> json) {
    place = json['place'] != null ? new Place.fromJson(json['place']) : null;
    times = json['times'] != null ? new Times.fromJson(json['times']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.place != null) {
      data['place'] = this.place!.toJson();
    }
    if (this.times != null) {
      data['times'] = this.times!.toJson();
    }
    return data;
  }
}

class Place {
  String? country;
  String? countryCode;
  String? city;
  String? region;
  double? latitude;
  double? longitude;

  Place(
      {this.country,
      this.countryCode,
      this.city,
      this.region,
      this.latitude,
      this.longitude});

  Place.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    countryCode = json['countryCode'];
    city = json['city'];
    region = json['region'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['countryCode'] = this.countryCode;
    data['city'] = this.city;
    data['region'] = this.region;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Times {
  List<String>? l20221225;

  Times({this.l20221225});

  Times.fromJson(Map<String, dynamic> json) {
    l20221225 = json['2022-12-25'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['2022-12-25'] = this.l20221225;
    return data;
  }
}