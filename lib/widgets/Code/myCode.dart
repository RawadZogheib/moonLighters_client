import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class myCode extends StatelessWidget {
  var textString;
  var onChange;
  var keybType;
  var colBlue, colBlue_1, colBlue_2;
  var textInputAction;
  var labelText;

  myCode(
      {required this.textString,
        required this.labelText,
        this.keybType,
        this.colBlue,
        this.colBlue_1,
        this.colBlue_2,
        this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 1,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly
      ],
      onChanged: onChange,
      textAlign: TextAlign.left,
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
        alignLabelWithHint: true,
        labelStyle: TextStyle(fontSize: 14.0,color: colBlue_1),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colBlue_1),
            borderRadius: BorderRadius.circular(10)),
      ),
      keyboardType: this.keybType,
    );
  }
}