class AppConstants {
  static const countryUrl =
      "https://iftariyeapi.vercel.app/api/regions?country=Turkey";
 
  static String getTownUrl(String country){
   return "https://iftariyeapi.vercel.app/api/cities?country=Turkey&region=$country";
  }    
  static String getTimes(String country ,String town){
    return "https://iftariyeapi.vercel.app/api/timesFromPlace?days=1&region=$country&country=Turkey&timezoneOffset=180&city=$town";
  }
}
