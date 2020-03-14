class Choice {
  final String id;
  final String name;
  final bool isPicked;
  final int createdTime;

  Choice({this.id, this.name, this.isPicked, this.createdTime});

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        id: json["id"],
        name: json["name"],
        isPicked: json["isPicked"],
        createdTime: json["createdTime"],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'isPicked': isPicked,
        'createdTime': createdTime
      };
}
