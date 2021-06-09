import 'package:flutter/material.dart';
import 'package:mep_issuer/pages/features.dart';
import 'package:mep_issuer/pages/settings.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        appBar: AppBar(
          title: Text('MEP Issuer'),
          backgroundColor: Color(0xFFF2F2F7),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push((MaterialPageRoute(
                    builder: (BuildContext context) => SettingsPage())));
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => FeaturesHome()));
                },
                color: Color(0xFFF0F0F0),
                child: Text(
                  'Features',
                  style: TextStyle(fontSize: 20),
                ),
                height: 60,
              ),
            ],
          ),
        ),
      );
    }
  }
}
