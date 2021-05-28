import 'package:flutter/material.dart';
import 'package:mep_issuer/pages/app_id.dart';
import 'package:mep_issuer/pages/environment.dart';
import 'package:mep_issuer/pages/card_number.dart';
import 'package:mep_issuer/pages/provisioning_sdk.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Settings'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Done',
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              'COMMON',
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            buildSettingsRow('App Id', () => AppId()),
            buildSettingsRow('Environment', () => Environment()),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'FEATURES',
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            buildSettingsRow('Provisioning SDK', () => ProvisioningSDK()),
            buildSettingsRow('Card info Display SDK', () => CardNumber()),
            Divider(
              height: 15,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildSettingsRow(String title, Widget Function() createPage) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => createPage()));
      },
      child: Padding(
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
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
