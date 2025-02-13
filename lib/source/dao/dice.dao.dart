import "package:choosy/source/db.setup.dart";
import 'package:choosy/source/models/choice.model.dart';
import 'package:choosy/source/models/dice.model.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/utils/value_utils.dart';
import 'package:uuid/uuid.dart';

class DiceDao {
  static const String folderName = "Dices";
  final _table = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  dumpData(List data) async {
    for (var d = 0; d < data.length; d++) {
      var choices = data[d].choices.map((c) {
        return {
          "id": Uuid().v1(),
          "name": c,
        };
      });
      await _table.add(await _db, {
        "id": Uuid().v1(),
        "title": data[d].title,
        "choices": choices,
      });
    }
  }

  Future insertDice(Dice dice) async {
    Map diceJson = dice.toJson();
    diceJson['id'] = Uuid().v1();
    diceJson['createdTime'] = DateTime.now().millisecondsSinceEpoch;
    await _table.add(await _db, diceJson);
    return diceJson['id'];
  }

  Future updateDice(Dice dice) async {
    final finder = Finder(filter: Filter.equals('id', dice.id));
    await _table.update(await _db, dice.toTruthyJson(), finder: finder);
  }

  Future delete(Dice dice) async {
    final finder = Finder(filter: Filter.equals('id', dice.id));
    await _table.delete(await _db, finder: finder);
  }

  Future dropDb() async {
    await _table.drop(await _db);
  }

  Future<RecordSnapshot<int, Map<String, dynamic>>> getADice(String id) async {
    final finder = Finder(filter: Filter.equals('id', id));
    return _table.findFirst(await _db, finder: finder);
  }

  Future<List<Dice>> getAllDices() async {
    final recordSnapshot = await _table.find(await _db);
    return recordSnapshot.map((snapshot) {
      return Dice.fromJson(snapshot.value);
    }).toList();
  }

  Future insertChoice(String id, Choice choice) async {
    final finder = Finder(filter: Filter.equals('id', id));
    RecordSnapshot<int, Map<String, dynamic>> result =
        await _table.findFirst(await _db, finder: finder);
    final diceObj = Dice.fromJson(result.value);
    Map choiceJson = choice.toJson();
    choiceJson['createdTime'] = DateTime.now().millisecondsSinceEpoch;
    choiceJson['id'] = Uuid().v1();
    diceObj.choices.add(Choice.fromJson(choiceJson));
    await updateDice(diceObj);
  }

  Future pickAChoice(String diceId, [String choiceId]) async {
    RecordSnapshot record = await getADice(diceId);
    Map dice = cloneValue(record.value);
    List choices = List.from(dice['choices'] ?? []);
    choices = choices.map((f) {
      if (f['id'] == choiceId) {
        f['isPicked'] = true;
      } else if (choiceId == null) {
        f['isPicked'] = null;
      }
      return f;
    }).toList();
    dice['lastModifiedTime'] = DateTime.now().millisecondsSinceEpoch;
    dice['lastPlayedTime'] =
        choiceId == null ? null : DateTime.now().millisecondsSinceEpoch;
    dice['choices'] = choices;
    final finder = Finder(filter: Filter.equals('id', diceId));
    await _table.update(await _db, dice, finder: finder);
  }

  Future deleteChoice(String id, String cid) async {
    var dice = await getADice(id);
    Map<String, dynamic> newDice = cloneMap(dice.value);
    newDice['choices'].removeWhere((c) => c['id'] == cid);
    await updateDice(Dice.fromJson(newDice));
  }
}
