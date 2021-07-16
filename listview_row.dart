import 'package:flutter/material.dart';
import 'package:mep_issuer/res/dimens.dart';
import 'package:mep_issuer/res/colors.dart';
import 'package:mep_issuer/models/app_class.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final Widget onTap;
  final bool enabled;
  const CustomRow({Key key, this.title, this.onTap, this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalRowPadding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(
                rowBorderRadius) //              <--- border radius here
            ),
      ),
      child: ListTile(
        onTap: () {
          if (enabled == true)
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => onTap));
        },
        title: Text(
          '$title',
          style: TextStyle(
            fontSize: rowTextFontSize,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: nextIcon,
          size: nextIconSize,
        ),
      ),
    );
  }
}

class CustomRowHeader extends StatelessWidget {
  final String title;
  final double fontsize;
  const CustomRowHeader(
      {Key key, this.title, this.fontsize = rowHeaderFontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: rowHeaderLeftPadding,
          top: rowHeaderTopPadding,
          bottom: rowHeaderBottomPadding),
      child: Text('$title', style: TextStyle(fontSize: fontsize)),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget onTap;
  const CustomListTile({Key key, this.title, this.subtitle, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalRowPadding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(
                borderRadius) //              <--- border radius here
            ),
      ),
      child: ListTile(
        onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => onTap));
        },
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/icon_feature.jpg'),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: listTileTextColor,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: nextIcon,
          size: nextIconSize,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SelectRow extends StatefulWidget {
  Future<dynamic> f;
  int selectedIndex;
  final List<Data> row;
  Function onTapAlso;
  SelectRow({Key key, this.row, this.selectedIndex, this.onTapAlso, this.f})
      : super(key: key);

  @override
  _SelectRowState createState() => _SelectRowState();
}

class _SelectRowState extends State<SelectRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(widget.row.length, (index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: verticalRowPadding),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(
                      rowBorderRadius) //              <--- border radius here
                  ),
            ),
            child: ListTile(
              onTap: () async {
                setState(() {
                  this.widget.selectedIndex = index;
                });
                widget.onTapAlso(index);
              },
              selected: widget.row[index].selected,
              title: Text(widget.row[index].title),
              trailing: (widget.selectedIndex == index)
                  ? Icon(Icons.check, color: selectedColor)
                  : null,
            ),
          );
        }),
      ),
    );
  }
}

class CustomRowWithText extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomRowWithText({Key key, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: verticalRowMargin),
      padding: EdgeInsets.symmetric(
          vertical: verticalRowPadding, horizontal: horozontalRowPadding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(
                rowBorderRadius) //              <--- border radius here
            ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title',
            style: TextStyle(fontSize: rowTextFontSize),
          ),
          SizedBox(width: sizedBoxWidth),
          Text(
            '$subtitle',
            style: TextStyle(fontSize: rowSubtitleFontSize),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final String title;
  final String header;
  final String hintText;
  final String description;
  final ValueChanged<String> onChangedSave;
  final TextEditingController controller;
  final bool enabled;
  CustomTextField(
      {Key key,
      this.title,
      this.header,
      this.hintText = '',
      this.description = '',
      this.controller,
      this.onChangedSave,
      this.enabled = true})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRowHeader(
            title: widget.header,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: verticalRowMargin, horizontal: horozontalRowMargin),
            padding: EdgeInsets.symmetric(
                vertical: verticalRowPadding, horizontal: horozontalRowPadding),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(
                      rowBorderRadius) //              <--- border radius here
                  ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(widget.title),
                SizedBox(
                  width: sizedBoxWidth,
                ),
                Expanded(
                  child: TextField(
                    enabled: widget.enabled,
                    controller: widget.controller,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      border: InputBorder.none,
                    ),
                    onChanged: widget.onChangedSave,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: descriptionLeftPadding),
            child: Text(widget.description),
          ),
        ],
      ),
    );
  }
}
