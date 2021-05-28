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
      body: Container(),
    );
  }
}
