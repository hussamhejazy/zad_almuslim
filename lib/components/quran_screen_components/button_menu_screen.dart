import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/quran/quran_menu/quran_book.dart';
import '../../state_mangament/getx_controllers/quran_getx_controller.dart';
import '../../utils/size_config.dart';
import '../colors.dart';

class ButtonAppQuranScreen extends StatelessWidget {
  final String routeName;
  final String title;
  final String imagePath;
  QuranGetxController _controller = Get.put(QuranGetxController());
  ButtonAppQuranScreen({
    Key? key, required this.routeName, required this.title, required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
          onPressed: () {
            (routeName == '/finish')
                ? Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        QuranBook(
                          numOfPageStart: 605,
                        )))
                :(routeName == '/markedPage')
                ? Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => QuranBook(
                      numOfPageStart: _controller.indexMark+1,
                    )))
                : Navigator.pushNamed(context, routeName);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: outlineCardHomePage.withOpacity(0.1),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: BorderSide(
                width: SizeConfig().scaleWidth(2),
                color: outlineCardHomePage,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(imagePath),
                SizedBox(width: SizeConfig().scaleWidth(10),),
                Text(title,
                    style: TextStyle(
                        color: outlineCardHomePage,
                        fontSize: SizeConfig().scaleTextFont(28))),
              ],
            ),
          )),
    );
  }
}