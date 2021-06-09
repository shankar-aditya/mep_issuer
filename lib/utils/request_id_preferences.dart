import 'package:shared_preferences/shared_preferences.dart';

class RequestIdPreferences {
  static SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setRequestId(String id) async =>
      await _preferences.setString('_idRequest', id);

  static String getRequestId() {
    final myId = _preferences.getString("_idRequest") ?? '';
    return myId;
  }
}
