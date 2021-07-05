import 'package:flutter/material.dart';
import 'package:mep_issuer/res/dimens.dart';
import 'package:mep_issuer/res/strings.dart';
import 'package:mep_issuer/models/app_class.dart';
import 'package:mep_issuer/widgets/back_button.dart';
import 'package:mep_issuer/widgets/listview_row.dart';
import 'package:mep_issuer/utils/card_preferences.dart';

import 'card_id_pro_sdk.dart';
import 'card_number_pro_sdk.dart';

class ProvisioningSDK extends StatefulWidget {
  ProvisioningSDK({Key key}) : super(key: key);

  @override
  _ProvisioningSDKState createState() => _ProvisioningSDKState();
}

class _ProvisioningSDKState extends State<ProvisioningSDK> {
  List<Data> row = <Data>[
    Data(0, proSDKRow1),
    Data(1, proSDKRow2),
  ];

  int selectedIndex;
  @override
  void initState() {
    super.initState();
    selectedIndex = CardPreferences.getProSdkId() ?? -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        centerTitle: true,
        title: Text(
          proSdkScreen,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            CustomRowHeader(
              title: '$entryModeInfo',
            ),
            Container(
              padding: EdgeInsets.only(
                  left: infoLeftPadding, bottom: infoBottomPadding),
              child: Text(proSdkInfoMessage),
            ),
            SelectRow(
              row: row,
              selectedIndex: selectedIndex,
              onTapAlso: (selectedIndex) async {
                setState(() {
                  this.selectedIndex = selectedIndex;
                });
                await CardPreferences.setProSdkId(selectedIndex);
                await CardPreferences.setProSdkEntryMode(row.elementAt(selectedIndex).title);
              },
            ),
            CustomRowHeader(
              title: '$detailsInfo',
            ),
            CustomRow(
              title: '$proSDKRow2',
              onTap: CardIdProSdk(),
            ),
            CustomRow(
              title: '$proSDKRow1',
              onTap: CardNumberProSdk(),
            ),
          ],
        ),
      ),
    );
  }
}
