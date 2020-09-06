import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageManager {
  static const String MY_USER_ID_KEY = "MY_USER_ID_KEY";
  static const String MY_NAME_KEY = "MY_NAME_KEY";

  static Future<String> getMyUserId() async => getString(MY_USER_ID_KEY);
  static Future<String> setMyUserId(String val) async => setString(MY_USER_ID_KEY, val);
  static Future<String> getMyName() async => getString(MY_NAME_KEY);
  static Future<String> setMyName(String val) async => setString(MY_NAME_KEY, val);

  static Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
  static Future<String> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    return value;
  }

  static void clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

