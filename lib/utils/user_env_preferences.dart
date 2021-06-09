import 'package:shared_preferences/shared_preferences.dart';

class UserEnvPreferences {
  static SharedPreferences _preferences;

  static const _keyEnv = "";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setEnv(String envname) async =>
      await _preferences.setString(_keyEnv, envname);
  static Future setInd(int index) async =>
      await _preferences.setInt('_indEnv', index);

  static String getEnv() => _preferences.getString(_keyEnv);
  static int getInd() => _preferences.getInt('_indEnv');
}
