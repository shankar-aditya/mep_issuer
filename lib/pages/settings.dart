import 'package:flutter/material.dart';
import 'package:mep_issuer/pages/app_id.dart';
import 'package:mep_issuer/pages/environment.dart';
import 'package:mep_issuer/pages/provisioning_sdk.dart';
import 'package:mep_issuer/pages/card_info_display_sdk.dart';

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
        backgroundColor: Color(0xFFF2F2F7),
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
        padding: EdgeInsets.only(top: 25),
        color: Color(0xfff2f2f7),
        child: ListView(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 14,
                ),
                Text('COMMON'),
              ],
            ),
            Divider(
              height: 1,
              thickness: 2,
            ),
            buildSettingsRow('App Id', () => AppId()),
            buildSettingsRow('Environment', () => Environment()),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 14,
                ),
                Text('FEATURES'),
              ],
            ),
            Divider(
              height: 1,
              thickness: 2,
            ),
            buildSettingsRow('Provisioning SDK', () => ProvisioningSDK()),
            buildSettingsRow(
                'Card info Display SDK', () => CardInfoDisplaySDK()),
          ],
        ),
      ),
    );
  }

  Container buildSettingsRow(String title, Widget Function() createPage) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            tileColor: Colors.white,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => createPage()));
            },
            title: Text(
              '$title',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black54,
            ),
          ),
          Divider(
            height: 1,
            thickness: 2,
          ),
        ],
        // child:
      ),
    );
  }
}
