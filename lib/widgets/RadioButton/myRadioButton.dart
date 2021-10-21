

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client/globals/globals.dart' as globals;

class radioButton extends StatefulWidget {
  const radioButton({Key? key}) : super(key: key);

  @override
  _radioButtonState createState() => _radioButtonState();
}

class _radioButtonState extends State<radioButton> {

  String radioItem = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
          child: Row(
            children: [
              Text("Gender:",style: TextStyle(
                fontSize: 16.0
              ),),
              Container(
                width: 123.0,
                child: RadioListTile(
                  groupValue: radioItem,
                  title: Text('Male',style: TextStyle(
                    fontSize: 14.0
                  ),),
                  value: 'Male',
                  onChanged: (val) {
                    setState(() {
                      radioItem = "Male";
                    });
                    globals.gender = radioItem;
                  },
                ),
              ),

              Container(
                width: 142.0,
                child: RadioListTile(
                  groupValue: radioItem,
                  title: Text('Female',style: TextStyle(
                    fontSize: 14.0
                  ),),
                  value: 'Female',
                  onChanged: (val){
                    setState(() {
                      radioItem = "Female";
                    });
                    globals.gender = radioItem;
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}