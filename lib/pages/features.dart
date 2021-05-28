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
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Image(image: AssetImage('assets/images/Assembled.png')),
            Text(
              'Features',
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/icon_feature.jpg'),
              ),
              title: Text('Digital Wallet'),
              subtitle: Text('Link your card to pay in-store'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/icon_feature.jpg'),
              ),
              title: Text('Display Card UI'),
              subtitle: Text('View your card information'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
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
