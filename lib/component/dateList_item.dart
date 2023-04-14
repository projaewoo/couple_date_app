import 'package:couple_date_app/component/font.dart';
import 'package:couple_date_app/database/drift_database.dart';
import 'package:couple_date_app/screen/date_detail_screen.dart';
import 'package:couple_date_app/screen/date_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum Actions { share, delete, archive }

class DateListItem extends StatefulWidget {
  final int index;
  final int id;
  final DateTime date;
  final String title;
  const DateListItem(
      {required this.index,
      required this.id,
      required this.date,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  State<DateListItem> createState() => _DateListItemState();
}

class _DateListItemState extends State<DateListItem> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.red,
            icon: Icons.delete,
            onPressed: (context) => _onDismissed(widget.id, Actions.delete),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Stack(
              children: [
                _BackgroundPaper(),
                _TextBox(),
                _PencilIcon(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _BackgroundPaper() {
    return GestureDetector(
      child: Image.asset('asset/img/paper/m_paper0${widget.index % 4 + 1}.png'),
      onTap: goDetailPage,
    );
  }

  Widget _TextBox() {
    return Positioned(
      top: 10,
      left: 30,
      child: GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.date.year.toString()}. ${widget.date.month.toString()}. ${widget.date.day.toString()}',
                style: mysen_small_black,
              ),
              Text(
                widget.title,
                style: mysen_small_black,
              ),
            ],
          ),
          onTap: goDetailPage),
    );
  }

  Widget _PencilIcon() {
    return Positioned(
      top: 10,
      right: 20,
      child: GestureDetector(
          child: Icon(
            Icons.edit,
          ),
          onTap: () => goDateEditPage(widget.id)),
    );
  }

  void _onDismissed(int id, Actions actions) {
    switch (actions) {
      case Actions.delete:
        GetIt.I<LocalDatabase>().deleteDate(id);
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
      return Date_Detail(id: widget.id);
    }));
  }

  void goDateEditPage(int id) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Date_Edit(
        id: id,
        date: widget.date,
        title: widget.title,
      );
    }));
  }
}
