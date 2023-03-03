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

  static void getInstance() {}
}
