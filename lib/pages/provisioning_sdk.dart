import 'package:flutter/material.dart';
import 'package:mep_issuer/pages/card_id.dart';
import 'package:mep_issuer/pages/card_number.dart';
import 'package:mep_issuer/utils/card_preferences.dart';

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

  bool _enabledCardId = false;
  bool _enabledCardNo = false;

  @override
  void initState() {
    super.initState();
    selectedIndex = (CardPreferences.getId() ?? -1);
    if (selectedIndex == 0) {
      setState(() {
        _enabledCardNo = true;
        _enabledCardId = false;
      });
    } else if (selectedIndex == 1) {
      setState(() {
        _enabledCardNo = false;
        _enabledCardId = true;
      });
    }
  }

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
        backgroundColor: Color(0xFFF2F2F7),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 25),
        color: Color(0xfff2f2f7),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text('DATA ENTRY MODE'),
                    height: 30,
                  ),
                  SizedBox(
                    child: Text('Select the mechanism to enter data'),
                    height: 30,
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 2,
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(row.length, (index) {
                return Container(
                  child: Column(
                    children: [
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () async {
                          setState(() {
                            this.selectedIndex = index;
                            if (selectedIndex == 1) {
                              _enabledCardId = true;
                              _enabledCardNo = false;
                            } else {
                              _enabledCardId = false;
                              _enabledCardNo = true;
                            }
                          });
                          await CardPreferences.setId(selectedIndex);
                        },
                        selected: row[index].selected,
                        title: Text(row[index].title),
                        trailing: (selectedIndex == index)
                            ? Icon(Icons.check, color: Colors.blueAccent)
                            : null,
                      ),
                      Divider(
                        height: 1,
                        thickness: 2,
                      ),
                    ],
                  ),
                );
              }),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: SizedBox(
                child: Text('ENTER DETAILS'),
                height: 30,
              ),
            ),
            Divider(
              height: 1,
              thickness: 2,
            ),
            buildSettingsRow(
                'Card Id', () => CardId(), context, _enabledCardId),
            buildSettingsRow(
                'Card Number', () => CardNumber(), context, _enabledCardNo),
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

Container buildSettingsRow(String title, Widget Function() createPage,
    BuildContext context, bool _enabled) {
  return Container(
    child: Column(
      children: [
        ListTile(
          tileColor: Colors.white,
          onTap: () {
            if (_enabled == true)
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => createPage()));
          },
          title: Text(
            title,
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
    ),
  );
}
