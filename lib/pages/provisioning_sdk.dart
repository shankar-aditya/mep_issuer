import 'package:flutter/material.dart';
import 'package:mep_issuer/pages/card_id.dart';
import 'package:mep_issuer/pages/card_number.dart';

class ProvisioningSDK extends StatefulWidget {
  ProvisioningSDK({Key key}) : super(key: key);

  @override
  _ProvisioningSDKState createState() => _ProvisioningSDKState();
}

class _ProvisioningSDKState extends State<ProvisioningSDK> {
  List<Psdk> row = <Psdk>[
    Psdk(0, 'Card Number'),
    Psdk(1, 'Card Id'),
  ];

  int selectedIndex;

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
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              child: Text('DATA ENTRY MODE'),
              height: 30,
            ),
            SizedBox(
              child: Text('Select the mechanism to enter data'),
              height: 30,
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(row.length, (index) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  selected: row[index].selected,
                  title: Text(row[index].title),
                  trailing: (selectedIndex == index)
                      ? Icon(Icons.check, color: Colors.blueAccent)
                      : null,
                );
              }),
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              child: Text('ENTER DETAILS'),
              height: 30,
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            buildSettingsRow('Card Id', () => CardId(), context),
            buildSettingsRow('Card Number', () => CardNumber(), context),
            Divider(
              height: 15,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class Psdk {
  final int id;
  final String title;
  bool selected = false;

  Psdk(this.id, this.title);
}

GestureDetector buildSettingsRow(
    String title, Widget Function() createPage, BuildContext context) {
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
