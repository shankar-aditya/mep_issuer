import 'package:flutter/material.dart';
import 'package:mep_issuer/res/colors.dart';
import 'package:mep_issuer/res/dimens.dart';

class FormRow extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  FormRow({Key key, this.title, this.hintText = '', this.controller})
      : super(key: key);

  @override
  _FormRowState createState() => _FormRowState();
}

class _FormRowState extends State<FormRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.only(left: formLeftPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: formTitleBoxWidth,
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: formTextFontSize,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
