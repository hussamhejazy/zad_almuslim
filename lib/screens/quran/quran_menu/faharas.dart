import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zad_almuslim/state_mangament/getx_controllers/quran_getx_controller.dart';
import '../../../components/quran_screen_components/faharas_item.dart';

class Faharas extends StatefulWidget {
  const Faharas({Key? key}) : super(key: key);

  @override
  State<Faharas> createState() => _FaharasState();
}

class _FaharasState extends State<Faharas> {

  late QuranGetxController _controller;
  @override
  void initState() {
    super.initState();
    _controller = Get.put(QuranGetxController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset('assets/images/quran/others/quranBackground.png',
            width: double.infinity, height: double.infinity, fit: BoxFit.cover),
        SafeArea(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _controller.surahNames.length,
            itemBuilder: (context, index) {
              return FaharasItem(
                  type:int.parse( _controller.surahNames[index]["type"]),
                  numOfSurah: _controller.surahNames[index]["index"],
                  numOfAyah: _controller.surahNames[index]["count"],
                  numOfPage: _controller.surahNames[index]["page"]);
            },
          ),
        )
      ],
    ));
  }


}
