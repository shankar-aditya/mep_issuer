import 'package:flutter/material.dart';
import 'package:mep_issuer/res/strings.dart';
import 'package:mep_issuer/models/app_class.dart';
import 'package:mep_issuer/res/dimens.dart';
import 'package:mep_issuer/widgets/back_button.dart';
import 'package:mep_issuer/widgets/listview_row.dart';
import 'package:mep_issuer/utils/user_env_preferences.dart';

class Environment extends StatefulWidget {
  Environment({Key key}) : super(key: key);

  @override
  _EnvironmentState createState() => _EnvironmentState();
}

class _EnvironmentState extends State<Environment> {
  List<Data> env = <Data>[
    Data(0, '$environmentRow1'),
    Data(1, '$environmentRow2'),
    Data(2, '$environmentRow3'),
    Data(3, '$environmentRow4'),
    Data(4, '$environmentRow5'),
    Data(5, '$environmentRow6'),
    Data(6, '$environmentRow7')
  ];

  int selectedIndex;
  String result = '';

  @override
  void initState() {
    super.initState();

    selectedIndex = UserEnvPreferences.getInd() ?? 0;
    if (selectedIndex != -1) {
      result = env.elementAt(selectedIndex).title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        centerTitle: true,
        title: Text(
          '$environmentScreen',
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        child: Column(
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
              child: Text("$environmentInfoMessage"),
            ),
            SelectRow(
              row: env,
              selectedIndex: selectedIndex,
              onTapAlso: (selectedIndex) async {
                setState(() {
                  this.selectedIndex = selectedIndex;
                  this.result = env[selectedIndex].title;
                });
                await UserEnvPreferences.setInd(selectedIndex);
                await UserEnvPreferences.setEnvName(result);
              },
            ),
          ],
        ),
      ),
    );
  }
}
