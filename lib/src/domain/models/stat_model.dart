class StatModel {
  StatModel({
    required this.affectingMoves,
    required this.affectingNatures,
    required this.characteristics,
    required this.gameIndex,
    required this.id,
    required this.isBattleOnly,
    required this.moveDamageClass,
    required this.name,
    required this.names,
  });

  final Affecting? affectingMoves;
  final Affecting? affectingNatures;
  final List<Characteristic>? characteristics;
  final int? gameIndex;
  final int id;
  final bool? isBattleOnly;
  final dynamic moveDamageClass;
  final String? name;
  final List<Name>? names;

  factory StatModel.fromJson(Map<String, dynamic>? json) {
    return StatModel(
      affectingMoves: Affecting.fromJson(json?["affecting_moves"]),
      affectingNatures: Affecting.fromJson(json?["affecting_natures"]),
      characteristics: json?["characteristics"] == null
          ? []
          : List<Characteristic>.from(
              json?["characteristics"]!.map((x) => Characteristic.fromJson(x))),
      gameIndex: json?["game_index"],
      id: json?["id"],
      isBattleOnly: json?["is_battle_only"],
      moveDamageClass: json?["move_damage_class"],
      name: json?["name"],
      names: json?["names"] == null
          ? []
          : List<Name>.from(json?["names"]!.map((x) => Name.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "affecting_moves": affectingMoves?.toJson(),
        "affecting_natures": affectingNatures?.toJson(),
        "characteristics": characteristics == null
            ? []
            : List<dynamic>.from(characteristics!.map((x) => x.toJson())),
        "game_index": gameIndex,
        "id": id,
        "is_battle_only": isBattleOnly,
        "move_damage_class": moveDamageClass,
        "name": name,
        "names": names == null ? [] : List<dynamic>.from(names!.map((x) => x.toJson())),
      };
}

class Affecting {
  Affecting({
    required this.decrease,
    required this.increase,
  });

  final List<dynamic>? decrease;
  final List<dynamic>? increase;

  factory Affecting.fromJson(Map<String, dynamic>? json) {
    return Affecting(
      decrease:
          json?["decrease"] == null ? [] : List<dynamic>.from(json?["decrease"]!.map((x) => x)),
      increase:
          json?["increase"] == null ? [] : List<dynamic>.from(json?["increase"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "decrease": decrease == null ? [] : List<dynamic>.from(decrease!.map((x) => x)),
        "increase": increase == null ? [] : List<dynamic>.from(increase!.map((x) => x)),
      };
}

class Characteristic {
  Characteristic({
    required this.url,
  });

  final String? url;

  factory Characteristic.fromJson(Map<String, dynamic>? json) {
    return Characteristic(
      url: json?["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Name {
  Name({
    required this.language,
    required this.name,
  });

  final Language? language;
  final String? name;

  factory Name.fromJson(Map<String, dynamic>? json) {
    return Name(
      language: Language.fromJson(json?["language"]),
      name: json?["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "language": language?.toJson(),
        "name": name,
      };
}

class Language {
  Language({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  factory Language.fromJson(Map<String, dynamic>? json) {
    return Language(
      name: json?["name"],
      url: json?["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
