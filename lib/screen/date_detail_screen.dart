import 'package:couple_date_app/component/font.dart';
import 'package:couple_date_app/main.dart';
import 'package:couple_date_app/screen/date_setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Date_Detail extends StatelessWidget {
  final int index;
  const Date_Detail({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateModel = Provider.of<DateModel>(context);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('asset/img/paper/background.png'),
        )),
        child: Consumer<DateModel>(builder: (context, date, child) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Header(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Stack(
                        children: [
                          Image.asset('asset/img/paper/bigpaper.png'),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _Body_Header(),
                                  Column(
                                    children: List.generate(
                                      10,
                                      (index) {
                                        final newDate = dateModel.date.add(Duration(days: (index + 1) * 100));
                                        return Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${(index + 1) * 100}일'),
                                          Text('${DateFormat('yyyy-MM-dd').format(newDate)}'),
                                        ]);
                                      }
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}

class _Header extends StatefulWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        Text(
          '그 날,',
          style: mago_small_black,
        ),
        TextButton(
          child: Text('수정'),
          onPressed: goSettingPage,
        ),
      ],
    );
  }

  void goSettingPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Setting();
    }));
  }
}

class _Body_Header extends StatelessWidget {
  const _Body_Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170, // Stack 위젯이 부모 위젯 영역을 넘지 않도록
      child: Stack(
        children: [
          Image.asset('asset/img/paper/we_met_green.png'),
          Positioned(
            top: 4.5,
            left: 15,
            child: Text('우리 만난 날', style: mago_small_black),
          )
        ],
      ),
    );
  }
}