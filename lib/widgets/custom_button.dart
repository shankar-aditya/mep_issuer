import 'package:flutter/material.dart';
import 'package:mep_issuer/res/colors.dart';
import 'package:mep_issuer/res/dimens.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  const CustomButton({Key key, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2 * paddingHomeButton),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: sizedBoxHeight),
          FlatButton(
            color: backgroundColor,
            onPressed: () {
              onPressed();
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Text(
              title,
              style: TextStyle(
                fontSize: buttonFontSize,
                color: buttonTextColor,
              ),
            ),
            height: buttonHeight,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
          ),
        ],
      ),
    );
  }
}
