
import 'dart:convert';

import 'package:flutter_client/api/my_api.dart';
import 'package:flutter_client/globals/globals.dart' as globals;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client/widgets/Button/myButton.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class myCode extends StatelessWidget {

  var onChange;
  var keybType;
  var color, color_1, color_2;
  var textInputAction;

  myCode(
  {this.keybType,
  this.textInputAction,
  required this.color,
  required this.color_1,
  required this.color_2,
  required this.onChange});

    @override
    Widget build(BuildContext context) {
      return TextFormField(
        onChanged: onChange,
        textAlign: TextAlign.left,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color),
            borderRadius: BorderRadius.circular(10.0)),
          filled: true,
          fillColor: color,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color_1),
          borderRadius: BorderRadius.circular(10)),
        ),
        textInputAction: textInputAction,
        keyboardType: this.keybType,
      );
    }
  }

  // _checkCode() async{
  //   try {
  //     // if(globals.emailLogin != null && globals.passwordLogin != null){
  //     // print(globals.emailLogin);
  //     // print(globals.passwordLogin);
  //     var data = {
  //       'code': globals.sixCode,
  //     };
  //
  //     var res = await CallApi().postData(
  //         data, 'Registration/Model/(Model)registMail.inc.php');
  //     print(res);
  //     print(res.body);
  //     List<dynamic> body = json.decode(res.body);
  //
  //     if()
  //
  //
  //   }catch(e){
  //
  //   }
  // }