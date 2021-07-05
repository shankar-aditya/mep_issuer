import 'package:flutter/material.dart';
import 'package:mep_issuer/pages/pro_sdk_native_display.dart';
import 'package:mep_issuer/res/strings.dart';
import 'package:mep_issuer/res/dimens.dart';
import 'package:mep_issuer/widgets/back_button.dart';
import 'package:mep_issuer/widgets/listview_row.dart';

import 'card_native_display_sdk.dart';

class FeaturesHome extends StatefulWidget {
  FeaturesHome({Key key}) : super(key: key);

  @override
  _FeaturesHomeState createState() => _FeaturesHomeState();
}

class _FeaturesHomeState extends State<FeaturesHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        centerTitle: true,
        title: Text(
          '$issuerName',
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        child: ListView(
          children: [
            Image(image: AssetImage('assets/images/Assembled.png')),
            CustomRowHeader(
              title: '$featuresHeader',
            ),
            CustomListTile(
              title: '$issuerFeature1',
              subtitle: '$issuerFeature1Details',
              onTap: ProSdkNativeDisplay(),
            ),
            CustomListTile(
              title: '$issuerFeature2',
              subtitle: '$issuerFeature2Details',
              onTap: CardSdkNativeDisplay(),
            ),
          ],
        ),
      ),
    );
  }
}
