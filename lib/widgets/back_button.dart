import 'package:flutter/material.dart';
import 'package:mep_issuer/res/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: appBarBackIcon,
      ),
    );
  }
}
