import 'package:flutter/material.dart';
import 'package:zad_almuslim/components/routeNames.dart';

import '../components/cards_app.dart';
import '../components/colors.dart';
import '../utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Text(
            'زاد المسلم',
            style: TextStyle(
                fontSize: SizeConfig().scaleTextFont(26),
                fontWeight: FontWeight.bold,
                color: outlineCardHomePage,
                letterSpacing: 3,
                wordSpacing: 5),
          ),
          centerTitle: true,
          backgroundColor: primaryLight,
        ),
        body: Stack(
          children: [
            Image.asset('assets/images/home_screen_assets/background.png',
                width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(22),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: [
                  ButtonCardHomePage(
                    imagePath:
                        'assets/images/home_screen_assets/iconsCardViewHomePage/quran.png',
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.quranRoute),
                  ),
                  ButtonCardHomePage(
                    imagePath:
                        'assets/images/home_screen_assets/iconsCardViewHomePage/hesn_elmuslim.png',
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.hesnElmuslimRoute),
                  ),
                  ButtonCardHomePage(
                    imagePath:
                        'assets/images/home_screen_assets/iconsCardViewHomePage/naw40.png',
                    onTap: () {},
                  ),
                  ButtonCardHomePage(
                    imagePath:
                        'assets/images/home_screen_assets/iconsCardViewHomePage/asma_allah_elhosna.png',
                    onTap: () {},
                  ),
                  ButtonCardHomePage(
                    imagePath:
                        'assets/images/home_screen_assets/iconsCardViewHomePage/zkatk.png',
                    onTap: () {},
                  ),
                  ButtonCardHomePage(
                    imagePath:
                        'assets/images/home_screen_assets/iconsCardViewHomePage/hijri.png',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
