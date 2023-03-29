import 'package:flutter/material.dart';
import 'package:zad_almuslim/utils/size_config.dart';

import '../../components/colors.dart';
import '../../models/hesen_elmuslim_azkar.dart';

class HesenElmuslimAzkar extends StatefulWidget {
  HesenElmuslim? hesenElmuslim;
  HesenElmuslimAzkar({Key? key,required this.hesenElmuslim}) : super(key: key);

  @override
  State<HesenElmuslimAzkar> createState() => _HesenElmuslimAzkarState(hesenElmuslim);
}

class _HesenElmuslimAzkarState extends State<HesenElmuslimAzkar> {
  HesenElmuslim? hesenElmuslim;
  late List<Zeker> azkar = HesenElmuslim().getAzkarByIndex(hesenElmuslim!);
  _HesenElmuslimAzkarState(this.hesenElmuslim);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: const SizedBox(),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Text(
            hesenElmuslim!.category,
            style: TextStyle(
                fontSize: SizeConfig().scaleTextFont(22),
                color: outlineCardHomePage,
                letterSpacing: 1,
                wordSpacing: 5),
          ),
          centerTitle: true,
          backgroundColor: primaryLight,
        ),
        body: Stack(
          children: [
            Image.asset('assets/images/quran/others/quranBackground.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover),
            SafeArea(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: azkar.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child: Container(
                            decoration: BoxDecoration(
                                color: primaryLight,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                        SizeConfig().scaleWidth(25)),
                                    topLeft: Radius.circular(
                                        SizeConfig().scaleWidth(25)))),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: SizeConfig().scaleWidth(12)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.favorite_border,
                                            size: 35,
                                            color: primaryDark,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.share,
                                            size: 32,
                                            color: primaryDark,
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    azkar[index].text,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize:
                                            SizeConfig().scaleTextFont(24)),
                                  ),
                                ),
                                Visibility(
                                  visible: (azkar[index].count > 1?true:false),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: primaryDark.withOpacity(0.8)
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.add,
                                              size: 35,
                                              color: outlineCardHomePage,
                                            )),
                                        Text(
                                          '0/${azkar[index].count}',
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig().scaleTextFont(24),
                                              fontWeight: FontWeight.w600,
                                              color: outlineCardHomePage),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.refresh,
                                              size: 32,
                                              color: outlineCardHomePage,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: (azkar[index].count == 1?true:false),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: primaryDark.withOpacity(0.8)
                                    ),
                                    child:Center(
                                      child: Text(
                                        'مرة واحدة',
                                        style: TextStyle(
                                            fontSize:
                                            SizeConfig().scaleTextFont(24),
                                            fontWeight: FontWeight.w600,
                                            color: outlineCardHomePage),
                                      ),
                                    )
                                  ),
                                )
                              ],
                            )),
                      );
                    }))
          ],
        ));
  }
}
