import 'package:flutter/material.dart';
import 'package:mep_issuer/pages/card_id.dart';
import 'package:mep_issuer/pages/card_number.dart';
import 'package:mep_issuer/utils/card_preferences.dart';
import 'package:mep_issuer/utils/request_id_preferences.dart';

class CardInfoDisplaySDK extends StatefulWidget {
  CardInfoDisplaySDK({Key key}) : super(key: key);

  @override
  _CardInfoDisplaySDKState createState() => _CardInfoDisplaySDKState();
}

class _CardInfoDisplaySDKState extends State<CardInfoDisplaySDK> {
  List<Psdk> row = <Psdk>[
    Psdk(0, 'Card Number'),
    Psdk(1, 'Card Id'),
  ];

  List<SetUp> row2 = <SetUp>[
    SetUp(0, 'Visa SDK'),
    SetUp(1, 'Mobile App'),
  ];

  List<Verification> row3 = <Verification>[
    Verification(0, 'OTP'),
    Verification(1, 'None'),
  ];

  int selectedIndex;
  int selectedSetUpIndex;
  int selectedVerificationIndex;

  String requestId = '';

  TextEditingController _controller = new TextEditingController();

  bool _enabledCardId = false;
  bool _enabledCardNo = false;

  @override
  void initState() {
    super.initState();
    selectedIndex = (CardPreferences.getId() ?? -1);
    selectedSetUpIndex = (CardPreferences.getSetUpId() ?? -1);
    selectedVerificationIndex = (CardPreferences.getVerificationId() ?? -1);
    requestId = RequestIdPreferences.getRequestId() ?? '';

    setState(() {
      _controller.text = requestId;
    });

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
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
            'Card Info Display SDK',
          ),
          backgroundColor: Color(0xFFF2F2F7),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 25),
          color: Color(0xfff2f2f7),
          child: ListView(
            // physics: NeverScrollableScrollPhysics(),
            children: [
              // SizedBox(
              //   child: Text('DATA ENTRY MODE'),
              //   height: 30,
              // ),
              Container(
                padding: EdgeInsets.only(left: 15, bottom: 10),
                child: Text('DATA ENTRY MODE'),
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(row.length, (index) {
                  return ListTile(
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
                  );
                }),
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, bottom: 10, top: 10),
                child: Text('ENTER DETAILS'),
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
              buildSettingsRow(
                  'Card Id', () => CardId(), context, _enabledCardId),
              buildSettingsRow(
                  'Card Number', () => CardNumber(), context, _enabledCardNo),
              Divider(
                height: 1,
                thickness: 2,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, bottom: 10, top: 10),
                child: Text('STEP UP TYPE'),
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(row2.length, (index) {
                  return ListTile(
                    tileColor: Colors.white,
                    onTap: () async {
                      setState(() {
                        this.selectedSetUpIndex = index;
                      });
                      await CardPreferences.setSetUpId(selectedSetUpIndex);
                    },
                    selected: row2[index].selected,
                    title: Text(row2[index].title),
                    trailing: (selectedSetUpIndex == index)
                        ? Icon(Icons.check, color: Colors.blueAccent)
                        : null,
                  );
                }),
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, bottom: 10, top: 10),
                child: Text('CARD OWNER VERIFICATION METHOD'),
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(row3.length, (index) {
                  return ListTile(
                    tileColor: Colors.white,
                    onTap: () async {
                      setState(() {
                        this.selectedVerificationIndex = index;
                      });
                      await CardPreferences.setVerificationId(
                          selectedVerificationIndex);
                    },
                    selected: row3[index].selected,
                    title: Text(row3[index].title),
                    trailing: (selectedVerificationIndex == index)
                        ? Icon(Icons.check, color: Colors.blueAccent)
                        : null,
                  );
                }),
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, bottom: 10, top: 10),
                child: Text('SECONDS'),
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, bottom: 0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Card Owner Verified At'),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: "Minus times in seconds",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, bottom: 0),
                child: Text(
                    'Entered value will be minus (-) with current timestamp'),
              ),

              Container(
                padding: EdgeInsets.only(left: 15, bottom: 10, top: 10),
                child: Text('REQUEST ID'),
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, bottom: 0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Request ID'),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Request ID',
                          border: InputBorder.none,
                          // _controller.text.isEmpty
                          //     ? Container(
                          //         width: 0,
                          //       )
                          //     :
                          suffixIcon: IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () async {
                              setState(() {
                                this.requestId = requestId;
                              });
                              await RequestIdPreferences.setRequestId(
                                  requestId);
                            },
                          ),
                        ),
                        onChanged: (requestId) => setState(
                          () => this.requestId = requestId,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, bottom: 25),
                child: Text(
                    'Entered value will be used in Mobile type Step up flow'),
              ),
            ],
          ),
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

class SetUp {
  final int id;
  final String title;
  bool selected = false;

  SetUp(this.id, this.title);
}

class Verification {
  final int id;
  final String title;
  bool selected = false;

  Verification(this.id, this.title);
}

ListTile buildSettingsRow(String title, Widget Function() createPage,
    BuildContext context, bool _enabled) {
  return ListTile(
    tileColor: Colors.white,
    onTap: () {
      if (_enabled == true)
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => createPage()));
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
  );
}
