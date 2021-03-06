import 'dart:convert';

import 'package:flutter_client/api/my_api.dart';
import 'package:flutter_client/widgets/button/myButton.dart';
import 'package:flutter_client/widgets/code/myCode.dart';
import 'package:flutter_client/globals/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter_client/widgets/textInput/myErrorText.dart';
import 'package:shared_preferences/shared_preferences.dart';


String errCode = '';
Color colErrCode = globals.transparent;



class sixCode extends StatefulWidget {
  const sixCode({Key? key}) : super(key: key);

  @override
  _sixCodeState createState() => _sixCodeState();
}

class _sixCodeState extends State<sixCode> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    errCode = '';
  }
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 28.0),
                      child: Text("Message Sent, check your email",style: TextStyle(
                        color: Colors.blueAccent,
                      ),),
                    ),
                    myCode(
                      keybType: TextInputType.numberWithOptions(decimal: true),
                      onChange: (value){
                        globals.sixCodeNb = value;
                        print(globals.sixCodeNb);
                      },
                    ),

                    myErrorText(errorText: errCode, color: colErrCode),

                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                child: Text("Resend Code",style: TextStyle(
                                    color: Colors.blue
                                ),),
                                onTap: (){
                                  //_nullLogin();
                                  //Navigator.pushNamed(context, '/Registration');
                                  _resendCode();
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                          child: InkWell(
                            child: btn(btnText: 'Send'),
                            onTap: (){
                              print(globals.sixCodeNb);
                              _checkCode();
                            },
                          )),
                    ),
                  ],
                ),
              )]));
  }


  _checkCode() async{
    errCode = '';
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      globals.email = localStorage.getString('email');
      var data = {
        'version': globals.version,
        'code': globals.sixCodeNb,
        'email': globals.email
      };

      var res = await CallApi().postData(
          data, 'Registration/Control/(Control)checkCode.php');
      //print(res);
      print(res.body);
      List<dynamic> body = json.decode(res.body);

      if(body[0] == "true"){
        Navigator.pushNamed(context, '/Login');
      }else if(body[0] == "codeFailed"){
        setState(() {
          errCode = globals.codeFailed;
          colErrCode = globals.red_1;
        });
      }else if(body[0] == "error7"){
        setState(() {
          errCode = globals.error7;
          colErrCode = globals.red_1;
        });
      }


    }catch(e){
      errCode = globals.errorException;
      colErrCode = globals.red_1;
    }
  }


  _resendCode() async{
    errCode = "";
    colErrCode = globals.transparent;

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    globals.email = localStorage.getString('email');
    var data = {
      'version': globals.version,
      'email': globals.email,
    };

    var res = await CallApi().postData(
        data, 'Login/Control/(Control)resendMail.php');
    print(res);
    //print("pppppp");
    List<dynamic> body = json.decode(res.body);
    print(res.body);

    // if(body[0] == "true"){
    //   //do nothing
    // }else
      if(body[0] == "error2_5"){
      errCode = globals.error2_5;
      colErrCode = globals.red_1;
    }else if(body[0] == "codeException"){
      errCode = globals.codeException;
      colErrCode = globals.red_1;
    }else if(body[0] == "error7"){
      errCode = globals.error7;
      colErrCode = globals.red_1;
    } else{
      setState(() {
        errCode = globals.errorElse;
        colErrCode = globals.red_1;
      });
    }

  }

}