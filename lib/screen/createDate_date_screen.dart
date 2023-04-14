import 'package:couple_date_app/component/title_box.dart';
import 'package:couple_date_app/database/drift_database.dart';
import 'package:couple_date_app/main.dart';
import 'package:couple_date_app/screen/home_screen.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class CreateDate_Date extends StatefulWidget {
  final Map<String, String> data;
  const CreateDate_Date({required this.data, Key? key}) : super(key: key);

  @override
  State<CreateDate_Date> createState() => _CreateDate_DateState();
}

class _CreateDate_DateState extends State<CreateDate_Date> {
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('asset/img/paper/background.png'),
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              _PopButton(),
              Expanded(
                child: TitleBox(
                  type: 'button',
                  text:
                      '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일',
                  imageUrl: 'asset/img/paper/paper_L.png',
                  imageHeight: 85,
                  onPressed: onPressedButton,
                ),
              ),
              InkWell(
                onTap: goHomePage,
                child: Image.asset('asset/img/button/completeButton_white.png',
                    width: 150),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressedButton() {
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: 300,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
            ),
          );
        });
  }

  void goHomePage() async {
    // TODO. Provider 로직 제거
    Provider.of<DateModel>(context, listen: false).changeDate(selectedDate);

    // TODO. Provider 로직 제거
    Provider.of<DateModel>(context, listen: false).addDate();

    await GetIt.I<LocalDatabase>().createDate(DateCompanion(
        type: Value('testType'),
        title: Value(Provider.of<DateModel>(context, listen: false).dateName),
        date: Value(selectedDate)));

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return HomeScreen();
    }));
  }
}

class _PopButton extends StatelessWidget {
  const _PopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ],
    );
  }
}
