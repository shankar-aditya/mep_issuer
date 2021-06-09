import 'package:shared_preferences/shared_preferences.dart';

class CardPreferences {
  static SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setId(int index) async =>
      await _preferences.setInt('_id', index);

  static int getId() {
    final myInt = _preferences.getInt("_id") ?? -1;
    return myInt;
  }

  static Future setSetUpId(int index1) async =>
      await _preferences.setInt('_id1', index1);

  static int getSetUpId() {
    final myInt1 = _preferences.getInt("_id1") ?? -1;
    return myInt1;
  }

  static Future setVerificationId(int index2) async =>
      await _preferences.setInt('_id2', index2);

  static int getVerificationId() {
    final myInt2 = _preferences.getInt("_id2") ?? -1;
    return myInt2;
  }
}
