import 'package:couple_date_app/component/dateList_item.dart';
import 'package:couple_date_app/component/font.dart';
import 'package:couple_date_app/component/title_box.dart';
import 'package:couple_date_app/database/drift_database.dart';
import 'package:couple_date_app/main.dart';
import 'package:couple_date_app/screen/createDate_type_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('asset/img/paper/background.png'),
      )),
      child: StreamBuilder<List<DateData>>(
        stream: GetIt.I<LocalDatabase>().watchDates(),
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          '그 날,',
                          style: mago_small_black,
                        ),
                      )
                    ],
                  ),
                  if (!snapshot.hasData)
                    Expanded(
                      child: TitleBox(
                        type: 'button',
                        text: 'Day를 추가해주세요',
                        imageUrl: 'asset/img/paper/paper_L_01.png',
                        imageHeight: 120,
                        onPressed: goCreateDatePage,
                      ),
                    ),
                  if (snapshot.hasData) renderDateList()
                ],
              ),
            ),
          );
        },
      ),
      // child: Consumer<DateModel>(builder: (context, date, child) {
      //   return Scaffold(
      //     backgroundColor: Colors.transparent,
      //     body: SafeArea(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Center(
      //                 child: Text(
      //                   '그 날,',
      //                   style: mago_small_black,
      //                 ),
      //               ),
      //             ],
      //           ),
      //           if (date.dateList.length == 0)
      //             Expanded(
      //               child: TitleBox(
      //                 type: 'button',
      //                 text: 'Day를 추가해주세요',
      //                 imageUrl: 'asset/img/paper/paper_L_01.png',
      //                 imageHeight: 120,
      //                 onPressed: goCreateDatePage,
      //               ),
      //             ),
      //           if (date.dateList.length != 0) renderDateList(),
      //         ],
      //       ),
      //     ),
      //   );
      // })
    );
  }

  void goCreateDatePage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return CreateDate_Type();
    }));
  }
}

class renderDateList extends StatefulWidget {
  const renderDateList({Key? key}) : super(key: key);

  @override
  State<renderDateList> createState() => _renderDateListState();
}

class _renderDateListState extends State<renderDateList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _DateList(),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: goCreateDatePage,
                child:
                    Image.asset('asset/img/button/plus_black.png', width: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goCreateDatePage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return CreateDate_Type();
    }));
  }
}

class _DateList extends StatelessWidget {
  const _DateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DateData>>(
      stream: GetIt.I<LocalDatabase>().watchDates(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final dateList = snapshot.data!;
          return Column(
            children: dateList
                .asMap()
                .entries
                .map((dateState) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: DateListItem(
                          index: dateState.key,
                          id: dateState.value.id,
                          date: dateState.value.date,
                          title: '${dateState.value.title}',
                        )),
                        // text:
                        //     '${dateState.value.date.year}. ${dateState.value.date.month}. ${dateState.value.date.day} \n${dateState.value.title}')),
                      ],
                    ))
                .toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
