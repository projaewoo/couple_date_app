import 'dart:io';

import 'package:couple_date_app/model/date.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [Date],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // INSERT
  Future<int> createDate(DateCompanion data) => into(date).insert(data);

  // SELECT used to Future
  Future<List<DateData>> getDates() => select(date).get();

  Future<DateData> getDate(int id) async {
    return await (select(date)..where((table) => table.id.equals(id)))
        .getSingle();
  }

  // SELECT used to Stream
  Stream<List<DateData>> watchDates() {
    return select(date).watch();
  }

  // EDIT
  Future<int> updateDate(int id, DateCompanion data) async {
    return await (update(date)..where((table) => table.id.equals(id)))
        .write(data);
  }

  // DELETE
  Future<int> deleteDate(int id) =>
      (delete(date)..where((table) => table.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    // dbFolder.path에 db.sqlite파일 생성 후, file변수에 저장.
    return NativeDatabase(file);
  });
}
