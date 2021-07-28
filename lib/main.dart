import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mep_issuer/pages/home.dart';
import 'package:mep_issuer/utils/card_no_preferences.dart';
import 'package:mep_issuer/utils/card_preferences.dart';
import 'package:mep_issuer/utils/app_id_preferences.dart';
import 'package:mep_issuer/utils/user_env_preferences.dart';
import 'package:mep_issuer/utils/timestamp_preferences.dart';
import 'package:mep_issuer/utils/request_id_preferences.dart';

import 'res/strings.dart';
import 'res/colors.dart';

Future main() async {

  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await CardPreferences.init();
  await CardNoPreferences.init();
  await AppIdPreferences.init();
  await UserEnvPreferences.init();
  await RequestIdPreferences.init();
  await TimeStampPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '$appTitle',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: primaryColor,
        canvasColor: canvas,
      ),
      home: Home(),
    );
  }
}


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  }
}