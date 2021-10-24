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
  var coli,coli_1,coli_2;
  var labelText;

  myTextInput({required this.textString, required this.labelText, this.keybType, this.maxLength, this.widthh, this.coli, this.coli_1, this.coli_2, required this.obscure, this.onChange});

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
            hintStyle: TextStyle(
                fontSize: 15.0,
                color: coli_1
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: coli),
                borderRadius: BorderRadius.circular(10.0)
            ),
            filled: true,
            fillColor: coli,
            labelText: labelText,
            labelStyle: TextStyle(
              color: coli_1
            ),
            border: InputBorder.none,

            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: coli_1),
                borderRadius: BorderRadius.circular(10)
            )

        ),
        textInputAction: TextInputAction.next,
        keyboardType: this.keybType,
        obscureText: this.obscure,
        maxLength: this.maxLength,
        inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'[a-zA-Z0-9!@#$%^.&*)(_]'))]
      ),
    );
  }
}
