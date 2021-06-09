import 'package:flutter/material.dart';
import 'package:mep_issuer/utils/user_env_preferences.dart';

class Environment extends StatefulWidget {
  Environment({Key key}) : super(key: key);

  @override
  _EnvironmentState createState() => _EnvironmentState();
}

class _EnvironmentState extends State<Environment> {
  List<Env> env = <Env>[
    Env(0, 'OFFLINE'),
    Env(1, 'VBOX460'),
    Env(2, 'VBOX522'),
    Env(3, 'VBOX538'),
    Env(4, 'AACERT'),
    Env(5, 'SANDBOX'),
    Env(6, 'PRODUCTION')
  ];

  int selectedIndex;
  String result = '';

  @override
  void initState() {
    super.initState();

    result = UserEnvPreferences.getEnv() ?? '';
    selectedIndex = UserEnvPreferences.getInd() ?? -1;
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
            ],
          ),
        ),
        centerTitle: true,
        title: Text(
          'Environment',
        ),
        backgroundColor: Color(0xFFF2F2F7),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 25),
        color: Color(0xfff2f2f7),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Divider(
                  height: 1,
                  thickness: 2,
                ),
                Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Selected',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '$result',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
              thickness: 2,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
                "Changing this will restart the app upon leaving the dev dashboard."),
            Divider(
              height: 1,
              thickness: 2,
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(env.length, (index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () async {
                          setState(() {
                            this.selectedIndex = index;
                            this.result = env[selectedIndex].title;
                          });
                          await UserEnvPreferences.setEnv(result);
                          await UserEnvPreferences.setInd(selectedIndex);
                        },
                        selected: env[index].selected,
                        title: Text(env[index].title),
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
          ],
        ),
      ),
    );
  }
}

class Env {
  final int id;
  final String title;
  bool selected = false;

  Env(this.id, this.title);
}
