import 'package:drift/drift.dart';

class Date extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get type => text()();

  TextColumn get title => text()();

  DateTimeColumn get date => dateTime()();
}