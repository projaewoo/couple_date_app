import 'package:couple_date_app/component/title_box.dart';
import 'package:couple_date_app/main.dart';
import 'package:couple_date_app/screen/createDate_date_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              _Title(),
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

  Widget _PopButton() {
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

  Widget _Title() {
    return Expanded(
      child: TitleBox(
        type: 'textField',
        text: '이벤트 제목은?',
        imageUrl: 'asset/img/paper/paper_L.png',
        imageHeight: 70,
        onChanged: (String dateName) {
          title= dateName;
        },
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
