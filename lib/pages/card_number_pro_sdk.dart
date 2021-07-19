import 'package:flutter/material.dart';
import 'package:mep_issuer/res/constants.dart';
import 'package:mep_issuer/res/dimens.dart';
import 'package:mep_issuer/res/strings.dart';
import 'package:mep_issuer/utils/card_no_preferences_pro_sdk.dart';
import 'package:mep_issuer/widgets/form_row.dart';
import 'package:mep_issuer/widgets/back_button.dart';
import 'package:mep_issuer/widgets/listview_row.dart';
import 'package:mep_issuer/widgets/custom_button.dart';
import 'package:mep_issuer/models/card_number_info.dart';

class CardNumberProSdk extends StatefulWidget {
  CardNumberProSdk({Key key}) : super(key: key);

  @override
  _CardNumberState createState() => _CardNumberState();
}

class _CardNumberState extends State<CardNumberProSdk> {
  final _preferenceService = CardNoPreferencesProSdk();

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  TextEditingController _cardNumberController = TextEditingController(text: cardNoDefault);
  TextEditingController _expiryController = TextEditingController(text: expiryDefault);
  TextEditingController _addressController = TextEditingController(text: addressDefault);
  TextEditingController _cityController = TextEditingController(text: cityDefault);
  TextEditingController _stateController = TextEditingController(text: stateDefault);
  TextEditingController _postalController = TextEditingController(text: postalCodeDefault);
  TextEditingController _cardTypeController = TextEditingController(text: typeDefault);
  TextEditingController _cardBrandController = TextEditingController(text: brandDefault);

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
          leading: CustomBackButton(),
          centerTitle: true,
          title: Text(
            cardNoScreen,
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              CustomRowHeader(
                title: cardNoFormHeading,
              ),
              Divider(
                height: dividerHeight,
                thickness: dividerThickness,
              ),
              FormRow(
                title: cardNoRow1,
                hintText: cardNoRow1HintText,
                controller: _cardNumberController,
              ),
              FormRow(
                title: cardNoRow2,
                hintText: cardNoRow2HintText,
                controller: _expiryController,
              ),
              FormRow(
                title: cardNoRow3,
                hintText: cardNoRow3HintText,
                controller: _addressController,
              ),
              FormRow(
                title: cardNoRow4,
                hintText: cardNoRow4HintText,
                controller: _cityController,
              ),
              FormRow(
                title: cardNoRow5,
                hintText: cardNoRow5HintText,
                controller: _stateController,
              ),
              FormRow(
                title: cardNoRow6,
                hintText: cardNoRow6HintText,
                controller: _postalController,
              ),
              FormRow(
                title: cardNoRow7,
                hintText: cardNoRow7HintText,
                controller: _cardTypeController,
              ),
              FormRow(
                title: cardNoRow8,
                hintText: cardNoRow8HintText,
                controller: _cardBrandController,
              ),
              Divider(
                height: dividerHeight,
                thickness: dividerThickness,
              ),
              CustomButton(
                title: saveButton,
                onPressed: _saveCardNo,
              ),
              CustomButton(
                title: restoreButton,
                onPressed: _restorCardNo,
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
        cardnumber: cardNoDefault,
        expirydate: expiryDefault,
        address: addressDefault,
        city: cityDefault,
        state: stateDefault,
        postal: postalCodeDefault,
        cardtype: typeDefault,
        cardbrand: brandDefault);

    _preferenceService.saveCardNo(newCardNo);

    setState(() {
      _cardNumberController.text = cardNoDefault;
      _expiryController.text = expiryDefault;
      _addressController.text = addressDefault;
      _cityController.text = cityDefault;
      _stateController.text = stateDefault;
      _postalController.text = postalCodeDefault;
      _cardTypeController.text = typeDefault;
      _cardBrandController.text = brandDefault;
    });
  }
}
