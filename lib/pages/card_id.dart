import 'package:flutter/material.dart';

class CardId extends StatefulWidget {
  CardId({Key key}) : super(key: key);

  @override
  _CardIdState createState() => _CardIdState();
}

class _CardIdState extends State<CardId> {
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
          'Card Id',
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              'ENTER DETAILS',
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            buildSettingsRow('Card ID'),
            buildSettingsRow('Source'),
            buildSettingsRow('Provider'),
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
            SizedBox(
              height: 30,
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'Restore Defaults',
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

Padding buildSettingsRow(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}
