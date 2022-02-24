class PokemonStatModel {
  PokemonStatModel({
    required this.id,
    required this.name,
    required this.gameIndex,
    required this.isBattleOnly,
    required this.affectingMoves,
    required this.affectingNatures,
    required this.characteristics,
    required this.moveDamageClass,
    required this.names,
  });

  final int id;
  final String? name;
  final int? gameIndex;
  final bool? isBattleOnly;
  final AffectingMoves? affectingMoves;
  final AffectingNatures? affectingNatures;
  final List<Characteristic>? characteristics;
  final MoveDamageClass? moveDamageClass;
  final List<Name>? names;

  PokemonStatModel copyWith({
    int? id,
    String? name,
    int? gameIndex,
    bool? isBattleOnly,
    AffectingMoves? affectingMoves,
    AffectingNatures? affectingNatures,
    List<Characteristic>? characteristics,
    MoveDamageClass? moveDamageClass,
    List<Name>? names,
  }) {
    return PokemonStatModel(
      id: id ?? this.id,
      name: name ?? this.name,
      gameIndex: gameIndex ?? this.gameIndex,
      isBattleOnly: isBattleOnly ?? this.isBattleOnly,
      affectingMoves: affectingMoves ?? this.affectingMoves,
      affectingNatures: affectingNatures ?? this.affectingNatures,
      characteristics: characteristics ?? this.characteristics,
      moveDamageClass: moveDamageClass ?? this.moveDamageClass,
      names: names ?? this.names,
    );
  }

  factory PokemonStatModel.fromJson(Map<String, dynamic> json) {
    return PokemonStatModel(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      gameIndex: json["game_index"] == null ? null : json["game_index"],
      isBattleOnly:
          json["is_battle_only"] == null ? null : json["is_battle_only"],
      affectingMoves: json["affecting_moves"] == null
          ? null
          : AffectingMoves.fromJson(json["affecting_moves"]),
      affectingNatures: json["affecting_natures"] == null
          ? null
          : AffectingNatures.fromJson(json["affecting_natures"]),
      characteristics: json["characteristics"] == null
          ? null
          : List<Characteristic>.from(
              json["characteristics"].map((x) => Characteristic.fromJson(x))),
      moveDamageClass: json["move_damage_class"] == null
          ? null
          : MoveDamageClass.fromJson(json["move_damage_class"]),
      names: json["names"] == null
          ? null
          : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
    );
  }
}

class AffectingMoves {
  AffectingMoves({
    required this.increase,
    required this.decrease,
  });

  final List<Crease>? increase;
  final List<Crease>? decrease;

  AffectingMoves copyWith({
    List<Crease>? increase,
    List<Crease>? decrease,
  }) {
    return AffectingMoves(
      increase: increase ?? this.increase,
      decrease: decrease ?? this.decrease,
    );
  }

  factory AffectingMoves.fromJson(Map<String, dynamic> json) {
    return AffectingMoves(
      increase: json["increase"] == null
          ? null
          : List<Crease>.from(json["increase"].map((x) => Crease.fromJson(x))),
      decrease: json["decrease"] == null
          ? null
          : List<Crease>.from(json["decrease"].map((x) => Crease.fromJson(x))),
    );
  }
}

class Crease {
  Crease({
    required this.change,
    required this.move,
  });

  final int? change;
  final MoveDamageClass? move;

  Crease copyWith({
    int? change,
    MoveDamageClass? move,
  }) {
    return Crease(
      change: change ?? this.change,
      move: move ?? this.move,
    );
  }

  factory Crease.fromJson(Map<String, dynamic> json) {
    return Crease(
      change: json["change"] == null ? null : json["change"],
      move:
          json["move"] == null ? null : MoveDamageClass.fromJson(json["move"]),
    );
  }
}

class MoveDamageClass {
  MoveDamageClass({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  MoveDamageClass copyWith({
    String? name,
    String? url,
  }) {
    return MoveDamageClass(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory MoveDamageClass.fromJson(Map<String, dynamic> json) {
    return MoveDamageClass(
      name: json["name"] == null ? null : json["name"],
      url: json["url"] == null ? null : json["url"],
    );
  }
}

class AffectingNatures {
  AffectingNatures({
    required this.increase,
    required this.decrease,
  });

  final List<MoveDamageClass>? increase;
  final List<MoveDamageClass>? decrease;

  AffectingNatures copyWith({
    List<MoveDamageClass>? increase,
    List<MoveDamageClass>? decrease,
  }) {
    return AffectingNatures(
      increase: increase ?? this.increase,
      decrease: decrease ?? this.decrease,
    );
  }

  factory AffectingNatures.fromJson(Map<String, dynamic> json) {
    return AffectingNatures(
      increase: json["increase"] == null
          ? null
          : List<MoveDamageClass>.from(
              json["increase"].map((x) => MoveDamageClass.fromJson(x))),
      decrease: json["decrease"] == null
          ? null
          : List<MoveDamageClass>.from(
              json["decrease"].map((x) => MoveDamageClass.fromJson(x))),
    );
  }
}

class Characteristic {
  Characteristic({
    required this.url,
  });

  final String? url;

  Characteristic copyWith({
    String? url,
  }) {
    return Characteristic(
      url: url ?? this.url,
    );
  }

  factory Characteristic.fromJson(Map<String, dynamic> json) {
    return Characteristic(
      url: json["url"] == null ? null : json["url"],
    );
  }
}

class Name {
  Name({
    required this.name,
    required this.language,
  });

  final String? name;
  final MoveDamageClass? language;

  Name copyWith({
    String? name,
    MoveDamageClass? language,
  }) {
    return Name(
      name: name ?? this.name,
      language: language ?? this.language,
    );
  }

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      name: json["name"] == null ? null : json["name"],
      language: json["language"] == null
          ? null
          : MoveDamageClass.fromJson(json["language"]),
    );
  }
}
