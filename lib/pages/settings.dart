import 'package:flutter/material.dart';
import 'package:mep_issuer/pages/app_id.dart';
import 'package:mep_issuer/res/strings.dart';
import 'package:mep_issuer/pages/environment.dart';
import 'package:mep_issuer/res/dimens.dart';
import 'package:mep_issuer/widgets/listview_row.dart';
import 'package:mep_issuer/pages/provisioning_sdk.dart';
import 'package:mep_issuer/res/colors.dart';
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
        title: Text('$settingsScreen'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              '$settingsButtonText',
              style: TextStyle(color: settingsScreenButton),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: ListView(
          children: [
            CustomRowHeader(
              title: '$commonSettingsHeader',
            ),
            CustomRow(
              title: '$commonSettingsRow1',
              onTap: AppId(),
            ),
            CustomRow(
              title: '$commonSettingsRow2',
              onTap: Environment(),
            ),
            CustomRowHeader(
              title: '$featuresHeader',
            ),
            CustomRow(
              title: '$featuresRow1',
              onTap: ProvisioningSDK(),
            ),
            CustomRow(
              title: '$featuresRow2',
              onTap: CardInfoDisplaySDK(),
            ),
          ],
        ),
      ),
    );
  }
}
