import 'package:flutter/material.dart';
import 'package:flutter_client/hexColor/hexColor.dart';
import 'package:flutter_client/widgets/projectCard/myProjectCard.dart';

class AccessCard extends StatelessWidget {
  final String saveName;
  final String description;

  AccessCard({
    required this.saveName,
    required this.description});

  @override
  Widget build(BuildContext context) {
    return MySavesCard(
      type: "Access",
      saveName: saveName,
      description: description,
      color1: HexColor("#e08095"), //light
      color2: HexColor("#a21927"), //dark
      asset: 'Assets/projectLogo/accessLogo.png',
      onTap: () {
        print("Access");
      },
    );
  }
}
