
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client/globals/globals.dart' as globals;



class myErrorText extends StatelessWidget {
  var errorText;
  var color;
  myErrorText({this.errorText,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        errorText,
        style: TextStyle(
          color: color,
        ),),
    );
  }
}
