abstract class IHomeService {
  Future<List<String>> getCities();
  Future<List<String>> getTowns(String country);
}
