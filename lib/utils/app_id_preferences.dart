import 'package:shared_preferences/shared_preferences.dart';

class AppIdPreferences {
  static SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setId(int index) async =>
      await _preferences.setInt('_id', index);

  static Future setCustomId(String idc) async =>
      await _preferences.setString('_idCustom', idc);

  static int getId() {
    final myInt = _preferences.getInt("_id") ?? -1;
    return myInt;
  }

  static String getCustomId() {
    final myId = _preferences.getString("_idCustom") ?? '';
    return myId;
  }
}
