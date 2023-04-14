import 'package:couple_date_app/component/component_header.dart';
import 'package:couple_date_app/component/textField.dart';
import 'package:couple_date_app/component/title_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Date_Edit extends StatefulWidget {
  final int id;
  final String title;
  final DateTime date;
  const Date_Edit(
      {required this.id, required this.date, required this.title, Key? key})
      : super(key: key);

  @override
  State<Date_Edit> createState() => _Date_EditState();
}

class _Date_EditState extends State<Date_Edit> {
  late String selectedTitle;
  late DateTime selectedDate;
  @override
  void initState() {
    selectedTitle = widget.title;
    selectedDate =
        DateTime(widget.date.year, widget.date.month, widget.date.day);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/img/paper/background.png'),
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Component_Header(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Stack(
                      children: [
                        Image.asset('asset/img/paper/bigpaper.png'),
                        Positioned.fill(
                          top: 10,
                          left: 10,
                          child: Column(
                            children: [
                              TextFieldComponent(
                                  text: selectedTitle,
                                  onChanged: (String title) {
                                    setState(() {
                                      selectedTitle = title;
                                    });
                                  }),
                              TitleBox(
                                type: 'button',
                                text:
                                    '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일',
                                imageUrl: 'asset/img/paper/paper_L.png',
                                imageHeight: 85,
                                onPressed: onDatePressed,
                              ),
                              InkWell(
                                onTap: onComplete,
                                child: Image.asset(
                                    'asset/img/button/completeButton_white.png',
                                    width: 150),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void onDatePressed() {
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

  void onComplete() {
    Navigator.of(context).pop();
  }
}
