import 'package:shared_preferences/shared_preferences.dart';

class AppIdPreferences {
  static SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setAppId(int index) async =>
      await _preferences.setInt('appIdPreferences', index);

  static int getAppId() {
    final myInt = _preferences.getInt('appIdPreferences');
    return myInt;
  }
  static Future setAppIdName(String idc) async =>
      await _preferences.setString('appIdName', idc);
  static String getAppIdName() {
    final myId = _preferences.getString("appIdName") ?? '';
    return myId;
  }
}
