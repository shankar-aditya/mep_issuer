import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mep_issuer/res/dimens.dart';
import 'package:mep_issuer/utils/card_preferences.dart';
import 'package:mep_issuer/utils/request_id_preferences.dart';
import 'package:mep_issuer/utils/timestamp_preferences.dart';
import 'package:mep_issuer/widgets/back_button.dart';

class CardSdkNativeDisplay extends StatefulWidget {
  const CardSdkNativeDisplay({Key key}) : super(key: key);

  @override
  _CardSdkNativeDisplayState createState() => _CardSdkNativeDisplayState();
}

class _CardSdkNativeDisplayState extends State<CardSdkNativeDisplay> {
  String userMode;
  String stepUp;
  String requestId;
  String timeStamp;
  @override
  void initState() {
    super.initState();
    userMode =  CardPreferences.getCardDisplayEntryMode();
    stepUp = CardPreferences.getStepUpIdName();
    requestId = RequestIdPreferences.getRequestId();
    timeStamp = TimeStampPreferences.getTime();
  }

  @override
  Widget build(BuildContext context) {
    final String viewType = '<platform-view-type>';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{
      'sdk': 'Display Card UI',
      'userMode' : userMode,
      'stepUp' : stepUp,
      'timeStamp' : timeStamp,
      'requestId' : requestId,
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
