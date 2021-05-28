import 'package:flutter/material.dart';

class AppId extends StatefulWidget {
  AppId({Key key}) : super(key: key);

  @override
  _AppIdState createState() => _AppIdState();
}

class _AppIdState extends State<AppId> {
  List<App> apps = <App>[
    App(0, 'Blue & Gold'),
    App(1, 'MEP Demo App'),
    App(2, 'Connected Card'),
    App(3, 'Sim Card'),
    App(4, 'Custom App Id')
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
          'App Id',
        ),
      ),
      // body: Container(
      //   padding: EdgeInsets.only(left: 16, top: 25, right: 16),
      //   child: ListView(
      //     physics: NeverScrollableScrollPhysics(),
      //     children: List.generate(apps.length, (index) {
      //       return ListTile(
      //         onTap: () {
      //           setState(() {
      //             selectedIndex = index;
      //           });
      //         },
      //         selected: apps[index].selected,
      //         title: Text(apps[index].title),
      //         trailing: (selectedIndex == index)
      //             ? Icon(Icons.check, color: Colors.blueAccent)
      //             : null,
      //       );
      //     }),
      //   ),
      // ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Divider(
              height: 15,
              thickness: 2,
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(apps.length, (index) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  selected: apps[index].selected,
                  title: Text(apps[index].title),
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
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Custom App Id'),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "External App Id",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class App {
  final int id;
  final String title;
  bool selected = false;

  App(this.id, this.title);
}
