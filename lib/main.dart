import 'package:flutter/material.dart';
import 'package:flutter_client/page/CalendarPage.dart';
import 'package:flutter_client/page/FirstPage.dart';
import 'package:flutter_client/page/Login.dart';
import 'package:flutter_client/page/Registration.dart';
import 'package:flutter_client/page/contrat.dart';
import 'package:flutter_client/page/forgetPassword.dart';
import 'package:flutter_client/page/forgetPassword2.dart';
import 'package:flutter_client/page/project.dart';
import 'package:flutter_client/widgets/code/sixCode.dart';
import 'package:flutter_client/widgets/code/sixCodeForgetPass.dart';
import 'package:flutter_client/widgets/code/sixCodeLogin.dart';
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
            '/Project': (context) => Project(),
            '/FirstPage': (context) => FirstPage(),
            '/sixCode': (context)=>sixCode(),
            '/sixCodeLogin': (context)=>sixCodeLogin(),
            '/sixCodeForgPass': (context)=>sixCodeForgetPass(),
            '/forgetPassword': (context)=>forgetPass(),
            '/CalendarPage' : (context) => CalendarPage(),
            '/forgetPassword2': (context)=>forgetPass2(),

          });
     });
  }
  }
