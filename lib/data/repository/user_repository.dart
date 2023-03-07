import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  static Future<bool> saveId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    print("Setga kirdi");
    return await prefs.setString("id", id);
  }

  static Future<String> getId() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString("id") ?? "";
  }

  static Future<bool> saveLatLong(double lattitude) async {
    final prefs = await SharedPreferences.getInstance();
    print("Setga kirdi");
    return await prefs.setDouble("lattitude", lattitude);
  }

  static Future<double> getLatLong() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getDouble("lattitude") ?? 0.0;
  }

  static Future<bool> savetoken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    print("Setga kirdi");
    return await prefs.setString("token", token);
  }

  static Future<String> gettoken() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString("token") ?? "";
  }

  static void getInstance() {}
}
