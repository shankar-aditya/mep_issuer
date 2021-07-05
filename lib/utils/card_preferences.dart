import 'package:shared_preferences/shared_preferences.dart';

class CardPreferences {
  static SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setProSdkId(int index) async =>
      await _preferences.setInt('entryModeProSdkPreferences', index);

  static int getProSdkId() {
    final myInt = _preferences.getInt('entryModeProSdkPreferences') ?? -1;
    return myInt;
  }

  static Future setProSdkEntryMode(String idc) async =>
      await _preferences.setString('proSdkEntryMode', idc);
  static String getProSdkEntryMode() {
    final myId = _preferences.getString("proSdkEntryMode") ?? '';
    return myId;
  }

  static Future setId(int index) async =>
      await _preferences.setInt('entryModePreferences', index);

  static int getId() {
    final myInt = _preferences.getInt('entryModePreferences') ?? -1;
    return myInt;
  }

  static Future setCardDisplayEntryMode(String idc) async =>
      await _preferences.setString('cardDisplaySdkEntryMode', idc);
  static String getCardDisplayEntryMode() {
    final myId = _preferences.getString("cardDisplaySdkEntryMode") ?? '';
    return myId;
  }

  static Future setStepUpId(int index1) async =>
      await _preferences.setInt('stepUpPreferences', index1);

  static int getStepUpId() {
    final myInt1 = _preferences.getInt('stepUpPreferences') ?? -1;
    return myInt1;
  }

  static Future setStepUpIdName(String idc) async =>
      await _preferences.setString('stepUpPreferencesName', idc);
  static String getStepUpIdName() {
    final myId = _preferences.getString("stepUpPreferencesName") ?? '';
    return myId;
  }

  static Future setVerificationId(int index2) async =>
      await _preferences.setInt('verificationPreferences', index2);

  static int getVerificationId() {
    final myInt2 = _preferences.getInt('verificationPreferences') ?? -1;
    return myInt2;
  }
}
