import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zad_almuslim/screens/hesn_elmuslim/hesen_elmuslim_azkar.dart';

import '../../components/colors.dart';
import '../../components/search_text_field.dart';
import '../../models/hesen_elmuslim_azkar.dart';
import '../../utils/size_config.dart';

class HesnElmuslimMenu extends StatefulWidget {
  const HesnElmuslimMenu({Key? key}) : super(key: key);

  @override
  State<HesnElmuslimMenu> createState() => _HesnElmuslimMenuState();
}

class _HesnElmuslimMenuState extends State<HesnElmuslimMenu> {
  List<HesenElmuslim> _hesenElmuslimIndexes = [];
  Future<void> readJson() async {
    final String response =
    await rootBundle.loadString('assets/json/hesen_elmuslim.json');
    final data = await json.decode(response);
    var dataList = data['hesenElmuslim'] as List<dynamic>;
    setState(() {
      _hesenElmuslimIndexes = dataList.map((e) => HesenElmuslim.fromMap(e)).toList();
    });
  }
  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Image.asset('assets/images/quran/others/quranBackground.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover),
            SafeArea(
                child: Column(
                  children: [
                    const SearchTextField(),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _hesenElmuslimIndexes.length,
                        itemBuilder: (context, index) {
                          return HesenElmuslimItem(
                            title: _hesenElmuslimIndexes[index].category,
                            hesenElmuslim: _hesenElmuslimIndexes[index],
                          );
                        },
                      ),
                    )
                  ],
                ))
          ],
        ));
  }


}

class HesenElmuslimItem extends StatelessWidget {
  final String title;
  final HesenElmuslim hesenElmuslim;

  const HesenElmuslimItem({
    Key? key,
    required this.title, required this.hesenElmuslim,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () =>
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HesenElmuslimAzkar(hesenElmuslim: hesenElmuslim,))),
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
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig().scaleWidth(6)),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: SizeConfig().scaleTextFont(22),
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: primaryDark,
                      size: SizeConfig().scaleWidth(32),
                    )),
              ],
            ),
          ),
        ));
  }
}
