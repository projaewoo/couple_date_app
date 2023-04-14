import 'package:couple_date_app/database/drift_database.dart';
import 'package:couple_date_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:couple_date_app/component/component_header.dart';

class Date_Detail extends StatelessWidget {
  final int id;
  const Date_Detail({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Component_Header(type: Type.goSetting),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Stack(
                        children: [
                          Image.asset('asset/img/paper/bigpaper.png'),
                          Positioned.fill(
                            top: 10,
                            left: 10,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: Column(
                                children: [
                                  _DateList(id: id),
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

class _DateList extends StatelessWidget {
  final int id;
  const _DateList({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetIt.I<LocalDatabase>().getDate(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              final eachDate =
                  snapshot.data!.date.add(Duration(days: (index + 1) * 100));
              return Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${(index + 1) * 100}일'),
                    Text('${DateFormat('yyyy-MM-dd').format(eachDate)}'),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    width: 1.0,
                    color: Colors.black,
                  )),
                ),
              );
            }),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
