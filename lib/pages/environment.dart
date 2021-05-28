import 'package:flutter/material.dart';

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
          'Environment',
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.s,
                  children: [
                    Text('Selected'),
                    // SizedBox(
                    //   width: 5.0,
                    // ),
                    // Expanded(
                    //   // child: TextField(
                    //   //   decoration: InputDecoration(
                    //   //     border: InputBorder.none,
                    //   //   ),
                    //   // ),
                    //   child: Text('$result'),
                    // ),
                    Text('$result'),
                  ],
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
                "Changing this will restart the app upon leaving the dev dashboard."),
            Divider(
              height: 15,
              thickness: 2,
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(env.length, (index) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      result = env[selectedIndex].title;
                    });
                  },
                  selected: env[index].selected,
                  title: Text(env[index].title),
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
