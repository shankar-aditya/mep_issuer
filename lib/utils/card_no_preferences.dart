import 'package:mep_issuer/models/card_number_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardNoPreferences {

  static SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  Future saveCardNo(CardNoInfo cardNoInfo) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('cardnumberPreferences', cardNoInfo.cardnumber);
    await preferences.setString('namePreferences', cardNoInfo.name);
    await preferences.setString('expirydatePreferences', cardNoInfo.expirydate);
    await preferences.setString('addressPreferences', cardNoInfo.address);
    await preferences.setString('cityPreferences', cardNoInfo.city);
    await preferences.setString('statePreferences', cardNoInfo.state);
    await preferences.setString('postalPreferences', cardNoInfo.postal);
    await preferences.setString('cardtypePreferences', cardNoInfo.cardtype);
    await preferences.setString('cardbrandPreferences', cardNoInfo.cardbrand);
  }

  Future<CardNoInfo> getInfo() async {
    final preferences = await SharedPreferences.getInstance();

    final cardnumber = preferences.getString('cardnumberPreferences');
    final name = preferences.getString('namePreferences');
    final expirydate = preferences.getString('expirydatePreferences');
    final address = preferences.getString('addressPreferences');
    final city = preferences.getString('cityPreferences');
    final state = preferences.getString('statePreferences');
    final postal = preferences.getString('postalPreferences');
    final cardtype = preferences.getString('cardtypePreferences');
    final cardbrand = preferences.getString('cardbrandPreferences');

    return CardNoInfo(
        cardnumber: cardnumber,
        name: name,
        expirydate: expirydate,
        address: address,
        city: city,
        state: state,
        postal: postal,
        cardtype: cardtype,
        cardbrand: cardbrand);
  }
  static String getAcNo() => _preferences.getString('cardnumberPreferences') ?? '';
  static String getName() => _preferences.getString('namePreferences') ?? '';
  static String getExp() => _preferences.getString('expirydatePreferences') ?? '';
  static String getCardType() => _preferences.getString('cardtypePreferences') ?? '';
  static String getCardBrand() => _preferences.getString('cardbrandPreferences') ?? '';

}
