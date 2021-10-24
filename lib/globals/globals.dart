library flutterclient.globals;

import 'dart:ui';

import 'package:flutter_client/hexColor/hexColor.dart';
//Server Ip  (page[/my_api.dart])
const String myIP = "http://147.78.45.13/";


//Colors
final Color whiteBlue = HexColor("#f2f3f8");
final Color white = HexColor("#fdfdfd");

//Errors
const String error1 = "No Spaces Allowed.";
const String error2_1 = "Your username must contain at least 8 characters.";
const String error2_2 = "Your username can only contain lowercase and uppercase characters and special characters( _ .).";
const String error2_3 = "Your password must contain at least 8 characters, 1 lowercase(a-z),1 uppercase(A-Z),1 numeric character(0-9) and 1 special character(* . ! @ # \$ % ^ & : , ? _ -).";
const String error2_4 = "Your age must be greater than 17.";
const String error2_5 = "It's not an email format.";
const String error2_6 = "It's not a university email.";
const String error2_7 = "phone Number already exists";
const String error3 = "Please make sure your passwords match.";
const String error4 = "Cannot connect to the dataBase.";
const String error5 = "UserName already exist.";
const String error6 = "Email already exist.";
const String error7 = "Field cannot be empty.";
const String error8 = "Incorrect email or password.";       // for login
const String error9 = "It's not a phoneNumber format, it should contains 8 digits";
const String error10 = "No data available";
const String errorElse = "Failed to connect... Connection Problem.";
const String errorException = "OOPs! Something went wrong. Try again in few seconds.";

//Registration  (page[/signup.dart /registration.dart /registration2.dart /registration3.dart])
String? email = null;
String? fName = null;
String? lName = null;
String? password = null;
String? repassword = null;
String? gender = null;
String? phoneNumber = null;
String? userName = null;
String? dateOfBirth = null;


//login  (page[/login.dart /login2.dart])
String? emailLogin = null;
String? passwordLogin = null;
