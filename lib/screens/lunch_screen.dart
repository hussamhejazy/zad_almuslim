import 'package:flutter/material.dart';
import 'package:zad_almuslim/components/routeNames.dart';

import '../utils/size_config.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
     Navigator.pushReplacementNamed(context,Routes.homeScreenRoute);
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().designWidth(3.93).designHeight(8.51).init(context);
    return Scaffold(
      body: Center(
        child: Stack (
          children: [
            Image.asset(
                'assets/images/lunch_screen_assets/background.png',
                width: double.infinity,
                fit: BoxFit.cover
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/lunch_screen_assets/logo.png',scale: SizeConfig().scaleWidth(1.8),)
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
