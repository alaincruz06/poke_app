class MoveAilmentModel {
  MoveAilmentModel({
    required this.id,
    required this.moves,
    required this.name,
    required this.names,
  });

  final int id;
  final List<Move>? moves;
  final String? name;
  final List<Name>? names;

  factory MoveAilmentModel.fromJson(Map<String, dynamic>? json) {
    return MoveAilmentModel(
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
        "id": id,
        "moves": moves == null ? [] : List<dynamic>.from(moves!.map((x) => x.toJson())),
        "name": name,
        "names": names == null ? [] : List<dynamic>.from(names!.map((x) => x.toJson())),
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
