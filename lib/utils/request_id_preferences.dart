import 'package:shared_preferences/shared_preferences.dart';

class RequestIdPreferences {
  static SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setRequestId(String id) async =>
      await _preferences.setString('requestIdPreferences', id);

  static String getRequestId() {
    final myId = _preferences.getString('requestIdPreferences') ?? '';
    return myId;
  }
}
