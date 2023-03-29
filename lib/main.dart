import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zad_almuslim/components/routeNames.dart';
import 'package:zad_almuslim/shared_preferences/app_preferences.dart';

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences().initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(bodyText2: TextStyle(fontFamily: 'Othmain')),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('ar'),
        Locale('en')
      ],
      locale: const Locale('ar'),
      initialRoute: Routes.lunchScreenRoute,
      routes: Routes.routesName,
    );
  }
}
