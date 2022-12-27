// Place sınıfı
class Place {
  final String ?country;
  final String ?countryCode;
  final String ?city;
  final String ?region;
  final double ?latitude;
  final double ?longitude;

  Place({
    this.country,
    this.countryCode,
    this.city,
    this.region,
    this.latitude,
    this.longitude,
  });
}

// Times sınıfı
class Times {
  final Map<String, List<String>>? dates;

  Times({
    this.dates,
  });
}

// Data sınıfı
class Data {
  final Place? place;
  final Times? times;

  Data({
    this.place,
    this.times,
  });
}