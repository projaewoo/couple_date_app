import 'package:couple_date_app/component/title_box.dart';
import 'package:couple_date_app/screen/createDate_date_screen.dart';
import 'package:flutter/material.dart';

class CreateDate_Name extends StatefulWidget {
  final String type;
  CreateDate_Name({required this.type, Key? key}) : super(key: key);

  @override
  State<CreateDate_Name> createState() => _CreateDate_NameState();
}

class _CreateDate_NameState extends State<CreateDate_Name> {
  String title = '';
  @override
  Widget build(BuildContext context) {
    print(widget.type);
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
                  type: 'textField',
                  text: '이벤트 제목은?',
                  imageUrl: 'asset/img/paper/paper_L.png',
                  imageHeight: 85,
                  onPressed: () {},
                ),
              ),
              InkWell(
                onTap: goDatePage,
                child: Image.asset('asset/img/button/nextButton_white.png',
                    width: 150),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goDatePage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return CreateDate_Date(data: {'type': widget.type, 'title': title});
    }));
  }
}
