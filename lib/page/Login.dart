
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_client/api/my_api.dart';
import 'package:flutter_client/widgets/Button/myButton.dart';
<<<<<<< Updated upstream
import 'package:flutter_client/widgets/Other/errorAlertDialog.dart';
=======
import 'package:flutter_client/widgets/Code/codeDialog.dart';
import 'package:flutter_client/widgets/Code/sixCode.dart';
import 'package:flutter_client/widgets/Other/ErrorAlertDialog.dart';
import 'package:flutter_client/widgets/TextInput/myErrorText.dart';
>>>>>>> Stashed changes
import 'package:flutter_client/widgets/TextInput/myTextInput.dart';
import 'package:flutter_client/globals/globals.dart' as globals;

Color colEmail = globals.blue;               //email
Color colEmail_1 = globals.blue_1;
Color colEmail_2 = globals.blue_2;


Color colPass = globals.blue;               //password
Color colPass_1 = globals.blue_1;
Color colPass_2 = globals.blue_2;

String errTxtEmail = '';    //email error
Color colErrTxtEmail = globals.transparent;
String errTxtPass = '';     //password error
Color colErrTxtPass = globals.transparent;
String errTxt = '';         //else error
Color colErrTxt = globals.transparent;

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.whiteBlue,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Login",style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.black
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle,size: 120.0,),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 8.0, right: 20.0, bottom: 8.0),
                  child: myTextInput(textString: "Enter Your Email Address",
                      labelText: 'Enter Your Email Address',
                      colBlue: colEmail,
                      colBlue_1: colEmail_1,
                      colBlue_2: colEmail_2,
                      textInputAction: TextInputAction.next,
                      spaceAllowed: false,
                      obscure: false ,
                      onChange: (value){
                        globals.emailLogin = value;
                      }),
                ),

                myErrorText(errorText: errTxtEmail, color: colErrTxtEmail),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 8.0, right: 20.0, bottom: 8.0),
                  child: myTextInput(
                    textString: "Enter Your Password",
                    labelText: 'Enter Your Password',
                    colBlue: colPass,
                    colBlue_1: colPass_1,
                    colBlue_2: colPass_2,
                    maxLines: 1,
                    textInputAction: TextInputAction.none,
                    spaceAllowed: false,
                    obscure: true,
                    onChange: (value){
                      globals.passwordLogin = value;
                      //print(globals.passwordLogin);
                    },
                  ),
                ),

                myErrorText(errorText: errTxtPass, color: colErrTxtPass),

                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: InkWell(
                    child: btn(btnText: "Submit"),
                    onTap: (){
                      try {
                        _LoginCtrl();
                      }catch(e){
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => ErrorAlertDialog(
                                message: globals.errorException));
                      }
                    },
                  ),
                ),

                myErrorText(errorText: errTxt, color: colErrTxt),

                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("didn't have an account? "),
                      Row(
                        children: [
                          InkWell(
                            child: Text("create new one",style: TextStyle(
                                color: Colors.blue
                            ),),
                            onTap: (){
                              Navigator.pushNamed(context, '/Registration');
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  _LoginCtrl(){
    bool isEmpty = false;

     errTxtEmail = '';
     errTxtPass = '';


    if(globals.emailLogin != null && globals.emailLogin != ''){
      setState(() {
        colEmail = Colors.blue.shade50;
        colEmail_1 = Colors.blue.shade900;
        colEmail_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    }else{
      isEmpty = true;
      setState(() {
        colEmail = Colors.red.shade50;
        colEmail_1 = Colors.red.shade900;
        colEmail_2 = Colors.red.shade900.withOpacity(0.5);
        errTxtEmail = globals.error7;
        colErrTxtEmail = globals.red_1;
      });
    }

    if(globals.passwordLogin != null && globals.passwordLogin != ''){
      setState(() {
        colPass = Colors.blue.shade50;
        colPass_1 = Colors.blue.shade900;
        colPass_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    }else{
      isEmpty = true;
      setState(() {
        colPass = Colors.red.shade50;
        colPass_1 = Colors.red.shade900;
        colPass_2 = Colors.red.shade900.withOpacity(0.5);
        errTxtPass = globals.error7;
        colErrTxtPass = globals.red_1;
      });
    }

    if(isEmpty == false){
      _verifc();
    }else{
      //do nothing
    }

  }



  _verifc() async{
    errTxt = '';

    try {
      // if(globals.emailLogin != null && globals.passwordLogin != null){
      // print(globals.emailLogin);
      // print(globals.passwordLogin);
      var data = {
        'version': globals.version,
        'email': globals.emailLogin,
        'password': globals.passwordLogin
      };

      var res = await CallApi().postData(
          data, 'Login/Control/(Control)Login.php');
      print(res);
      print(res.body);
      List<dynamic> body = json.decode(res.body);

      if (body[0] == "success") {
<<<<<<< Updated upstream
        Navigator.pushNamed(context, '/Contrat');
=======
        // Navigator.pushNamed(context, '/home');
        showDialog(
            context: context,
            builder: (BuildContext context) => codeDialog()).then((exit) {
          setState(() {
            _nullTextCode();
          });
        });
>>>>>>> Stashed changes
      }else if (body[0] == "errorToken") {
        setState(() {
          errTxt = globals.errorToken;
          colErrTxt = globals.red_1;
        });
      }else if (body[0] == "errorVersion") {
        setState(() {
          errTxt = "Your version: " + globals.version + "\n" + globals.errorVersion;
          colErrTxt = globals.red_1;
        });
      }else if (body[0] == "error8") {
        colEmail = Colors.red.shade50;
        colEmail_1 = Colors.red.shade900;
        colEmail_2 = Colors.red.shade900.withOpacity(0.5);
        colPass = Colors.red.shade50;
        colPass_1 = Colors.red.shade900;
        colPass_2 = Colors.red.shade900.withOpacity(0.5);
        setState(() {
          errTxt = globals.error8;
          colErrTxt = globals.red_1;
        });
      } else{
        setState(() {
          errTxt = globals.errorElse;
          colErrTxt = globals.red_1;
        });
      }

    }catch(e){
      print(e);
      setState(() {
        errTxt = globals.errorException;
        colErrTxt = globals.red_1;
      });
    }
  }
  _nullTextCode(){
    firstNb = null;
    secondNb = null;
    thirdNb = null;
    fourthNb = null;
    fifthNb = null;
    sixNb = null;
  }
}