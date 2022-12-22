class AppConstants {
  static const countryUrl =
      "https://namaz-vakti.vercel.app/api/regions?country=Turkey";
 
  static String getTownUrl(String country){
   return "https://namaz-vakti.vercel.app/api/cities?country=Turkey&region=$country";
  }    
}
