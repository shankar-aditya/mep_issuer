import 'package:flutter/material.dart';
import 'package:mep_issuer/pages/features.dart';
import 'package:mep_issuer/pages/settings.dart';
import 'package:mep_issuer/res/strings.dart';
import 'package:mep_issuer/res/dimens.dart';
import 'package:mep_issuer/res/colors.dart';
import 'dart:io';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    {
      // if (Platform.isIOS) {
      //   return Scaffold(
      //     appBar: AppBar(
      //       actions: <Widget>[
      //         IconButton(
      //           icon: Icon(Icons.settings),
      //           onPressed: () {
      //             Navigator.of(context).push((MaterialPageRoute(
      //                 builder: (BuildContext context) => SettingsPage())));
      //           },
      //         )
      //       ],
      //     ),
      //     body: Container(
      //       decoration: BoxDecoration(
      //         color: backgroundColorHome,
      //       ),
      //       padding: EdgeInsets.all(horizontalPadding),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisSize: MainAxisSize.max,
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         children: [
      //           Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(10.0),
      //               border: Border.all(
      //                 color: Colors.black,
      //                 width: 1,
      //               ),
      //             ),
      //             child: ClipRRect(
      //               borderRadius: BorderRadius.circular(8.0),
      //               child: Image.asset(
      //                 'assets/images/landing_screen_logo.png',
      //                 width: 110.0,
      //                 height: 110.0,
      //                 fit: BoxFit.fill,
      //               ),
      //             ),
      //
      //           ),
      //           Container(
      //             padding: EdgeInsets.symmetric(vertical: 10),
      //             child: Text('Welcome to \nMEP Issuer App',
      //               style: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 30,
      //               ),
      //             ),
      //
      //           ),
      //           Container(
      //             padding: EdgeInsets.symmetric(vertical: 10),
      //             child: Text('It\'s a fast and simple way to integrate and test your SDK.'),
      //           ),
      //           Container(
      //             margin: EdgeInsets.symmetric(vertical: 70),
      //             decoration: BoxDecoration(
      //               color: backgroundColor,
      //               borderRadius: BorderRadius.all(Radius.circular(
      //                   borderRadius) //              <--- border radius here
      //               ),
      //             ),
      //             child: ListTile(
      //               onTap: () {
      //                 Navigator.of(context).push(MaterialPageRoute(
      //                     builder: (BuildContext context) => FeaturesHome()));
      //               },
      //               leading: CircleAvatar(
      //                 backgroundImage:
      //                 AssetImage('assets/images/icon_feature.jpg'),
      //               ),
      //               title: Text(
      //                 homeButton,
      //                 style: TextStyle(
      //                   fontSize: homeButtonFontSize,
      //                   color: listTileTextColor,
      //                 ),
      //               ),
      //               subtitle: Text('VIAP SDKs'),
      //               trailing: Icon(
      //                 Icons.arrow_forward_ios,
      //                 color: nextIcon,
      //                 size:12,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   );
      // }
      // else {
        return Scaffold(

          body: Container(
            decoration: BoxDecoration(
              color: backgroundColorHome,
            ),
            padding: EdgeInsets.all(horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(height: 100.0),
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Navigator.of(context).push((MaterialPageRoute(
                            builder: (BuildContext context) =>
                                SettingsPage())));
                      },
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/landing_screen_logo.png',
                      width: 110.0,
                      height: 110.0,
                      fit: BoxFit.fill,
                    ),
                  ),

                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Welcome to \nMEP Issuer App',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),

                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                      'It\'s a fast and simple way to integrate and test your SDK.'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 70),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(
                        borderRadius) //              <--- border radius here
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => FeaturesHome()));
                    },
                    leading: CircleAvatar(
                      backgroundImage:
                      AssetImage('assets/images/icon_feature.jpg'),
                    ),
                    title: Text(
                      homeButton,
                      style: TextStyle(
                        fontSize: homeButtonFontSize,
                        color: listTileTextColor,
                      ),
                    ),
                    subtitle: Text('VIAP SDKs'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: nextIcon,
                      size: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      // }
    }
  }
}
