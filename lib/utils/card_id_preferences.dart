import 'package:mep_issuer/models/card_number_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardIdPreferences {
  Future saveCardId(CardIdInfo cardIdInfo) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('cardIdPreferences', cardIdInfo.cardId);
    await preferences.setString('sourcePreferences', cardIdInfo.source);
    await preferences.setString('providerPreferences', cardIdInfo.provider);
  }

  Future<CardIdInfo> getInfo() async {
    final preferences = await SharedPreferences.getInstance();

    final cardId = preferences.getString('cardIdPreferences');
    final source = preferences.getString('sourcePreferences');
    final provider = preferences.getString('providerPreferences');

    return CardIdInfo(cardId: cardId, source: source, provider: provider);
  }
}
