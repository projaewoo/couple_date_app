import 'package:couple_date_app/component/title_box.dart';
import 'package:couple_date_app/screen/createDate_type_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      child: Scaffold(
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
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'mago', fontSize: 30),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TitleBox(
                  type: 'button',
                  text: 'Day를 추가해주세요',
                  imageUrl: 'asset/img/paper/paper_L_01.png',
                  imageHeight: 120,
                  onPressed: goCreateDatePage,
                ),
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
