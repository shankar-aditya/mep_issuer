import 'package:flutter/material.dart';
import 'package:mep_issuer/pages/pro_sdk_native_display.dart';
import 'package:mep_issuer/res/strings.dart';
import 'package:mep_issuer/res/dimens.dart';
import 'package:mep_issuer/pages/app_loader.dart';
import 'package:mep_issuer/utils/app_id_preferences.dart';
import 'package:mep_issuer/utils/card_no_preferences.dart';
import 'package:mep_issuer/utils/user_env_preferences.dart';
import 'package:mep_issuer/widgets/back_button.dart';
import 'package:mep_issuer/widgets/listview_row.dart';
import 'package:flutter/services.dart';
import 'package:mep_issuer/res/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'card_native_display_sdk.dart';

class FeaturesHome extends StatefulWidget {
  FeaturesHome({Key key}) : super(key: key);

  @override
  _FeaturesHomeState createState() => _FeaturesHomeState();
}

class _FeaturesHomeState extends State<FeaturesHome> {

  var appLoader = AppLoader();
  static const platform = const MethodChannel('com.visa.app.consolidatedissuerdemoapp/VIAPChannel');
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  String accountNumber;
  String name;
  String expiryTime;
  String expiryMonth='';
  String expiryYear='';
  String nameOnAccount;
  String cardType;
  String cardBrand;
  String appId;
  String env;

  @override
  void initState() {
    super.initState();
    accountNumber = CardNoPreferences.getAcNo();
    name = CardNoPreferences.getName();
    expiryTime = CardNoPreferences.getExp();
    cardType = CardNoPreferences.getCardType();
    cardBrand = CardNoPreferences.getCardBrand();
    appId = AppIdPreferences.getAppIdName();
    if(appId=='')
      appId = appIdRow1;
    env = UserEnvPreferences.getEnvName();
    if(env=='')
      env = environmentRow1;
    if(expiryTime!=''){
      if(expiryTime[1]=='-'){
        expiryMonth = expiryTime[0];
        expiryYear = expiryTime.substring(2);
      }
      else{
        expiryMonth = expiryTime.substring(0,2);
        expiryYear = expiryTime.substring(3);
      }
    }
    platform.setMethodCallHandler((call) {
      if (call.method.contains('showMessageMethod')) {
        appLoader.showMessage(call.arguments);
      } else if (call.method.contains ('hideSpinnerMethod')) {
        Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
      } else if (call.method.contains ('fetchSignedNonce')) {
        print("im here1");
        _fetch(call.arguments);
      } else {
        Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
      }
    });
    _startSetup();
  }

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
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/icon_feature.jpg'),
                ),
                title: Text('$issuerFeature1'),
                subtitle: Text('$issuerFeature1Details'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: nextIcon,
                ),
                onTap: () => _startInit(),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/icon_feature.jpg'),
                ),
                title: Text('$issuerFeature2'),
                subtitle: Text('$issuerFeature2Details'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: nextIcon,
                ),
                onTap: () => _startInit(),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> _startSetup() async {
    try {
      await platform.invokeMethod('startSetup', {'appID': appId, 'env':env});
    } on PlatformException catch (e) {
      print("Failed: '${e.message}'.");
    }
  }

  Future<void> _startInit() async {
    try {
      appLoader.showLoadingDialog(context, _keyLoader);
      await platform.invokeMethod('startInit');
    } on PlatformException catch (e) {
      print("Failed: '${e.message}'.");
    }
  }

  Future<void> _showCardDetail(payload) async {
    try {
      await platform.invokeMethod('showCardDetail', {"payload": payload});
    } on PlatformException catch (e) {
      print("Failed: '${e.message}'.");
    }
  }

  Future<void> _fetch(nounce) async {
    print("nounce ->: '${nounce}'.");
    appLoader.showMessage('Mock Bank API call...');

    Map<String, String> requestBody = {
    'encNonce': nounce,
    'accountNumber': accountNumber,
    'expirationMonth': expiryMonth,
    'expiration Year': expiryYear,
    'nameOnAccount': name,
    'cardType': cardType,
    'cardBrand': cardBrand,
    };

    await http.post(

      Uri.parse('https://vbox460.digital.visa.com/mockbank/vdca-mobile/provisionSdk/createEncPayload'),
      headers: <String, String>{
        "Accept": "application/json",
        "X-API-KEY": "SVC_DPS:5o&gt;InL=B7t",
        "X-SERVICE-CONTEXT": "subject_id=c5d1a980-e5c2-f248-389c-1fa313f2ed01&device_id=bfef5866a2f169c55ce2c5221024f0b74c54ef84032c0f01",
        "cache-control": "no-cache,no-cache"
      },
      body: requestBody,
    ).then((response){
      setState((){
        print("I m here ---> 1");
//            print(response);
//            print(response.body);
//            print(jsonDecode(response.body));
        appLoader.showMessage('Mock Bank API call successful.');
        Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
        _showCardDetail("eyJleHAiOjE1ODgxMzY2NDMsImlhdCI6MTU4ODEzNjUyMywiYWxnIjoiSFMyNTYifQ.ZXlKMGVYQWlPaUpLVDFORklpd2laVzVqSWpvaVFUSTFOa2REVFNJc0luUmhaeUk2SW0wek0wcGZURXBpY1RWbE9USlpiakpOVTNWSE9YY2lMQ0poYkdjaU9pSkJNalUyUjBOTlMxY2lMQ0pwZGlJNklrcFlSbGcwWVhNeWFEUnFSMWhvV21ZaWZRLmxiRUdLanZJN2cwc0s0LXI2SUFfRlN6ZWZCRzFUSjMxa2dkOEFYNDlkc2MuQXJfRnFyWXc0UUZpZDBnMy5PbUc4T1RMX191cVpIX2VHblRJbnBSNXB2YS1zM201NVN0c0FOcUFaTHM0dmYxcXNHZGtmYktUbC1iSEVNQ1RyemFrNjVPR2tiWGZ0eEEwa0F6Y0d0d2dQaFBiVk1GY0l4QWhyWVFEZ2NTSDVqTUJzOVZaZ0xDNmxXbEZYSzFEWFQxcG5EOU9kUUZvYVQyN0w4VlVDQTRPcmpvbHdHNFlfbHVjRkEzei1IVEhTM1VpcVF5c2x0WU5mM0dPOFg1WGdmdUliRkNZWnF2NWhvVWl3MjJlekZyQmdpN3g3cVJzRFp6b1dLZkYxbGhoUDJmOGxCVTRwemIwaE9Nb1otblFIYUswNmMwb09DTGZfTE43cjROeUFzQXNUWEpNREx4QmpUaFVuVmRJd3FUWGhOMkhBSF9KejdLZmhQOGZ6TG9FYWdqWUJKaXZIMGFEQXVRaUpLNTdGVklKT3ZwN1JkLUd2R3YtUDhlZjJfcS03MXJnaUFMOHBMbHQ4NUpSeU9YRXpxTkZ6OEctWUFGQTdCc0JkWng1UlFlZHhVZVpFd0t1WEc0Z2hNOVR3eVV3ckVxY2RPdEI3TENmUXN1c2QwNVllMjdxVTBQOFVhRlRyZTZZWEVDT0VZbjdzRDR5dHU4RWNxSmFaamM3V2hMTkZ5QS5XS25uaGlmdTNTVmZ0dmZNU252cnBB.Oh2ocLUOdk_yYOYlkqh5mAO5Ez0dwXURSVIg7XnQpb0");
      });

    });
  }

}