import 'dart:io';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'choosy.db.g.dart';

class Picks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  DateTimeColumn get modifiedTime =>
      dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get lastPlayedTime =>
      dateTime().withDefault(Constant(DateTime.now()))();
}

class Choices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pid => integer().nullable()();
  TextColumn get choice => text()();
  DateTimeColumn get modifiedTime =>
      dateTime().withDefault(Constant(DateTime.now()))();
}

@UseMoor(tables: [Choices, Picks])
class ChoosyDatabase extends _$ChoosyDatabase {
  ChoosyDatabase()
      : super(
          LazyDatabase(() async {
            final dbFolder = await getApplicationDocumentsDirectory();
            final file = File(p.join(dbFolder.path, 'abc.sqlite'));
            return VmDatabase(file);
          }),
        );

  @override
  int get schemaVersion => 1;

  /* picks */
  Future<List<Pick>> get getAllPicks => select(picks).get();

  Future<List<Pick>> getPick(int id) => (select(picks)
        ..where((p) {
          return p.id.equals(id);
        }))
      .get();

  Future<int> addPick(Pick entry) async {
    return into(picks).insert(PicksCompanion(
        title: Value(entry.title.toString()),
        modifiedTime: Value(DateTime.now())));
  }

  Stream<List<Pick>> watchPicks() {
    return (select(picks)).watch();
  }

  Stream<List<dynamic>> watchPickWithChoices(id) {
    return select(picks)
        .join([innerJoin(choices, choices.pid.equalsExp(picks.id))])
        .watch()
        .map((rows) {
          return rows.map((row) {
            var _picks = row.readTable(picks);
            var _choices = row.readTable(choices);
            return {
              'id': _picks.id,
              'title': _picks.title,
              'choice': _choices.choice,
              'cid': _choices.id,
            };
          }).where((r) {
            return r['id'] == id;
          }).toList();
        });
  }

  Future<List<dynamic>> getPickWithChoices(id) async {
    var allPicks = await (select(picks)..where((pick) => pick.id.equals(id)))
        .join([innerJoin(choices, choices.pid.equalsExp(picks.id))]).get();

    return allPicks.map((row) {
      var _picks = row.readTable(picks);
      var _choices = row.readTable(choices);
      return {
        'id': _picks.id,
        'title': _picks.title,
        'choice': _choices.choice,
        'cid': _choices.id,
      };
    }).toList();
  }

  /* choices */

  Future<List<Choice>> get allChoiceEntries => select(choices).get();

  Stream<List<Choice>> watchChoices() {
    return (select(choices)).watch();
  }

  Future<int> addChoiceEntry(Choice entry) async {
    return into(choices).insert(ChoicesCompanion(
        pid: Value(entry.pid),
        choice: Value(entry.choice.toString()),
        modifiedTime: Value(DateTime.now())));
  }

  Future deleteChoice(int id) {
    return (delete(choices)..where((t) => t.id.equals(id))).go();
  }
}
