
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
import 'package:flutter_client/widgets/TextInput/myTextInput.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

RegExp express = new RegExp(r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[*.!@#$%^&:,?_-]).{8,}$");
RegExp exp = new RegExp(r"^[a-zA-Z0-9_\.]*$", caseSensitive: false);
RegExp mailExp = new RegExp("[a-zA-Z0-9]+@(g|hot)mail.com", caseSensitive: false);
RegExp phoneExp = new RegExp("[0-9]{8}");


Color colFName = Colors.blue.shade50;               //fname
Color colFName_1 = Colors.blue.shade900;
Color colFName_2 = Colors.blue.shade900.withOpacity(0.5);

Color colLName = Colors.blue.shade50;               //lname
Color colLName_1 = Colors.blue.shade900;
Color colLName_2 = Colors.blue.shade900.withOpacity(0.5);


Color colUserName = Colors.blue.shade50;                //username
Color colUserName_1 = Colors.blue.shade900;
Color colUserName_2 = Colors.blue.shade900.withOpacity(0.5);


Color colPass = Colors.blue.shade50;               //password
Color colPass_1 = Colors.blue.shade900;
Color colPass_2 = Colors.blue.shade900.withOpacity(0.5);

Color colRePass = Colors.blue.shade50;               //repassword
Color colRePass_1 = Colors.blue.shade900;
Color colRePass_2 = Colors.blue.shade900.withOpacity(0.5);


Color colPhoneNb = Colors.blue.shade50;               //phoneNumber
Color colPhoneNb_1 = Colors.blue.shade900;
Color colPhoneNb_2 = Colors.blue.shade900.withOpacity(0.5);

Color colEmail = Colors.blue.shade50;               //email
Color colEmail_1 = Colors.blue.shade900;
Color colEmail_2 = Colors.blue.shade900.withOpacity(0.5);

Color colGender = Colors.transparent;             //genderError


class registration extends StatefulWidget {
  const registration({Key? key}) : super(key: key);

  @override
  _registrationState createState() => _registrationState();
}

class _registrationState extends State<registration> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.0001,
                      top: MediaQuery.of(context).size.height * 0.04, bottom: MediaQuery.of(context).size.height * 0.03),
                  child: Text("Create Your Account", style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03,right: MediaQuery.of(context).size.width * 0.03, bottom: 8.0),
                      child: myTextInput(
                        textString: "First Name",
                        labelText: 'First Name',
                        widthh: 145.0,
                        colBlue: colFName,
                        colBlue_1: colFName_1,
                        colBlue_2: colFName_2,
                        obscure: false,
                        onChange: (value) {
                          globals.fName = value;
                        },
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03, bottom: 8.0),
                      child: myTextInput(textString: "Last Name",
                        labelText: 'Last Name',
                        widthh: 145.0,
                        colBlue: colLName,
                        colBlue_1: colLName_1,
                        colBlue_2: colLName_2,
                        obscure: false,
                        onChange: (value) {
                          globals.lName = value;
                        },
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03,right: MediaQuery.of(context).size.width * 0.03, top: 8.0),
                  child: myTextInput(textString: "UserName",
                    labelText: 'UserName',
                    widthh: MediaQuery.of(context).size.width * 0.78,
                    colBlue: colUserName,
                    colBlue_1: colUserName_1,
                    colBlue_2: colUserName_2,
                    obscure: false,
                    onChange: (value) {
                      globals.userName = value;
                    },),
                ),


                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.001, top: 8.0),
                  child: myTextInput(textString: "Email Address",
                    labelText: 'Email Address',
                    widthh: MediaQuery.of(context).size.width * 0.78,
                    colBlue: colEmail,
                    colBlue_1: colEmail_1,
                    colBlue_2: colEmail_2,
                    obscure: false,
                    onChange: (value) {
                      globals.email = value;
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.001,top: 8.0),
                  child: myTextInput(textString: "Password",
                    labelText: 'Password',
                    widthh: MediaQuery.of(context).size.width * 0.78,
                    colBlue: colPass,
                    colBlue_1: colPass_1,
                    colBlue_2: colPass_2,
                    obscure: true,
                    onChange: (value) {
                      globals.password = value;
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.001, top: 8.0),
                  child: myTextInput(textString: "ReEnterPassword",
                    labelText: 'ReEnterPassword',
                    widthh: MediaQuery.of(context).size.width * 0.78,
                    colBlue: colRePass,
                    colBlue_1: colRePass_1,
                    colBlue_2: colRePass_2,
                    obscure: true,
                    onChange: (value) {
                      globals.repassword = value;
                    },
                  ),
                ),


                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.001, top: 8.0),
                  child: myTextInput(textString: "Phone Number",
                    labelText: 'Phone Number',
                    widthh: MediaQuery.of(context).size.width * 0.78,
                    colBlue: colPhoneNb,
                    colBlue_1: colPhoneNb_1,
                    colBlue_2: colPhoneNb_2,
                    obscure: false,
                    keybType: TextInputType.numberWithOptions(
                        decimal: true),
                    onChange: (value) {
                      globals.phoneNumber = value;
                    },
                  ),
                ),

                myRadioButton(),

                Text("Choose your Gender", style: TextStyle(
                  color: colGender,
                  fontSize: 15.0,
                ),),

                myDateOfBirth(),


                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       Text("Gender: ",style: TextStyle(
                //           color: Colors.lightBlue,
                //           fontSize: 20.0
                //       ),),
                //       radioBtn(
                //         valuee: "Male",
                //         title: "Male",
                //         onChanged: (value){
                //           globals.gender = value;
                //         },),
                //       radioBtn(
                //         valuee: "Female",
                //         title: "Female",
                //         onChanged: (value){
                //           globals.gender = value;
                //         },)
                //     ],
                //   ),
                // ),

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
      if (globals.gender!.isNotEmpty)
        if9 = true;
    }


    if (if1) {
      setState(() {
        colFName = Colors.blue.shade50;
        colFName_1 = Colors.blue.shade900;
        colFName_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    } else {
      setState(() {
        colFName = Colors.red.shade50;
        colFName_1 = Colors.red.shade900;
        colFName_2 = Colors.red.shade900.withOpacity(0.5);
      });
    }

    if (if2) {
      setState(() {
        colLName = Colors.blue.shade50;
        colLName_1 = Colors.blue.shade900;
        colLName_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    } else {
      setState(() {
        colLName = Colors.red.shade50;
        colLName_1 = Colors.red.shade900;
        colLName_2 = Colors.red.shade900.withOpacity(0.5);
      });
    }

    if (if3) {
        setState(() {
          colUserName = Colors.blue.shade50;
          colUserName_1 = Colors.blue.shade900;
          colUserName_2 = Colors.blue.shade900.withOpacity(0.5);
        });
    } else {
      setState(() {
        colUserName = Colors.red.shade50;
        colUserName_1 = Colors.red.shade900;
        colUserName_2 = Colors.red.shade900.withOpacity(0.5);
      });
    }



    if (if4) {
      setState(() {
        col4 = Colors.blue.shade50;
        col4_1 = Colors.blue.shade900;
        col4_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    } else {
      setState(() {
        col4 = Colors.red.shade50;
        col4_1 = Colors.red.shade900;
        col4_2 = Colors.red.shade900.withOpacity(0.5);
      });
    }


    if (if5) {
        setState(() {
          colPass = Colors.blue.shade50;
          colPass_1 = Colors.blue.shade900;
          colPass_2 = Colors.blue.shade900.withOpacity(0.5);
        });
    } else {
      setState(() {
        colPass = Colors.red.shade50;
        colPass_1 = Colors.red.shade900;
        colPass_2 = Colors.red.shade900.withOpacity(0.5);
      });
    }

    if (if6) {
      setState(() {
        colRePass = Colors.blue.shade50;
        colRePass_1 = Colors.blue.shade900;
        colRePass_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    } else {
      setState(() {
        colRePass = Colors.red.shade50;
        colRePass_1 = Colors.red.shade900;
        colRePass_2 = Colors.red.shade900.withOpacity(0.5);
      });
    }



    if (if7) {
      setState(() {
        colPhoneNb = Colors.blue.shade50;
        colPhoneNb_1 = Colors.blue.shade900;
        colPhoneNb_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    } else {
      setState(() {
        colPhoneNb = Colors.red.shade50;
        colPhoneNb_1 = Colors.red.shade900;
        colPhoneNb_2 = Colors.red.shade900.withOpacity(0.5);
      });
    }

    if (if8) {
      setState(() {
        colEmail = Colors.blue.shade50;
        colEmail_1 = Colors.blue.shade900;
        colEmail_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    } else {
      setState(() {
        colEmail = Colors.red.shade50;
        colEmail_1 = Colors.red.shade900;
        colEmail_2 = Colors.red.shade900.withOpacity(0.5);
      });
    }


    if (if9) {
      setState(() {
        colGender = Colors.transparent;
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
                        colPhoneNb = Colors.red.shade50;
                        colPhoneNb_1 = Colors.red.shade900;
                        colPhoneNb_2 = Colors.red.shade900.withOpacity(0.5);
                      });
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => ErrorAlertDialog(
                              message: globals.error9));
                    }
                  }else{
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          AlertDialog(
                            title: const Text('Error'),
                            content: const Text(
                                globals.error2_2),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                    );
                  }
                }else{
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>
                        AlertDialog(
                          title: const Text('Error'),
                          content: const Text(
                              globals.error2_1),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                  );
                }
              }else{
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) =>
                      AlertDialog(
                        title: const Text('Error'),
                        content: const Text(
                            globals.error1),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                );
              }
            }else {
              setState(() {
                colPass = Colors.red.shade50;
                colPass_1 = Colors.red.shade900;
                colPass_2 = Colors.red.shade900.withOpacity(0.5);
                colRePass = Colors.red.shade50;
                colRePass_1 = Colors.red.shade900;
                colRePass_2 = Colors.red.shade900.withOpacity(0.5);
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) => ErrorAlertDialog(
                      message: globals.error3));
            }
          }else {
            setState(() {
              colPass = Colors.red.shade50;
              colPass_1 = Colors.red.shade900;
              colPass_2 = Colors.red.shade900.withOpacity(0.5);
            });
            showDialog(
                context: context,
                builder: (BuildContext context) => ErrorAlertDialog(
                    message: globals.error2_3));
          }
        }else {
          setState(() {
            colPass = Colors.red.shade50;
            colPass_1 = Colors.red.shade900;
            colPass_2 = Colors.red.shade900.withOpacity(0.5);
            colRePass = Colors.red.shade50;
            colRePass_1 = Colors.red.shade900;
            colRePass_2 = Colors.red.shade900.withOpacity(0.5);
          });
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.error2_3));
        }
      } else {
        setState(() {
          colEmail = Colors.red.shade50;
          colEmail_1 = Colors.red.shade900;
          colEmail_2 = Colors.red.shade900.withOpacity(0.5);
        });
        showDialog(
            context: context,
            builder: (BuildContext context) => ErrorAlertDialog(
                message: globals.error2_5));
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
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.error1));
        } else if (body[0] == "error2_1") {
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.error2_1));
        } else if (body[0] == "error2_2") {
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.error2_2));
        } else if (body[0] == "error2_3") {
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.error2_3));
        } else if (body[0] == "error2_5") {
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.error2_5));
        } else if (body[0] == "error3") {
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.error3));
        } else if (body[0] == "error4") {
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.error4));
        } else if (body[0] == "error5") {
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.error5));
        } else if (body[0] == "error6") {
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.error6));
        } else if (body[0] == "error7") {
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.error7));
        } else if (body[0] == "error9") {
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.error9));
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
        showDialog(
            context: context,
            builder: (BuildContext context) => ErrorAlertDialog(
                message: globals.error1));
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => ErrorAlertDialog(
              message: 'No nulls Allowed.'));
    }
  }
}