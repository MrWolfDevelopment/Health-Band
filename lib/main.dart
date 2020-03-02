import 'package:band_project/Activities/CreateAccount.dart';
import 'package:band_project/Activities/MainApp.dart';
import 'package:band_project/Activities/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:band_project/Activities/Signin.dart';
import 'package:band_project/Activities/CreateAccount.dart';
import 'package:band_project/Activities/Checking.dart';
import 'package:band_project/Activities/VerifyBand.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Band App',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          canvasColor: Colors.transparent,
          textSelectionColor: Color(0xff202D3D).withOpacity(0.9)),
      home: MainApp(),
    );
  }
}
