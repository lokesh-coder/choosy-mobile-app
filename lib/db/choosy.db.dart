import 'dart:io';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'choosy.db.g.dart';

class Choices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pid => integer().nullable()();
  TextColumn get choice => text()();
  DateTimeColumn get modifiedTime =>
      dateTime().withDefault(Constant(DateTime.now()))();
}

@UseMoor(tables: [Choices])
class ChoosyDatabase extends _$ChoosyDatabase {
  ChoosyDatabase()
      : super(
          LazyDatabase(() async {
            final dbFolder = await getApplicationDocumentsDirectory();
            final file = File(p.join(dbFolder.path, 'myDB.sqlite'));
            return VmDatabase(file);
          }),
        );

  @override
  int get schemaVersion => 1;

  Future<List<Choice>> get allChoiceEntries => select(choices).get();

  Stream<List<Choice>> watchChoices() {
    return (select(choices)).watch();
  }

  Future<int> addChoiceEntry(Choice entry) async {
    return into(choices).insert(ChoicesCompanion(
        choice: Value(entry.choice.toString()),
        modifiedTime: Value(DateTime.now())));
  }
}
