import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> savePlayedPick(String pickname, String selecedItem) async {
    var prefs = await _prefs;
    var timeString = DateTime.now().add(new Duration(minutes: 1)).toString();
    return prefs.setStringList('pick-$pickname', [selecedItem, timeString]);
  }

  Future<List<String>> getPlayedPick(String pickname) async {
    var prefs = await _prefs;
    return prefs.getStringList('pick-$pickname');
  }

  Future<bool> removePlayedPick(String pickname) async {
    var prefs = await _prefs;
    return prefs.remove('pick-$pickname');
  }
}
