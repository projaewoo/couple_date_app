import 'package:couple_date_app/database/drift_database.dart';
import 'package:couple_date_app/model/date_type.dart';
import 'package:flutter/material.dart';
import 'package:couple_date_app/screen/home_screen.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  final database = LocalDatabase();   // database 호출
  GetIt.I.registerSingleton<LocalDatabase>(database);   // 어디서든 GetIt 클래스를 사용하여 database 가져올 수 있음.
  // debugPaintSizeEnabled = true;   // simulator에 위젯 표시
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DateModel()),
    ],
    child: MaterialApp(
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
    ),
  ));
}

class DateModel extends ChangeNotifier {
  List<DateType> _dateList = [];
  DateTime _date = DateTime.now();
  String _dateName = '';

  List<DateType> get dateList => _dateList;
  DateTime get date => _date;
  String get dateName => _dateName;

  void changeDate (DateTime date) {
    _date = date;
    notifyListeners();
  }

  void changeDateName (String dateName) {
    _dateName = dateName;
    notifyListeners();
  }

  void addDate () {
    _dateList.add(DateType(date: _date, dateName: _dateName));
  }

  // TODO. subtract
  void subtractDate (int index) {
    _dateList.removeAt(index);
  }
}