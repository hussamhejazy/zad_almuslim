import 'package:get/get.dart';
import 'package:zad_almuslim/shared_preferences/app_preferences.dart';

class QuranGetxController extends GetxController {
  int currentNumberOfSurha = 0;

  late List surahNames = [];

  void getSurahsFromJson(List surahNames){
    this.surahNames = surahNames;
    update();
  }

  void updateNumberOfSurha(int index) {
    currentNumberOfSurha = index;
    update();
  }

  void indexBookMark() {
    AppPreferences().setBookMark(currentNumberOfSurha);
    update();
  }

  int get indexMark => AppPreferences().getIndexBookMark;


  void enableLightMode() {
    AppPreferences().themeLightMode(lightMode: true);
    update();
  }

  void disableLightMode() {
    AppPreferences().themeLightMode(lightMode: false);
    update();
  }

  bool get isLightMode => AppPreferences().isLightMode;
}