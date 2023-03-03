import 'package:flutter/material.dart';
import 'package:couple_date_app/screen/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        fontFamily: 'notosans',
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 80,
          ),
          headline2: TextStyle(
              color: Colors.white, fontSize: 50, fontWeight: FontWeight.w700),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )),
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      Locale('ko', ''),
      Locale('en', ''),
    ],
    home: HomeScreen(),
  ));
}
