import 'package:flutter/material.dart';
import 'package:mep_issuer/pages/features.dart';
import 'package:mep_issuer/pages/settings.dart';
import 'package:mep_issuer/res/strings.dart';
import 'package:mep_issuer/res/dimens.dart';
import 'package:mep_issuer/res/colors.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        appBar: AppBar(
          title: Text('$appTitle'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push((MaterialPageRoute(
                    builder: (BuildContext context) => SettingsPage())));
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: paddingHomeButton),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => FeaturesHome()));
                },
                color: homeButtonColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$homeButton',
                      style: TextStyle(fontSize: homeButtonFontSize),
                    ),
                   SizedBox(width: 30,),
                   Icon(Icons.apps, size: 35,)
                  ],
                ),
                height: homeButtonHeight,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius)),
              ),
            ],
          ),
        ),
        //   body: Container(
        //
        //     padding: EdgeInsets.symmetric(horizontal: paddingHomeButton),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.stretch,
        //       children: [
        //         Container(
        //           decoration: BoxDecoration(
        //             boxShadow: [BoxShadow(
        //               offset: Offset(0,20),blurRadius: 30,color: Colors.black12
        //             )],
        //             color: Colors.white70,
        //             borderRadius: BorderRadius.circular(22),
        //           ),
        //           child: Row(
        //             children: <Widget>[
        //               Container(
        //                 padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
        //                 height:60,
        //                 width: 250,
        //                 child: Text(homeButton,
        //       style: TextStyle(fontSize: 1.1*homeButtonFontSize),),
        //                 decoration: BoxDecoration(
        //                   color: Colors.blue,
        //                   borderRadius: BorderRadius.only(
        //                     bottomLeft: Radius.circular(90),
        //                     topLeft: Radius.circular(90),
        //                     bottomRight: Radius.circular(200)
        //                   )
        //                 ),
        //               ),
        //               Icon(Icons.apps, size: 35,)
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   )
      );
    }
  }
}
