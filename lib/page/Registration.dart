
import 'dart:convert';

import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_client/api/my_api.dart';
import 'package:flutter_client/globals/globals.dart' as globals;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client/widgets/Button/myButton.dart';
import 'package:flutter_client/widgets/DateOfBirth/myDateOfBirth.dart';
import 'package:flutter_client/widgets/Other/ErrorAlertDialog.dart';
import 'package:flutter_client/widgets/RadioButton/myRadioButton.dart';
import 'package:flutter_client/widgets/TextInput/myErrorText.dart';
import 'package:flutter_client/widgets/TextInput/myTextInput.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

RegExp express = new RegExp(r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[*.!@#$%^&:,?_-]).{8,}$");
RegExp exp = new RegExp(r"^[a-zA-Z0-9_\.]*$", caseSensitive: false);
RegExp mailExp = new RegExp("[a-zA-Z0-9]+@(g|hot)mail.com", caseSensitive: false);
RegExp phoneExp = new RegExp("[0-9]{8}");

int id = 0;     // call it for text error

Color colFName = globals.blue;               //fname
Color colFName_1 = globals.blue_1;
Color colFName_2 = globals.blue_2;

Color colLName = globals.blue;               //lname
Color colLName_1 = globals.blue_1;
Color colLName_2 = globals.blue_2;


Color colUserName = globals.blue;                //username
Color colUserName_1 = globals.blue_1;
Color colUserName_2 = globals.blue_2;


Color colPass = globals.blue;               //password
Color colPass_1 = globals.blue_1;
Color colPass_2 = globals.blue_2;

Color colRePass = globals.blue;               //repassword
Color colRePass_1 = globals.blue_1;
Color colRePass_2 = globals.blue_2;


Color colPhoneNb = globals.blue;               //phoneNumber
Color colPhoneNb_1 = globals.blue_1;
Color colPhoneNb_2 = globals.blue_2;

Color colEmail = globals.blue;               //email
Color colEmail_1 = globals.blue_1;
Color colEmail_2 = globals.blue_2;

Color colRadioMale = globals.blue;              // background color for gender button
Color colRadioMale_1 = globals.blue_1;
Color colRadioFem = globals.blue;
Color colRadioFem_1 = globals.blue_1;

Color colGender = globals.transparent;             //genderError

Color colDateBirth = globals.transparent;

Color colErrorText = globals.transparent;       // making text for textField errors


class registration extends StatefulWidget {
  const registration({Key? key}) : super(key: key);

  @override
  _registrationState createState() => _registrationState();
}

class _registrationState extends State<registration> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.whiteBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign up",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Create Your Account", style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 8.0, right: 20.0, bottom: 8.0),
                        child: myTextInput(
                          textString: "First Name",
                          labelText: 'First Name',
                          colBlue: colFName,
                          colBlue_1: colFName_1,
                          colBlue_2: colFName_2,
                          textInputAction: TextInputAction.next,
                          spaceAllowed: false,
                          obscure: false,
                          onChange: (value) {
                            globals.fName = value;
                          },
                        ),
                      ),
                    ),


                    Container(
                      width: MediaQuery.of(context).size.width * 0.5 ,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 8.0, right: 20.0, bottom: 8.0),
                        child: myTextInput(textString: "Last Name",
                          labelText: 'Last Name',
                          colBlue: colLName,
                          colBlue_1: colLName_1,
                          colBlue_2: colLName_2,
                          textInputAction: TextInputAction.next,
                          spaceAllowed: true,
                          obscure: false,
                          onChange: (value) {
                            globals.lName = value;
                          },
                        ),
                      ),
                    ),
                  ],
                ),



                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 8.0, right: 20.0, bottom: 8.0),
                  child: myTextInput(textString: "UserName",
                    labelText: 'UserName',

                    colBlue: colUserName,
                    colBlue_1: colUserName_1,
                    colBlue_2: colUserName_2,
                    textInputAction: TextInputAction.next,
                    spaceAllowed: false,
                    obscure: false,
                    onChange: (value) {
                      globals.userName = value;
                    },),
                ),

                if(id == 1)
                  myErrorText(
                    errorText:globals.error1,
                    color: colErrorText = globals.red_1,
                  ),

                if(id == 2)
                    myErrorText(
                      errorText:globals.error2_1,
                      color: colErrorText = globals.red_1,
                    ),

                if(id == 3)
                  myErrorText(
                    errorText:globals.error2_2,
                    color: colErrorText = globals.red_1,
                  ),

                if(id == 4)
                  myErrorText(
                    errorText:globals.error5,
                    color: colErrorText = globals.red_1,
                  ),


                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 8.0, right: 20.0, bottom: 8.0),
                  child: myTextInput(textString: "Email Address",
                    labelText: 'Email Address',

                    colBlue: colEmail,
                    colBlue_1: colEmail_1,
                    colBlue_2: colEmail_2,
                    textInputAction: TextInputAction.next,
                    spaceAllowed: false,
                    obscure: false,
                    onChange: (value) {
                      globals.email = value;
                    },
                  ),
                ),

                if(id == 1)
                  myErrorText(
                    errorText:globals.error1,
                    color: colErrorText = globals.red_1,
                  ),

                if(id == 5)
                  myErrorText(
                    errorText:globals.error2_5,
                    color: colErrorText = globals.red_1,
                  ),

                if(id == 6)
                  myErrorText(
                    errorText:globals.error6,
                    color: colErrorText = globals.red_1,
                  ),


                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 8.0, right: 20.0, bottom: 8.0),
                  child: myTextInput(textString: "Password",
                    labelText: 'Password',

                    colBlue: colPass,
                    colBlue_1: colPass_1,
                    colBlue_2: colPass_2,
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    spaceAllowed: false,
                    obscure: true,
                    onChange: (value) {
                      globals.password = value;
                    },
                  ),
                ),

                if(id == 7)
                  myErrorText(
                    errorText:globals.error2_3,
                    color: colErrorText = globals.red_1,
                  ),

                if(id == 8)
                  myErrorText(
                    errorText:globals.error3,
                    color: colErrorText = globals.red_1,
                  ),

                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 8.0, right: 20.0, bottom: 8.0),
                  child: myTextInput(textString: "ReEnterPassword",
                    labelText: 'ReEnterPassword',

                    colBlue: colRePass,
                    colBlue_1: colRePass_1,
                    colBlue_2: colRePass_2,
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    spaceAllowed: false,
                    obscure: true,
                    onChange: (value) {
                      globals.repassword = value;
                    },
                  ),
                ),

                if(id == 8)
                  myErrorText(
                    errorText:globals.error3,
                    color: colErrorText = globals.red_1,
                  ),

                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 8.0, right: 20.0),
                  child: myTextInput(textString: "Phone Number",
                    labelText: 'Phone Number',
                    keybType: TextInputType.numberWithOptions(
                        decimal: true),

                    colBlue: colPhoneNb,
                    colBlue_1: colPhoneNb_1,
                    colBlue_2: colPhoneNb_2,
                    textInputAction: TextInputAction.done,
                    spaceAllowed: false,
                    obscure: false,
                    onChange: (value) {
                      globals.phoneNumber = value;
                    },
                  ),
                ),

                if(id == 9)
                  myErrorText(
                    errorText:globals.error2_7,
                    color: colErrorText = globals.red_1,
                  ),

                if(id == 10)
                  myErrorText(
                    errorText:globals.error9,
                    color: colErrorText = globals.red_1,
                  ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      child: myRadioButton(
                        text: ' Male ',
                        color: colRadioMale,
                        color_1: colRadioMale_1,
                        onPressed: (){
                          globals.gender = 'Male';
                          setState(() {
                            colRadioMale = globals.blue_1;
                            colRadioMale_1 = globals.blue;
                            colRadioFem = globals.blue;
                            colRadioFem_1 = globals.blue_1;
                          });

                          print(globals.gender);
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      child: myRadioButton(
                        text: 'Female',
                        color: colRadioFem,
                        color_1: colRadioFem_1,
                        onPressed: (){
                          globals.gender = 'Female';
                          setState(() {
                            colRadioFem = globals.blue_1;
                            colRadioFem_1 = globals.blue;
                            colRadioMale = globals.blue;
                            colRadioMale_1 = globals.blue_1;
                          });
                          print(globals.gender);
                        },
                      ),
                    ),
                  ],
                ),


                Text("Choose your Gender", style: TextStyle(
                  color: colGender,
                  fontSize: 15.0,
                ),),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myDateOfBirth(),
                ),

                Text("Choose your Date Of Birth", style: TextStyle(
                  color: colDateBirth,
                  fontSize: 15.0,
                ),),

                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: InkWell(
                      child: btn(btnText: "Confirm"),
                      onTap: () {
                        try {
                          _test1();
                        } catch (e) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text(globals.errorElse),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                          );
                        }
                      }),
                ),



              ],
            ),
          ],
        ),
      ),
    );
  }

  _test1() {
    bool if1 = false; //fname
    bool if2 = false; //lname
    bool if3 = false; //username
    bool if33 = false; //username space
    bool if333 = false; //username length>8
    bool if3333 = false; //username match the expr reguliere
    bool if4 = false; //dateofbirth
    bool if5 = false; //password
    bool if6 = false; //repassword
    bool if7 = false; //phoneNumber
    bool if8 = false; //email
    bool if9 = false; //genderError



    if (globals.fName != null) if (globals.fName!.isNotEmpty) if1 = true;

    if (globals.lName != null) if (globals.lName!.isNotEmpty) if2 = true;

    if (globals.userName != null) if (globals.userName!.isNotEmpty) {
      if3 = true; //empty or null
      if (!globals.userName!.contains(" "))
        if33 = true; //space
      if (globals.userName!.length >= 8)
        if333 = true; // 8 characters
      if (exp.hasMatch(globals.userName!))
        if3333 = true; //regular exp

    }

    if (globals.dateOfBirth != null) {
      if4 = true;
    }

    if (globals.password != null) {
      if (globals.password!.isNotEmpty)
        if5 = true;
    }
    if (globals.repassword != null) {
      if (globals.repassword!.isNotEmpty)
        if6 = true;
    }

    if (globals.phoneNumber != null){
      if (globals.phoneNumber!.isNotEmpty)
        if7 = true;
    }


    if (globals.email != null) {
      if (globals.email!.isNotEmpty)
        if8 = true;
    }

    if (globals.gender != null) {
      if (globals.gender!.isNotEmpty) {
        if9 = true;
      }
    }


    if (if1) {
      setState(() {
        colFName = globals.blue;
        colFName_1 = globals.blue_1;
        colFName_2 = globals.blue_2;
      });
    } else {
      setState(() {
        colFName = globals.red;
        colFName_1 = globals.red_1;
        colFName_2 = globals.red_2;
      });
    }

    if (if2) {
      setState(() {
        colLName = globals.blue;
        colLName_1 = globals.blue_1;
        colLName_2 = globals.blue_2;
      });
    } else {
      setState(() {
        colLName = globals.red;
        colLName_1 = globals.red_1;
        colLName_2 = globals.red_2;
      });
    }

    if (if3) {
        setState(() {
          colUserName = globals.blue;
          colUserName_1 = globals.blue_1;
          colUserName_2 = globals.blue_2;
        });
    } else {
      setState(() {
        colUserName = globals.red;
        colUserName_1 = globals.red_1;
        colUserName_2 = globals.red_2;
      });
    }



    if (if4) {
      setState(() {
        colDateOfBirth = globals.blue;
        colDateOfBirth_1 = globals.blue_1;
        colDateOfBirth_2 = globals.blue_2;
        colDateBirth = globals.transparent;
      });
    } else {
      setState(() {
        colDateOfBirth = globals.red;
        colDateOfBirth_1 = globals.red_1;
        colDateOfBirth_2 = globals.red_2;
        colDateBirth = globals.red_1;
      });
    }


    if (if5) {
        setState(() {
          colPass = globals.blue;
          colPass_1 = globals.blue_1;
          colPass_2 = globals.blue_2;
        });
    } else {
      setState(() {
        colPass = globals.red;
        colPass_1 = globals.red_1;
        colPass_2 = globals.red_2;
      });
    }

    if (if6) {
      setState(() {
        colRePass = globals.blue;
        colRePass_1 = globals.blue_1;
        colRePass_2 = globals.blue_2;
      });
    } else {
      setState(() {
        colRePass = globals.red;
        colRePass_1 = globals.red_1;
        colRePass_2 = globals.red_2;
      });
    }



    if (if7) {
      setState(() {
        colPhoneNb = globals.blue;
        colPhoneNb_1 = globals.blue_1;
        colPhoneNb_2 = globals.blue_2;
      });
    } else {
      setState(() {
        colPhoneNb = globals.red;
        colPhoneNb_1 = globals.red_1;
        colPhoneNb_2 = globals.red_2;
      });
    }

    if (if8) {
      setState(() {
        colEmail = globals.blue;
        colEmail_1 = globals.blue_1;
        colEmail_2 = globals.blue_2;
      });
    } else {
      setState(() {
        colEmail = globals.red;
        colEmail_1 = globals.red_1;
        colEmail_2 = globals.red_2;
      });
    }


    if (if9) {
      setState(() {
        colGender = globals.transparent;
      });
    } else {
      setState(() {
        colGender = Colors.red.shade700;
      });
    }




    if (if1 == true &&
        if2 == true &&
        if3 == true &&
        if4 == true &&
        if5 == true &&
        if6 == true &&
        if7 == true &&
        if8 == true &&
        if9 == true) {
      if (mailExp.hasMatch(globals.email!)) {
        if (globals.password!.length >= 8 && globals.repassword!.length >=8) {
          if (express.hasMatch(globals.password!)) {
            if (globals.password == globals.repassword) {
              if(if33){
                if(if333){
                  if(if3333){
                    if (globals.phoneNumber.toString().length == 8) {
                      _reg();
                    } else {
                      setState(() {
                        colPhoneNb = globals.red;
                        colPhoneNb_1 = globals.red_1;
                        colPhoneNb_2 = globals.red_2;
                      });
                      id = 10;
                    }
                  }else{
                    colUserName = globals.red;
                    colUserName_1 = globals.red_1;
                    colUserName_2 = globals.red_2;
                    id = 3;
                  }
                }else{
                  colUserName = globals.red;
                  colUserName_1 = globals.red_1;
                  colUserName_2 = globals.red_2;
                  id = 2;
                }
              }else{
                colUserName = globals.red;
                colUserName_1 = globals.red_1;
                colUserName_2 = globals.red_2;
                id = 1;
              }
            }else {
              setState(() {
                colPass = globals.red;
                colPass_1 = globals.red_1;
                colPass_2 = globals.red_2;
                colRePass = globals.red;
                colRePass_1 = globals.red_1;
                colRePass_2 = globals.red_2;
              });
              id = 8;
            }
          }else {
            setState(() {
              colPass = globals.red;
              colPass_1 = globals.red_1;
              colPass_2 = globals.red_2;
            });
            id = 7;
          }
        }else {
          setState(() {
            colPass = globals.red;
            colPass_1 = globals.red_1;
            colPass_2 = globals.red_2;
            colRePass = globals.red;
            colRePass_1 = globals.red_1;
            colRePass_2 = globals.red_2;
          });
          id = 7;
        }
      } else {
        setState(() {
          colEmail = globals.red;
          colEmail_1 = globals.red_1;
          colEmail_2 = globals.red_2;
        });
        id = 5;
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => ErrorAlertDialog(
              message: globals.error7));
    }

  }


  _reg() async {
    if (globals.email != null &&
        globals.fName != null &&
        globals.lName != null &&
        globals.userName != null &&
        globals.password != null &&
        globals.dateOfBirth != null &&
        globals.gender != null &&
        globals.phoneNumber != null) {
      if (!globals.email!.contains(" ") &&
          !globals.userName!.contains(" ")) {
        //if(exp.hasMatch(globals.password!)) {
        //if (globals.password == globals.repassword) {
        var data = {
          'email': globals.email,
          'fname': globals.fName,
          'lname': globals.lName,
          'userName': globals.userName,
          'password': globals.password,
          'repassword': globals.repassword,
          'dateOfBirth': globals.dateOfBirth,
          'phoneNumber': globals.phoneNumber,
          'gender': globals.gender
        };
        var res = await CallApi().postData(
            data, 'Registration/Control/(Control)registration.php');
        print(res.body);
        List<dynamic> body = json.decode(res.body);
        if (body[0] == "success") {
          Navigator.pushNamed(context, '/home');
        } else if (body[0] == "error1") {
          id = 1;
        } else if (body[0] == "error2_1") {
          id = 2;
        } else if (body[0] == "error2_2") {
          id = 3;
        } else if (body[0] == "error2_3") {
          id = 7;
        } else if (body[0] == "error2_5") {
          id = 5;
        } else if (body[0] == "error3") {
          id = 8;
        } else if (body[0] == "error4") {
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.error4));
        } else if (body[0] == "error5") {
          id = 4;
        } else if (body[0] == "error6") {
          id = 6;
        } else if (body[0] == "error7") {
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.error7));
        } else if (body[0] == "error9") {
          id = 10;
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.errorElse));
        }
        /* } else {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) =>
                  AlertDialog(
                    title: const Text('Error'),
                    content: const Text(
                        globals.error3),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
            );
          } */
        /* }else{
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  title: const Text('Error'),
                  content: const Text(globals.error2_3,
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
          );
        }  } */
      } else {
        id = 1;
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => ErrorAlertDialog(
              message: 'No nulls Allowed.'));
    }
  }
}