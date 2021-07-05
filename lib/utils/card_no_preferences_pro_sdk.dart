import 'package:mep_issuer/models/card_number_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardNoPreferencesProSdk {
  Future saveCardNo(CardNoInfo cardNoInfo) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString(
        'cardnumberPreferences1', cardNoInfo.cardnumber);
    await preferences.setString(
        'expirydatePreferences1', cardNoInfo.expirydate);
    await preferences.setString('addressPreferences1', cardNoInfo.address);
    await preferences.setString('cityPreferences1', cardNoInfo.city);
    await preferences.setString('statePreferences1', cardNoInfo.state);
    await preferences.setString('postalPreferences1', cardNoInfo.postal);
    await preferences.setString('cardtypePreferences1', cardNoInfo.cardtype);
    await preferences.setString('cardbrandPreferences1', cardNoInfo.cardbrand);
  }

  Future<CardNoInfo> getInfo() async {
    final preferences = await SharedPreferences.getInstance();

    final cardnumber = preferences.getString('cardnumberPreferences1');
    final expirydate = preferences.getString('expirydatePreferences1');
    final address = preferences.getString('addressPreferences1');
    final city = preferences.getString('cityPreferences1');
    final state = preferences.getString('statePreferences1');
    final postal = preferences.getString('postalPreferences1');
    final cardtype = preferences.getString('cardtypePreferences1');
    final cardbrand = preferences.getString('cardbrandPreferences1');

    return CardNoInfo(
        cardnumber: cardnumber,
        expirydate: expirydate,
        address: address,
        city: city,
        state: state,
        postal: postal,
        cardtype: cardtype,
        cardbrand: cardbrand);
  }
}
