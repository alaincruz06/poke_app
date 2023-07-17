class TypeModel {
  TypeModel({
    required this.id,
    required this.name,
    required this.damageRelations,
    required this.pastDamageRelations,
    required this.gameIndices,
    required this.generation,
    required this.moveDamageClass,
    required this.names,
    required this.pokemon,
    required this.moves,
  });

  final int id;
  final String? name;
  final DamageRelations? damageRelations;
  final List<PastDamageRelation>? pastDamageRelations;
  final List<GameIndex>? gameIndices;
  final Generation? generation;
  final Generation? moveDamageClass;
  final List<Name>? names;
  final List<Pokemon>? pokemon;
  final List<Generation>? moves;

  TypeModel copyWith({
    int? id,
    String? name,
    DamageRelations? damageRelations,
    List<PastDamageRelation>? pastDamageRelations,
    List<GameIndex>? gameIndices,
    Generation? generation,
    Generation? moveDamageClass,
    List<Name>? names,
    List<Pokemon>? pokemon,
    List<Generation>? moves,
  }) {
    return TypeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      damageRelations: damageRelations ?? this.damageRelations,
      pastDamageRelations: pastDamageRelations ?? this.pastDamageRelations,
      gameIndices: gameIndices ?? this.gameIndices,
      generation: generation ?? this.generation,
      moveDamageClass: moveDamageClass ?? this.moveDamageClass,
      names: names ?? this.names,
      pokemon: pokemon ?? this.pokemon,
      moves: moves ?? this.moves,
    );
  }

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      damageRelations: json["damage_relations"] == null
          ? null
          : DamageRelations.fromJson(json["damage_relations"]),
      pastDamageRelations: json["past_damage_relations"] == null
          ? null
          : List<PastDamageRelation>.from(
              json["past_damage_relations"].map((x) => PastDamageRelation.fromJson(x))),
      gameIndices: json["game_indices"] == null
          ? null
          : List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromJson(x))),
      generation: json["generation"] == null ? null : Generation.fromJson(json["generation"]),
      moveDamageClass:
          json["move_damage_class"] == null ? null : Generation.fromJson(json["move_damage_class"]),
      names: json["names"] == null
          ? null
          : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
      pokemon: json["pokemon"] == null
          ? null
          : List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
      moves: json["moves"] == null
          ? null
          : List<Generation>.from(json["moves"].map((x) => Generation.fromJson(x))),
    );
  }
}

class DamageRelations {
  DamageRelations({
    required this.noDamageTo,
    required this.halfDamageTo,
    required this.doubleDamageTo,
    required this.noDamageFrom,
    required this.halfDamageFrom,
    required this.doubleDamageFrom,
  });

  final List<Generation>? noDamageTo;
  final List<Generation>? halfDamageTo;
  final List<Generation>? doubleDamageTo;
  final List<Generation>? noDamageFrom;
  final List<Generation>? halfDamageFrom;
  final List<Generation>? doubleDamageFrom;

  DamageRelations copyWith({
    List<Generation>? noDamageTo,
    List<Generation>? halfDamageTo,
    List<Generation>? doubleDamageTo,
    List<Generation>? noDamageFrom,
    List<Generation>? halfDamageFrom,
    List<Generation>? doubleDamageFrom,
  }) {
    return DamageRelations(
      noDamageTo: noDamageTo ?? this.noDamageTo,
      halfDamageTo: halfDamageTo ?? this.halfDamageTo,
      doubleDamageTo: doubleDamageTo ?? this.doubleDamageTo,
      noDamageFrom: noDamageFrom ?? this.noDamageFrom,
      halfDamageFrom: halfDamageFrom ?? this.halfDamageFrom,
      doubleDamageFrom: doubleDamageFrom ?? this.doubleDamageFrom,
    );
  }

  factory DamageRelations.fromJson(Map<String, dynamic> json) {
    return DamageRelations(
      noDamageTo: json["no_damage_to"] == null
          ? null
          : List<Generation>.from(json["no_damage_to"].map((x) => Generation.fromJson(x))),
      halfDamageTo: json["half_damage_to"] == null
          ? null
          : List<Generation>.from(json["half_damage_to"].map((x) => Generation.fromJson(x))),
      doubleDamageTo: json["double_damage_to"] == null
          ? null
          : List<Generation>.from(json["double_damage_to"].map((x) => Generation.fromJson(x))),
      noDamageFrom: json["no_damage_from"] == null
          ? null
          : List<Generation>.from(json["no_damage_from"].map((x) => Generation.fromJson(x))),
      halfDamageFrom: json["half_damage_from"] == null
          ? null
          : List<Generation>.from(json["half_damage_from"].map((x) => Generation.fromJson(x))),
      doubleDamageFrom: json["double_damage_from"] == null
          ? null
          : List<Generation>.from(json["double_damage_from"].map((x) => Generation.fromJson(x))),
    );
  }
}

class Generation {
  Generation({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Generation copyWith({
    String? name,
    String? url,
  }) {
    return Generation(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory Generation.fromJson(Map<String, dynamic> json) {
    return Generation(
      name: json["name"] == null ? null : json["name"],
      url: json["url"] == null ? null : json["url"],
    );
  }
}

class GameIndex {
  GameIndex({
    required this.gameIndex,
    required this.generation,
  });

  final int? gameIndex;
  final Generation? generation;

  GameIndex copyWith({
    int? gameIndex,
    Generation? generation,
  }) {
    return GameIndex(
      gameIndex: gameIndex ?? this.gameIndex,
      generation: generation ?? this.generation,
    );
  }

  factory GameIndex.fromJson(Map<String, dynamic> json) {
    return GameIndex(
      gameIndex: json["game_index"] == null ? null : json["game_index"],
      generation: json["generation"] == null ? null : Generation.fromJson(json["generation"]),
    );
  }
}

class Name {
  Name({
    required this.name,
    required this.language,
  });

  final String? name;
  final Generation? language;

  Name copyWith({
    String? name,
    Generation? language,
  }) {
    return Name(
      name: name ?? this.name,
      language: language ?? this.language,
    );
  }

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      name: json["name"] == null ? null : json["name"],
      language: json["language"] == null ? null : Generation.fromJson(json["language"]),
    );
  }
}

class PastDamageRelation {
  PastDamageRelation({
    required this.generation,
    required this.damageRelations,
  });

  final Generation? generation;
  final DamageRelations? damageRelations;

  PastDamageRelation copyWith({
    Generation? generation,
    DamageRelations? damageRelations,
  }) {
    return PastDamageRelation(
      generation: generation ?? this.generation,
      damageRelations: damageRelations ?? this.damageRelations,
    );
  }

  factory PastDamageRelation.fromJson(Map<String, dynamic> json) {
    return PastDamageRelation(
      generation: json["generation"] == null ? null : Generation.fromJson(json["generation"]),
      damageRelations: json["damage_relations"] == null
          ? null
          : DamageRelations.fromJson(json["damage_relations"]),
    );
  }
}

class Pokemon {
  Pokemon({
    required this.slot,
    required this.pokemon,
  });

  final int? slot;
  final Generation? pokemon;

  Pokemon copyWith({
    int? slot,
    Generation? pokemon,
  }) {
    return Pokemon(
      slot: slot ?? this.slot,
      pokemon: pokemon ?? this.pokemon,
    );
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      slot: json["slot"] == null ? null : json["slot"],
      pokemon: json["pokemon"] == null ? null : Generation.fromJson(json["pokemon"]),
    );
  }
}
