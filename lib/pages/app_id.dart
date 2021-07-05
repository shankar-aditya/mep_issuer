import 'package:flutter/material.dart';
import 'package:mep_issuer/res/strings.dart';
import 'package:mep_issuer/models/app_class.dart';
import 'package:mep_issuer/res/dimens.dart';
import 'package:mep_issuer/widgets/back_button.dart';
import 'package:mep_issuer/widgets/listview_row.dart';
import 'package:mep_issuer/utils/app_id_preferences.dart';

class AppId extends StatefulWidget {
  AppId({Key key}) : super(key: key);

  @override
  _AppIdState createState() => _AppIdState();
}

class _AppIdState extends State<AppId> {
  List<Data> apps = <Data>[
    Data(0, '$appIdRow1'),
    Data(1, '$appIdRow2'),
    Data(2, '$appIdRow3'),
    Data(3, '$appIdRow4'),
  ];

  int selectedIndex;
  String result = '';

  @override
  void initState() {
    super.initState();
    selectedIndex = AppIdPreferences.getAppId() ?? -1;
    if (selectedIndex != -1) {
      result = apps.elementAt(selectedIndex).title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        centerTitle: true,
        title: Text(
          '$appIdScreen',
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        child: ListView(
          children: [
            CustomRowWithText(
              title: selected,
              subtitle: result,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: infoTopPadding,
                  bottom: infoBottomPadding,
                  left: infoLeftPadding),
              child: Text(appIdInfoMessage),
            ),
            SelectRow(
              row: apps,
              selectedIndex: selectedIndex,
              onTapAlso: (selectedIndex) async {
                setState(() {
                  this.selectedIndex = selectedIndex;
                  this.result = apps[selectedIndex].title;
                });
                await AppIdPreferences.setAppId(selectedIndex);
                await AppIdPreferences.setAppIdName(result);
              },
            ),
          ],
        ),
      ),
    );
  }
}
