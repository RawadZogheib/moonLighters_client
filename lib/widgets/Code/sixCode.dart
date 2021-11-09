import 'package:flutter/cupertino.dart';
import 'package:flutter_client/widgets/Button/myButton.dart';
import 'package:flutter_client/widgets/Code/myCode.dart';
import 'package:flutter_client/globals/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter_client/widgets/Button/myButton.dart';

import 'myCode.dart';


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
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 28.0),
            child: Row(
              children: [
                myCode(textString: , labelText: )

                Padding(
                  padding: const EdgeInsets.all(28.0),
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