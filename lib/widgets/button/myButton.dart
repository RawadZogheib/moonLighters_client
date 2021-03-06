import 'package:flutter/material.dart';
import 'package:flutter_client/globals/globals.dart' as globals;

class btn extends StatelessWidget {
  var btnText;
  var onTap;

  btn({required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(btnText),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.0),
          color: Colors.blue.shade200,
        ));
  }
}

class myButton extends StatelessWidget {
  var btnText;
  var height;
  var width;
  var onPress;

  myButton({required this.btnText, this.height, this.width, this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: globals.blue,
        onPrimary: globals.blue_1,
        shadowColor: Colors.transparent,
        fixedSize:
            Size(width != null ? width : 50, height != null ? height : 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(btnText),
      onPressed: () {
        onPress();
        //print("Submitted2");
      },
    );
  }
}
