import 'package:shared_preferences/shared_preferences.dart';

class UserEnvPreferences {
  static SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setInd(int index) async =>
      await _preferences.setInt('envPreferences', index);

  static int getInd() => _preferences.getInt('envPreferences');

  static Future setEnvName(String idc) async =>
      await _preferences.setString('envName', idc);
  static String getEnvName() {
    final myId = _preferences.getString("envName") ?? '';
    return myId;
  }
}
