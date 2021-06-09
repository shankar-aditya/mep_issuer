import 'package:flutter/material.dart';
import 'package:mep_issuer/pages/home.dart';
import 'package:mep_issuer/utils/app_id_preferences.dart';
import 'package:mep_issuer/utils/user_env_preferences.dart';
import 'package:mep_issuer/utils/card_preferences.dart';
import 'package:mep_issuer/utils/request_id_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserEnvPreferences.init();
  await AppIdPreferences.init();
  await CardPreferences.init();
  await RequestIdPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MEP Issuer',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Home(),
    );
  }
}
