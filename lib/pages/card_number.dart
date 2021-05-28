import 'package:flutter/material.dart';

class CardNumber extends StatefulWidget {
  CardNumber({Key key}) : super(key: key);

  @override
  _CardNumberState createState() => _CardNumberState();
}

class _CardNumberState extends State<CardNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text('ENTER DETAILS'),
            Divider(
              height: 15,
              thickness: 2,
            ),
            buildSettingsRow('Card Number', 'Card Number'),
            buildSettingsRow('Expiry Date', 'Expiry Date'),
            buildSettingsRow('Address 1', 'Address Line 1'),
            buildSettingsRow('City', 'City'),
            buildSettingsRow('State', 'State'),
            buildSettingsRow('Postal Code', 'Postal Code'),
            buildSettingsRow('Card Type', 'Card Type'),
            buildSettingsRow('Card Brand', 'Card Brand'),
            FlatButton(
              onPressed: () {},
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'Restore Deaults',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}

Padding buildSettingsRow(String title, String subtitle) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 0.0),
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
