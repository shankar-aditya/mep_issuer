import 'package:flutter/material.dart';
import 'package:mep_issuer/utils/card_number_info.dart';

class CardId extends StatefulWidget {
  CardId({Key key}) : super(key: key);

  @override
  _CardIdState createState() => _CardIdState();
}

class _CardIdState extends State<CardId> {
  final _preferenceService = CardIdPreferences();

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  TextEditingController _cardIdController = TextEditingController();
  TextEditingController _sourceController = TextEditingController();
  TextEditingController _providerController = TextEditingController();

  void _populateFields() async {
    final cardIdNew = await _preferenceService.getInfo();
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
          leading: FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios),
                // Text('Back'),
              ],
            ),
          ),
          centerTitle: true,
          title: Text(
            'Card Id',
          ),
          backgroundColor: Color(0xFFF2F2F7),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 25),
          color: Color(0xfff2f2f7),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, bottom: 10),
                child: Text(
                  'ENTER DETAILS',
                ),
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
              buildSettingsRow('Card ID', _cardIdController),
              buildSettingsRow('Source', _sourceController),
              buildSettingsRow('Provider', _providerController),
              Divider(
                height: 1,
                thickness: 2,
              ),
              FlatButton(
                color: Color(0xFFFFFFFF),
                onPressed: () {
                  _saveCardId();
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
              FlatButton(
                color: Color(0xFFFFFFFF),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _restorCardId();
                },
                child: Text(
                  'Restore Defaults',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveCardId() {
    final newCardId = CardIdInfo(
        cardId: _cardIdController.text,
        source: _sourceController.text,
        provider: _providerController.text);

    _preferenceService.saveCardId(newCardId);
  }

  void _restorCardId() {
    final newCardId = CardIdInfo(
      cardId: '38dbffd7-740f-4e5b-8f82-495bf9a9054c',
      source: 'costco',
      provider: 'DPS',
    );

    _preferenceService.saveCardId(newCardId);
    _populateFields();
  }
}

Container buildSettingsRow(String title, TextEditingController controllerText) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(left: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          width: 70,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            controller: controllerText,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}
