import 'package:couple_date_app/component/font.dart';
import 'package:couple_date_app/screen/date_detail_screen.dart';
import 'package:couple_date_app/screen/date_edit_screen.dart';
import 'package:flutter/material.dart';

class DateListItem extends StatefulWidget {
  final int index;
  final String text;
  const DateListItem({required this.index, required this.text, Key? key})
      : super(key: key);

  @override
  State<DateListItem> createState() => _DateListItemState();
}

class _DateListItemState extends State<DateListItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Stack(
            children: [
              GestureDetector(
                child: Image.asset(
                    'asset/img/paper/m_paper0${widget.index % 4 + 1}.png'),
                onTap: goDetailPage,
              ),
              Positioned(
                top: 10,
                left: 30,
                child: Text(widget.text, style: mysen_small_black),
              ),
              //
              Positioned(
                top: 10,
                right: 20,
                child: GestureDetector(
                    child: Icon(
                      Icons.edit,
                    ),
                    onTap: goDateEditPage),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void goDetailPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Date_Detail(index: widget.index);
    }));
  }

  void goDateEditPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Date_Edit();
    }));
  }
}
