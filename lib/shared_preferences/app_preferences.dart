import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences{
  static final AppPreferences _instance = AppPreferences._internal();
  late SharedPreferences _sharedPreferences;
  factory AppPreferences(){
    return _instance;
  }
  AppPreferences._internal();

  Future<void> initPreferences () async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //..........................................................
  // quran functions
  Future<void> themeLightMode({bool lightMode = true}) async{
    await _sharedPreferences.setBool('lightMode', lightMode);
  }
  bool get isLightMode => _sharedPreferences.getBool('lightMode') ?? true;
  Future<void> setBookMark(int index) async{
    await _sharedPreferences.setInt('indexBookMark', index);
  }
  int get getIndexBookMark => _sharedPreferences.getInt('indexBookMark') ?? -1;

//..........................................................
// hesen-elmuslim functions
}