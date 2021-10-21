import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class textInput extends StatelessWidget {
  var textString;
  var onChange;
  var keybType;
  bool obscure;
  var maxLength;
  var widthh;
  var coli,coli_1,coli_2;

  textInput({required this.textString, this.keybType, this.maxLength,this.widthh,this.coli,this.coli_1,this.coli_2, required this.obscure, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widthh,
      child: TextField(
        onChanged: onChange,
        textAlign: TextAlign.center,
        cursorColor: Colors.yellowAccent,

        decoration: InputDecoration(
            hintText: this.textString,
            hintStyle: TextStyle(
                color: coli
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: coli_1),
                borderRadius: BorderRadius.circular(10.0)
            ),
            filled: true,
            fillColor: coli_2,

            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: coli_1),
                borderRadius: BorderRadius.circular(10)
            )

        ),
        keyboardType: this.keybType,
        obscureText: this.obscure,
        maxLength: this.maxLength,
        inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'[a-zA-Z0-9!@#$%^.&*)(_]'))]
      ),
    );
  }
}
