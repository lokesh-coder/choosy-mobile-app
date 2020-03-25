import 'package:choosy/source/models/choice.model.dart';

class Dice {
  final String id;
  final String title;
  final int lastModifiedTime;
  final int createdTime;
  final int lastPlayedTime;
  final List<Choice> choices;

  Dice(
      {this.id,
      this.title,
      this.lastModifiedTime,
      this.createdTime,
      this.lastPlayedTime,
      this.choices});

  factory Dice.fromJson(Map<String, dynamic> json) {
    return Dice(
      id: json["id"],
      title: json["title"],
      lastModifiedTime: json["lastModifiedTime"],
      createdTime: json["createdTime"],
      lastPlayedTime: json["lastPlayedTime"],
      choices: (json["choices"] ?? [])
          .map<Choice>((c) => Choice.fromJson(c))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'lastModifiedTime': lastModifiedTime,
        'lastPlayedTime': lastPlayedTime,
        'createdTime': createdTime,
        'choices': choices?.map((choice) => choice.toJson())?.toList()
      };

  Map<String, dynamic> toTruthyJson() {
    var coll = {};
    if (id != null) {
      coll['id'] = id;
    }
    if (title != null) {
      coll['title'] = title;
    }
    if (lastModifiedTime != null) {
      coll['lastModifiedTime'] = lastModifiedTime;
    }
    if (lastPlayedTime != null) {
      coll['lastPlayedTime'] = lastPlayedTime;
    }
    if (createdTime != null) {
      coll['createdTime'] = createdTime;
    }
    if (choices != null) {
      coll['choices'] = choices?.map((choice) => choice.toJson())?.toList();
    }
    return Map.from(coll);
  }
}
