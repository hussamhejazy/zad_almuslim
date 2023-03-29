import 'package:flutter/material.dart';
import '../../screens/quran/quran_menu/quran_book.dart';
import '../../utils/size_config.dart';
import '../colors.dart';

class FaharasItem extends StatelessWidget {
  final _makeIcon = Image.asset(
    'assets/icons/maki.png',
  );
  final _madinaIcon = Image.asset(
    'assets/icons/madni.png',
  );

  final int numOfSurah;
  final bool isMarked = false;
  final int numOfAyah;
  final int type;
  final int numOfPage;

  FaharasItem(
      {Key? key,
      required this.numOfSurah,
      required this.type,
      required this.numOfAyah,
      required this.numOfPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => QuranBook(
                  numOfPageStart: numOfPage,
                ))),
        child: Card(
          child: Container(
            width: double.infinity,
            height: SizeConfig().scaleHeight(63),
            decoration: const BoxDecoration(
              color: primaryLight,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: SizeConfig().scaleWidth(40),
                        height: SizeConfig().scaleHeight(63),
                        decoration: const BoxDecoration(
                          color: primaryDark,
                        ),
                        child: Center(
                          child: Text(
                            numOfSurah.toString(),
                            style: TextStyle(
                                fontSize: SizeConfig().scaleTextFont(22),
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.center,
                          ),
                        )),
                    Image.asset(
                      'assets/images/quran/sName/sname_$numOfSurah.png',
                      scale: 2,
                      color: primaryDark,
                      colorBlendMode: BlendMode.modulate,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: SizeConfig().scaleWidth(10)),
                      child: (type == 1) ? _makeIcon : _madinaIcon,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: SizeConfig().scaleWidth(10)),
                      child: Column(
                        children: [
                          Text(
                            'أياتها',
                            style: TextStyle(
                                fontSize: SizeConfig().scaleTextFont(22),
                                color: primaryDark),
                          ),
                          Text(
                            numOfAyah.toString(),
                            style: TextStyle(
                                fontSize: SizeConfig().scaleTextFont(16),
                                color: primaryDark,
                                fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: SizeConfig().scaleWidth(40),
                        height: SizeConfig().scaleHeight(63),
                        decoration: const BoxDecoration(
                          color: primaryDark,
                        ),
                        child: Center(
                          child: Text(
                            numOfPage.toString(),
                            style: TextStyle(
                                fontSize: SizeConfig().scaleTextFont(22),
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
