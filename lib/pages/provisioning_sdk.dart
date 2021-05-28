import 'package:flutter/material.dart';
// import 'package:mep_issuer/pages/card_id.dart';

class ProvisioningSDK extends StatefulWidget {
  ProvisioningSDK({Key key}) : super(key: key);

  @override
  _ProvisioningSDKState createState() => _ProvisioningSDKState();
}

class _ProvisioningSDKState extends State<ProvisioningSDK> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios),
              // Text('Settings'),
            ],
          ),
        ),
        centerTitle: true,
        title: Text(
          'Provisioning SDK',
        ),
      ),
      body: Container(),
    );
  }
}
