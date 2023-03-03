import 'package:couple_date_app/component/title_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    // print(widget.data);
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
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ],
              ),
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
                onTap: () {},
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
}
