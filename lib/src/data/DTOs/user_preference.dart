import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(id, id);
  }

  Future<String?> getUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString("id");
  }

  void removeUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("id");
  }

  Future<String?> getToken(arg) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("token");
  }
}
