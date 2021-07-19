import 'package:flutter/material.dart';
import 'package:mep_issuer/res/dimens.dart';
import 'package:mep_issuer/res/strings.dart';
import 'package:mep_issuer/res/constants.dart';
import 'package:mep_issuer/utils/card_id_preferences_pro_sdk.dart';
import 'package:mep_issuer/widgets/form_row.dart';
import 'package:mep_issuer/widgets/back_button.dart';
import 'package:mep_issuer/widgets/listview_row.dart';
import 'package:mep_issuer/widgets/custom_button.dart';
import 'package:mep_issuer/models/card_number_info.dart';

class CardIdProSdk extends StatefulWidget {
  CardIdProSdk({Key key}) : super(key: key);

  @override
  _CardIdState createState() => _CardIdState();
}

class _CardIdState extends State<CardIdProSdk> {
  final _preferenceServiceProSdk = CardIdPreferencesProSdk();

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  TextEditingController _cardIdController = TextEditingController(text: cardIdDefault);
  TextEditingController _sourceController = TextEditingController(text: sourceDefault);
  TextEditingController _providerController = TextEditingController(text: providerDefault);

  void _populateFields() async {
    final cardIdNew = await _preferenceServiceProSdk.getInfo();
    setState(() {
      _cardIdController.text = cardIdNew.cardId;
      _sourceController.text = cardIdNew.source;
      _providerController.text = cardIdNew.provider;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(),
          centerTitle: true,
          title: Text(
            cardIdScreen,
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              CustomRowHeader(
                title: cardIdFormHeading,
              ),
              Divider(
                height: dividerHeight,
                thickness: dividerThickness,
              ),
              FormRow(
                title: cardIdRow1,
                controller: _cardIdController,
              ),
              FormRow(
                title: cardIdRow2,
                controller: _sourceController,
              ),
              FormRow(
                title: cardIdRow3,
                controller: _providerController,
              ),
              Divider(
                height: dividerHeight,
                thickness: dividerThickness,
              ),
              CustomButton(
                title: saveButton,
                onPressed: _saveCardId,
              ),
              CustomButton(
                title: restoreButton,
                onPressed: _restorCardId,
              ),
            ],
          ),
        ),
      ),
    );
  }

//
  void _saveCardId() {
    final newCardIdProSdk = CardIdInfo(
        cardId: _cardIdController.text,
        source: _sourceController.text,
        provider: _providerController.text);

    _preferenceServiceProSdk.saveCardId(newCardIdProSdk);
  }

  void _restorCardId() {
    final newCardIdProSdk = CardIdInfo(
      cardId: cardIdDefault,
      source: sourceDefault,
      provider: providerDefault,
    );
    print(newCardIdProSdk.cardId);

    _preferenceServiceProSdk.saveCardId(newCardIdProSdk);

    setState(() {
      _cardIdController.text = cardIdDefault;
      _sourceController.text = sourceDefault;
      _providerController.text = providerDefault;
    });
  }
}
