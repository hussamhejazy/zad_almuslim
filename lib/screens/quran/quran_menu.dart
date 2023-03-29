import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zad_almuslim/components/routeNames.dart';
import '../../components/quran_screen_components/button_menu_screen.dart';
import '../../state_mangament/getx_controllers/quran_getx_controller.dart';

class QuranMenu extends StatefulWidget {
  const QuranMenu({Key? key}) : super(key: key);

  @override
  State<QuranMenu> createState() => _QuranMenuState();
}

class _QuranMenuState extends State<QuranMenu> {
  late QuranGetxController _controller;
  @override
  void initState() {
    super.initState();
    _controller = Get.put(QuranGetxController());
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ButtonAppQuranScreen(title: 'القرأن الكريم',
                  routeName: Routes.quranBookRoute,
                  imagePath: 'assets/icons/quran.png'),
              ButtonAppQuranScreen(
                title: 'الفهرس',
                routeName: Routes.quranFaharasRoute,
                imagePath: 'assets/icons/index.png',),
              ButtonAppQuranScreen(title: 'انتقال الى العلامة',
                routeName: '/markedPage',
                imagePath: 'assets/icons/Bookmark.png',),
              ButtonAppQuranScreen(
                title: 'دعاء الختم',
                routeName: '/finish',
                imagePath: 'assets/icons/open-hands.png',),
            ],
          )
        ],
      ),
    );
  }

  void readJson() async {
    final String response =
    await rootBundle.loadString('assets/json/surah.json');
    final data = await json.decode(response);
    _controller.getSurahsFromJson(data['surah']);
  }
}


