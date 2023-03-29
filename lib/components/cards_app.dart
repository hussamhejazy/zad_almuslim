import 'package:flutter/material.dart';

import 'colors.dart';

class ButtonCardHomePage extends StatelessWidget {
  final String imagePath;
  final Function onTap;

  const ButtonCardHomePage({Key? key, required this.imagePath, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () { onTap();},
        child: Card(
          color: outlineCardHomePage.withOpacity(0.1),
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36),
              side:const BorderSide(color: outlineCardHomePage)),
          child: Center(
            child: Image.asset(imagePath),
          ),
        ));
  }
}


