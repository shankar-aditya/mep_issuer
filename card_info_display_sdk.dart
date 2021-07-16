import 'package:flutter/material.dart';
import 'package:mep_issuer/res/dimens.dart';
import 'package:mep_issuer/res/strings.dart';
import 'package:mep_issuer/pages/card_id.dart';
import 'package:mep_issuer/models/app_class.dart';
import 'package:mep_issuer/pages/card_number.dart';
import 'package:mep_issuer/widgets/back_button.dart';
import 'package:mep_issuer/widgets/listview_row.dart';
import 'package:mep_issuer/utils/card_preferences.dart';
import 'package:mep_issuer/utils/timestamp_preferences.dart';
import 'package:mep_issuer/utils/request_id_preferences.dart';

class CardInfoDisplaySDK extends StatefulWidget {
  CardInfoDisplaySDK({Key key}) : super(key: key);

  @override
  _CardInfoDisplaySDKState createState() => _CardInfoDisplaySDKState();
}

class _CardInfoDisplaySDKState extends State<CardInfoDisplaySDK> {
  List<Data> row = <Data>[
    Data(0, '$cardInfoEntryRow1'),
    Data(1, '$cardInfoEntryRow2'),
  ];

  List<Data> row2 = <Data>[
    Data(0, '$setUpRow1'),
    Data(1, '$setUpRow2'),
  ];

  List<Data> row3 = <Data>[
    Data(0, '$verificationRow1'),
    Data(1, '$verificationRow2'),
  ];

  int selectedIndex;
  int selectedSetUpIndex;
  int selectedVerificationIndex;

  String requestId = '';
  String timeStamp = '';

  TextEditingController _controller = new TextEditingController();
  TextEditingController _timeStampController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedIndex = (CardPreferences.getId() ?? 0);
    selectedSetUpIndex = (CardPreferences.getStepUpId() ?? 0);
    selectedVerificationIndex = (CardPreferences.getVerificationId() ?? 0);
    requestId = RequestIdPreferences.getRequestId() ?? '';
    timeStamp = TimeStampPreferences.getTime() ?? '';

    setState(() {
      _controller.text = requestId;
      _timeStampController.text = timeStamp;
    });

    _controller.addListener(() {
      setState(() {});
    });
    _timeStampController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(),
          centerTitle: true,
          title: Text(
            '$cardInfoSdkScreen',
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: ListView(
            children: [
              CustomRowHeader(
                title: '$entryModeInfo',
              ),
              SelectRow(
                row: row,
                selectedIndex: selectedIndex,
                onTapAlso: (selectedIndex) async {
                  setState(() {
                    this.selectedIndex = selectedIndex;
                  });
                  await CardPreferences.setId(selectedIndex);
                  await CardPreferences.setCardDisplayEntryMode(row.elementAt(selectedIndex).title);
                },
              ),
              CustomRowHeader(
                title: '$detailsInfo',
              ),
              CustomRow(
                title: '$cardInfoEntryRow2',
                onTap: CardId(),
              ),
              CustomRow(
                title: '$cardInfoEntryRow1',
                onTap: CardNumber(),
              ),
              CustomRowHeader(
                title: '$setUpHeader',
              ),
              SelectRow(
                row: row2,
                selectedIndex: selectedSetUpIndex,
                onTapAlso: (selectedIndex) async {
                  await CardPreferences.setStepUpId(selectedIndex);
                  await CardPreferences.setStepUpIdName(row2.elementAt(selectedIndex).title);
                },
              ),
              CustomRowHeader(
                title: '$verificationHeader',
              ),
              SelectRow(
                row: row3,
                selectedIndex: selectedVerificationIndex,
                onTapAlso: (selectedVerificationIndex) async {
                  await CardPreferences.setVerificationId(
                      selectedVerificationIndex);
                },
              ),
              CustomTextField(
                header: '$timeStampHeader',
                title: '$timeStampTitle',
                hintText: '$timeStampHint',
                controller: _timeStampController,
                onChangedSave: (time) async {
                  setState(() {
                    this.timeStamp = time;
                  });
                  await TimeStampPreferences.setTime(this.timeStamp);
                },
                description: '$timeStampMessage',
              ),
              CustomTextField(
                header: '$requestedIdHeader',
                title: '$requestedIdTitle',
                hintText: '$requestedIdHint',
                controller: _controller,
                onChangedSave: (text) async {
                  setState(() {
                    this.requestId = text;
                  });
                  await RequestIdPreferences.setRequestId(text);
                },
                description: '$requestedIdMessage',
              ),
              SizedBox(
                height: sizedBoxHeight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
