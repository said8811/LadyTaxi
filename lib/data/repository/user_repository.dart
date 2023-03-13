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

  static Future<bool> saveNavigate(String navigate) async {
    final prefs = await SharedPreferences.getInstance();
    print("Setga kirdi");
    return await prefs.setString("navigate", navigate);
  }

  static Future<String> getNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("navigate") ?? "onBoarding";
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
