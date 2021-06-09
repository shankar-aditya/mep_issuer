import 'package:shared_preferences/shared_preferences.dart';

class CardNoInfo {
  final String cardnumber;
  final String expirydate;
  final String address;
  final String city;
  final String state;
  final String postal;
  final String cardtype;
  final String cardbrand;

  CardNoInfo({
    this.cardnumber,
    this.expirydate,
    this.address,
    this.city,
    this.state,
    this.postal,
    this.cardtype,
    this.cardbrand,
  });
}

class CardIdInfo {
  final String cardId;
  final String source;
  final String provider;

  CardIdInfo({
    this.cardId,
    this.source,
    this.provider,
  });
}

class CardIdPreferences {
  Future saveCardId(CardIdInfo cardIdInfo) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('cardId', cardIdInfo.cardId);
    await preferences.setString('source', cardIdInfo.source);
    await preferences.setString('provider', cardIdInfo.provider);
  }

  Future<CardIdInfo> getInfo() async {
    final preferences = await SharedPreferences.getInstance();

    final cardId = preferences.getString('cardId');
    final source = preferences.getString('source');
    final provider = preferences.getString('provider');

    return CardIdInfo(cardId: cardId, source: source, provider: provider);
  }
}

class CardNoPreferences {
  Future saveCardNo(CardNoInfo cardNoInfo) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('cardnumber', cardNoInfo.cardnumber);
    await preferences.setString('expirydate', cardNoInfo.expirydate);
    await preferences.setString('address', cardNoInfo.address);
    await preferences.setString('city', cardNoInfo.city);
    await preferences.setString('state', cardNoInfo.state);
    await preferences.setString('postal', cardNoInfo.postal);
    await preferences.setString('cardtype', cardNoInfo.cardtype);
    await preferences.setString('cardbrand', cardNoInfo.cardbrand);
  }

  Future<CardNoInfo> getInfo() async {
    final preferences = await SharedPreferences.getInstance();

    final cardnumber = preferences.getString('cardnumber');
    final expirydate = preferences.getString('expirydate');
    final address = preferences.getString('address');
    final city = preferences.getString('city');
    final state = preferences.getString('state');
    final postal = preferences.getString('postal');
    final cardtype = preferences.getString('cardtype');
    final cardbrand = preferences.getString('cardbrand');

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
