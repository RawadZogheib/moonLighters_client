import 'package:flutter/material.dart';
import 'package:flutter_client/page/FirstPage.dart';
import 'package:flutter_client/page/Login.dart';
import 'package:flutter_client/page/Registration.dart';
import 'package:flutter_client/page/contrat.dart';
import 'package:sizer/sizer.dart';

void main() {
  debugShowCheckedModeBanner: false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          //home: FirstPage(),
          initialRoute: '/FirstPage',
          routes: {
            '/Login': (context) => login(),
            '/Registration': (context) => registration(),
            '/Contrat': (context) => contrat(),
            '/FirstPage': (context) => FirstPage(),
          });
    });
  }
}