import 'package:zad_almuslim/screens/hesn_elmuslim/hesn_elmuslim_menu.dart';

import '../screens/home_screen.dart';
import '../screens/lunch_screen.dart';
import '../screens/quran/quran_menu.dart';
import '../screens/quran/quran_menu/faharas.dart';
import '../screens/quran/quran_menu/quran_book.dart';

class Routes{
  static const lunchScreenRoute = '/lunchScreen';
  static const homeScreenRoute = '/homeScreen';
  static const quranRoute = '/quranScreen';
  static const quranBookRoute = '/quranBook';
  static const quranFaharasRoute = '/quranFaharas';
  static const hesnElmuslimRoute = '/hesnElmuslimRoute';
  static var routesName =  {
    Routes.lunchScreenRoute:(context)=>const LunchScreen(),
    Routes.homeScreenRoute:(context)=>const HomeScreen(),
    Routes.quranRoute:(context)=> const QuranMenu(),
    Routes.quranBookRoute:(context)=> QuranBook(),
    Routes.quranFaharasRoute:(context)=>const Faharas(),
    Routes.hesnElmuslimRoute:(context)=>const HesnElmuslimMenu(),
  };
}
