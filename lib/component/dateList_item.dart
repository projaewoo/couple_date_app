import 'package:couple_date_app/component/font.dart';
import 'package:couple_date_app/main.dart';
import 'package:couple_date_app/screen/date_detail_screen.dart';
import 'package:couple_date_app/screen/date_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum Actions { share, delete, archive }

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
    return Consumer<DateModel>(
      builder: (context, date, child) {
        return Slidable(
          endActionPane: ActionPane(
            motion: const BehindMotion(),
            children: [
              SlidableAction(
                backgroundColor: Colors.red,
                icon: Icons.delete,
                onPressed: (context) => _onDismissed(widget.index, Actions.delete),
              ),
            ],
          ),
          child: Row(
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
                      child: GestureDetector(
                          child: Text(widget.text, style: mysen_small_black),
                          onTap: goDetailPage),
                    ),
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
          ),
        );
      },
    );
  }

  void _onDismissed(int index, Actions actions) {
    switch (actions) {
      case Actions.delete:
        Provider.of<DateModel>(context, listen: false)
            .subtractDate(index);
        Provider.of<DateModel>(context, listen: false).notifyListeners();
        break;
      case Actions.archive:
        print('archive');
        break;
      case Actions.share:
        print('share');
        break;
    }
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
