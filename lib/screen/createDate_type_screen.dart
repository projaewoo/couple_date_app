import 'package:couple_date_app/component/title_box.dart';
import 'package:couple_date_app/screen/createDate_name_screen.dart';
import 'package:flutter/material.dart';

class CreateDate_Type extends StatefulWidget {
  const CreateDate_Type({Key? key}) : super(key: key);

  @override
  State<CreateDate_Type> createState() => _CreateDate_TypeState();
}

class _CreateDate_TypeState extends State<CreateDate_Type> {
  final String type = 'dDay';
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
              _Header(),
              _Body(),
              InkWell(
                onTap: goNamePage,
                child: Image.asset('asset/img/button/nextButton_white.png',
                    width: 150),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goNamePage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return CreateDate_Name(type: type);
      }),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

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

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleBox(
              type: 'text',
              text: '어떤 종류의 이벤트인가요?',
              imageUrl: 'asset/img/paper/paper_L.png',
              imageHeight: 85,
              onPressed: () {}),
          Container(
            width: double.infinity,
            child: TextButton(
              child: Text('D-Day'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
