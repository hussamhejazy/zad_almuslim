import 'package:flutter/material.dart';

import '../utils/size_config.dart';
import 'colors.dart';


class SearchTextField extends StatelessWidget {

  const SearchTextField({super.key});


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        cursorColor: primary,
        style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig().scaleTextFont(22)
        ),
        decoration: InputDecoration(
          suffixIcon:const Icon(Icons.search,color: Colors.white,),
          filled: true,
          fillColor: outlineCardHomePage.withOpacity(0.3),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }

}