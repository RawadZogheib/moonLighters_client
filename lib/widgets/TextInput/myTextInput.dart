import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class myTextInput extends StatelessWidget {
  var textString;
  var onChange;
  var keybType;
  bool obscure;
  var maxLength;
  var widthh;
  var colBlue, colBlue_1, colBlue_2;
  var labelText;

  myTextInput(
      {required this.textString,
        required this.labelText,
        this.keybType,
        this.maxLength,
        this.widthh,
        this.colBlue,
        this.colBlue_1,
        this.colBlue_2,
        required this.obscure,
        this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widthh,
      child: TextFormField(
        onChanged: onChange,
        textAlign: TextAlign.center,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            hintText: this.textString,
            hintStyle: TextStyle(fontSize: 14.0, color: colBlue_1),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colBlue),
                borderRadius: BorderRadius.circular(10.0)),
            filled: true,
            fillColor: colBlue,
            labelText: labelText,
            labelStyle: TextStyle(fontSize: 14,color: colBlue_1),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colBlue_1),
                borderRadius: BorderRadius.circular(10))),
        textInputAction: TextInputAction.next,
        keyboardType: this.keybType,
        obscureText: this.obscure,
        maxLength: this.maxLength,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r"\s")),
        ],),
    );
  }
}