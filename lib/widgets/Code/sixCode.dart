import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client/widgets/Button/myButton.dart';
import 'package:flutter_client/widgets/Code/myCode.dart';
import 'package:flutter_client/globals/globals.dart' as globals;


String? firstNb = null;
String? secondNb = null;
String? thirdNb = null;
String? fourthNb = null;
String? fifthNb = null;
String? sixNb = null;



class sixCode extends StatelessWidget {
  const sixCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Row(
            children: [
              myCode(keybType: TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.next,
                  color: globals.colCode,
                  color_1: globals.colCode_1,
                  color_2: globals.colCode_2,
                  onChange: (value){
                    firstNb = value;
                  }),

              myCode(keybType: TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.next,
                  color: globals.colCode,
                  color_1: globals.colCode_1,
                  color_2: globals.colCode_2,
                  onChange: (value){
                    secondNb = value;
                  }),

              myCode(keybType: TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.next,
                  color: globals.colCode,
                  color_1: globals.colCode_1,
                  color_2: globals.colCode_2,
                  onChange: (value){
                    thirdNb = value;
                  }),

              Container(
                child: Text("-",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700,color: Colors.black),),
              ),

              myCode(keybType: TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.next,
                  color: globals.colCode,
                  color_1: globals.colCode_1,
                  color_2: globals.colCode_2,
                  onChange: (value){
                    fourthNb = value;
                  }),

              myCode(keybType: TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.next,
                  color: globals.colCode,
                  color_1: globals.colCode_1,
                  color_2: globals.colCode_2,
                  onChange: (value){
                    fifthNb = value;
                  }),

              myCode(keybType: TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.next,
                  color: globals.colCode,
                  color_1: globals.colCode_1,
                  color_2: globals.colCode_2,
                  onChange: (value){
                    sixNb = value;
                  }),
            ],
          ),

          Center(
            child: Container(
              child: InkWell(
                child: btn(btnText: 'Send'),
                onTap: (){
                  globals.sixCodeNb = '${firstNb}'+'${secondNb}'+'${thirdNb}'+'${fourthNb}'+'${fifthNb}'+'${sixNb}';
                  // _checkCode();
                },
              )),
          ),
        ],
      ),
    );
  }
}