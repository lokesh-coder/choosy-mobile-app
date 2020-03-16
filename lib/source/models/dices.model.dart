import 'package:coolflutterapp/source/dao/dice.dao.dart';
import 'package:coolflutterapp/source/models/choice.model.dart';
import 'package:coolflutterapp/source/models/dice.model.dart';
import 'package:flutter/material.dart';

class DicesModel with ChangeNotifier {
  List<Dice> dices = [];
  String _activeDiceID;

  get activeDice {
    if (_activeDiceID == null) return Dice();
    return dices.firstWhere((d) => d.id == _activeDiceID, orElse: () => Dice());
  }

  set activeDiceID(id) {
    _activeDiceID = id;
    notifyListeners();
  }

  fetchDices() async {
    List<Dice> dicesFromDB = await DiceDao().getAllDices();
    dices = dicesFromDB;
    notifyListeners();
  }

  insertDice(title) async {
    String lastInsertedID = await DiceDao().insertDice(Dice(title: '$title'));
    activeDiceID = lastInsertedID;
    fetchDices();
    return lastInsertedID;
  }

  updateDice(id, title) async {
    await DiceDao().updateDice(Dice(id: '$id', title: '$title'));
    fetchDices();
  }

  deleteDice(String diceID) async {
    await DiceDao().delete(Dice(id: diceID));
    fetchDices();
  }

  setPlayedTime(String diceID, String choiceID) async {
    await DiceDao().pickAChoice(diceID, choiceID);
    fetchDices();
  }

  clearLastPlayedTime(String diceID) async {
    await DiceDao().pickAChoice(diceID);
    fetchDices();
  }

  getDices() {
    return dices;
  }

  insertChoice(diceID, choiceName) async {
    await DiceDao().insertChoice(diceID, Choice(name: '$choiceName'));
    fetchDices();
  }

  deleteChoice(diceID, choiceID) async {
    await DiceDao().pickAChoice(diceID);
    await DiceDao().deleteChoice(diceID, choiceID);
    fetchDices();
  }
}
