import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mep_issuer/res/dimens.dart';
import 'package:mep_issuer/utils/app_id_preferences.dart';
import 'package:mep_issuer/utils/card_preferences.dart';
import 'package:mep_issuer/utils/user_env_preferences.dart';
import 'package:mep_issuer/widgets/back_button.dart';

class ProSdkNativeDisplay extends StatefulWidget {
  const ProSdkNativeDisplay({Key key}) : super(key: key);

  @override
  _ProSdkNativeDisplayState createState() => _ProSdkNativeDisplayState();
}

class _ProSdkNativeDisplayState extends State<ProSdkNativeDisplay> {
  String appIdSelected;
  String envSelected;
  String userMode;
  @override
  void initState() {
    super.initState();
    appIdSelected = AppIdPreferences.getAppIdName();
    envSelected = UserEnvPreferences.getEnvName();
    userMode = CardPreferences.getProSdkEntryMode();
  }

  @override
  Widget build(BuildContext context) {
    final String viewType = '<platform-view-type>';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{
      'sdk': 'Digital Wallet',
      'appId': appIdSelected,
      'environment': envSelected,
      'entryMode': userMode,
    };

    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        centerTitle: true,
        title: Text(
          'Native Display',
        ),
      ),
      body: Container(
        color: Colors.yellow,
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        child: AndroidView(
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      ),
    );
  }
}
