//
//
// import 'dart:js';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_client/globals/globals.dart';
//
// class firstPage extends StatelessWidget {
//   const firstPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteBlue,
//       body: Container(
//         child: Image(image: AssetImage('/Images/microsoft.jpg')),
//        // _nextpg();
//       ),
//     );
//   }
//   countDownTimer() async {
//     int timerCount;
//     for (int x = 5; x > 0; x--) {
//       await Future.delayed(Duration(seconds: 1)).then((_) {
//         setState(() {
//           timerCount -= 1;
//         });
//       });
//     }
//   }
// }
