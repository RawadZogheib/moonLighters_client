


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
      )
    );
  }
}


