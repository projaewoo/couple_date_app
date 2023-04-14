import 'package:couple_date_app/component/font.dart';
import 'package:couple_date_app/screen/date_setting_screen.dart';
import 'package:flutter/material.dart';

enum Type { pop, goSetting }

class Component_Header extends StatefulWidget {
  final Type? type;
  const Component_Header({this.type, Key? key}) : super(key: key);

  @override
  State<Component_Header> createState() => Component_HeaderState();
}

class Component_HeaderState extends State<Component_Header> {
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
        if (widget.type != null)
          TextButton(
            child: Text('수정'),
            onPressed: widget.type == Type.pop
                ? () => Navigator.of(context).pop()
                : goSettingPage,
          )
        else
          Container(
            color: Colors.transparent,
            // 수정 버튼이 있을 때와 UI위치 맞춰주기 위해
            width: 64,
            height: 48
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
