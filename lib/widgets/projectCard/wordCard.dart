import 'package:flutter/material.dart';
import 'package:flutter_client/hexColor/hexColor.dart';

import 'package:flutter_client/widgets/projectCard/myProjectCard.dart';

class WordCard extends StatelessWidget {
  final String saveName;
  final String description;

  WordCard({
    required this.saveName,
    required this.description});

  @override
  Widget build(BuildContext context) {
    return MySavesCard(
      type: "Word",
      saveName: saveName,
      description: description,
      color1: HexColor("#41a5ee"), //light
      color2: HexColor("#103f91"), //dark
      asset: 'Assets/projectLogo/wordLogo.png',
      onTap: () {
        print("Word");
      },
    );
  }
}
