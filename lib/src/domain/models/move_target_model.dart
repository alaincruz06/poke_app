class MoveTargetModel {
  MoveTargetModel({
    required this.descriptions,
    required this.id,
    required this.moves,
    required this.name,
    required this.names,
  });

  final List<Description>? descriptions;
  final int id;
  final List<Move>? moves;
  final String? name;
  final List<Name>? names;

  factory MoveTargetModel.fromJson(Map<String, dynamic>? json) {
    return MoveTargetModel(
      descriptions: json?["descriptions"] == null
          ? []
          : List<Description>.from(json?["descriptions"]!.map((x) => Description.fromJson(x))),
      id: json?["id"],
      moves: json?["moves"] == null
          ? []
          : List<Move>.from(json?["moves"]!.map((x) => Move.fromJson(x))),
      name: json?["name"],
      names: json?["names"] == null
          ? []
          : List<Name>.from(json?["names"]!.map((x) => Name.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "descriptions":
            descriptions == null ? [] : List<dynamic>.from(descriptions!.map((x) => x.toJson())),
        "id": id,
        "moves": moves == null ? [] : List<dynamic>.from(moves!.map((x) => x.toJson())),
        "name": name,
        "names": names == null ? [] : List<dynamic>.from(names!.map((x) => x.toJson())),
      };
}

class Description {
  Description({
    required this.description,
    required this.language,
  });

  final String? description;
  final Move? language;

  factory Description.fromJson(Map<String, dynamic>? json) {
    return Description(
      description: json?["description"],
      language: Move.fromJson(json?["language"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "language": language?.toJson(),
      };
}

class Move {
  Move({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  factory Move.fromJson(Map<String, dynamic>? json) {
    return Move(
      name: json?["name"],
      url: json?["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Name {
  Name({
    required this.language,
    required this.name,
  });

  final Move? language;
  final String? name;

  factory Name.fromJson(Map<String, dynamic>? json) {
    return Name(
      language: Move.fromJson(json?["language"]),
      name: json?["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "language": language?.toJson(),
        "name": name,
      };
}
