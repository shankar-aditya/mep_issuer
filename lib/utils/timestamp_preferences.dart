import 'package:shared_preferences/shared_preferences.dart';

class TimeStampPreferences {
  static SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setTime(String sec) async =>
      await _preferences.setString('timeStampPreferences', sec);

  static String getTime() {
    return _preferences.getString('timeStampPreferences') ?? '';
  }
}
