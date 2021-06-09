import 'package:flutter/material.dart';

class FeaturesHome extends StatefulWidget {
  FeaturesHome({Key key}) : super(key: key);

  @override
  _FeaturesHomeState createState() => _FeaturesHomeState();
}

class _FeaturesHomeState extends State<FeaturesHome> {
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
              // Text('MEP Issuer'),
            ],
          ),
        ),
        centerTitle: true,
        title: Text(
          'FDNB BANK',
        ),
        backgroundColor: Color(0xFFF2F2F7),
      ),
      body: Container(
        color: Color(0xfff2f2f7),
        // padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Image(image: AssetImage('assets/images/Assembled.png')),
            Row(
              children: [
                SizedBox(
                  width: 18,
                ),
                Text('Features', style: TextStyle(fontSize: 18)),
              ],
            ),
            Divider(
              height: 1,
              thickness: 2,
            ),
            ListTile(
              tileColor: Colors.white,
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/icon_feature.jpg'),
              ),
              title: Text(
                'Digital Wallet',
                style: TextStyle(
                  color: Color(0xff000000),
                ),
              ),
              subtitle: Text('Link your card to pay in-store'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xff000000),
              ),
              onTap: () {},
            ),
            Divider(
              height: 1,
              thickness: 2,
            ),
            ListTile(
              tileColor: Colors.white,
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/icon_feature.jpg'),
              ),
              title: Text(
                'Display Card UI',
                style: TextStyle(
                  color: Color(0xff000000),
                ),
              ),
              subtitle: Text('View your card information'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xff000000),
              ),
              onTap: () {},
            ),
            Divider(
              height: 1,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
