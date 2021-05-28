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
            left: 50,
            right: 50,
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
                color: Colors.grey,
                child: Text('Features'),
                height: 40,
              ),
            ],
          ),
        ),
      );
    }
  }
}
