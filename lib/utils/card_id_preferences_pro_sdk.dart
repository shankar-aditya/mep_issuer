import 'package:mep_issuer/models/card_number_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardIdPreferencesProSdk {
  Future saveCardId(CardIdInfo cardIdInfo) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('cardIdPreferences1', cardIdInfo.cardId);
    await preferences.setString('sourcePreferences1', cardIdInfo.source);
    await preferences.setString('providerPreferences1', cardIdInfo.provider);
  }

  Future<CardIdInfo> getInfo() async {
    final preferences = await SharedPreferences.getInstance();

    final cardId = preferences.getString('cardIdPreferences1');
    final source = preferences.getString('sourcePreferences1');
    final provider = preferences.getString('providerPreferences1');

    return CardIdInfo(cardId: cardId, source: source, provider: provider);
  }
}
