import 'package:flutter/material.dart';
import 'package:mep_issuer/utils/card_number_info.dart';

class CardNumber extends StatefulWidget {
  CardNumber({Key key}) : super(key: key);

  @override
  _CardNumberState createState() => _CardNumberState();
}

class _CardNumberState extends State<CardNumber> {
  final _preferenceService = CardNoPreferences();

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _expiryController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _postalController = TextEditingController();
  TextEditingController _cardTypeController = TextEditingController();
  TextEditingController _cardBrandController = TextEditingController();

  void _populateFields() async {
    final cardNoNew = await _preferenceService.getInfo();
    setState(() {
      _cardNumberController.text = cardNoNew.cardnumber;
      _expiryController.text = cardNoNew.expirydate;
      _addressController.text = cardNoNew.address;
      _cityController.text = cardNoNew.city;
      _stateController.text = cardNoNew.state;
      _postalController.text = cardNoNew.postal;
      _cardTypeController.text = cardNoNew.cardtype;
      _cardBrandController.text = cardNoNew.cardbrand;
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
            'Card Number',
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
                child: Text('ENTER DETAILS'),
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
              buildSettingsRow(
                  'Card Number', 'Card Number', _cardNumberController),
              buildSettingsRow('Expiry Date', 'Expiry Date', _expiryController),
              buildSettingsRow(
                  'Address 1', 'Address Line 1', _addressController),
              buildSettingsRow('City', 'City', _cityController),
              buildSettingsRow('State', 'State', _stateController),
              buildSettingsRow('Postal Code', 'Postal Code', _postalController),
              buildSettingsRow('Card Type', 'Card Type', _cardTypeController),
              buildSettingsRow(
                  'Card Brand', 'Card Brand', _cardBrandController),
              Divider(
                height: 1,
                thickness: 2,
              ),
              FlatButton(
                color: Color(0xFFFFFFFF),
                onPressed: () {
                  _saveCardNo();
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
                  _restorCardNo();
                },
                child: Text(
                  'Restore Deaults',
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

  void _saveCardNo() {
    final newCardNo = CardNoInfo(
        cardnumber: _cardNumberController.text,
        expirydate: _expiryController.text,
        address: _addressController.text,
        city: _cityController.text,
        state: _stateController.text,
        postal: _postalController.text,
        cardtype: _cardTypeController.text,
        cardbrand: _cardBrandController.text);

    _preferenceService.saveCardNo(newCardNo);
  }

  void _restorCardNo() {
    final newCardNo = CardNoInfo(
        cardnumber: '_cardNumberController.text',
        expirydate: '_expiryController.text',
        address: '_addressController.text',
        city: '_cityController.text',
        state: '_stateController.text',
        postal: '_postalController.text',
        cardtype: '_cardTypeController.text',
        cardbrand: '_cardBrandController.text');

    _preferenceService.saveCardNo(newCardNo);
    _populateFields();
  }
}

Container buildSettingsRow(
    String title, String subtitle, TextEditingController controllerText) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(left: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 120.0,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Expanded(
          child: TextField(
            controller: controllerText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: subtitle,
            ),
          ),
        ),
      ],
    ),
  );
}
