class ItemModel {
  ItemModel({
    required this.id,
    required this.name,
    required this.cost,
    required this.flingPower,
    required this.flingEffect,
    required this.attributes,
    required this.category,
    required this.effectEntries,
    required this.flavorTextEntries,
    required this.gameIndices,
    required this.names,
    required this.sprites,
    required this.heldByPokemon,
    required this.babyTriggerFor,
  });

  final int id;
  final String? name;
  final int? cost;
  final int? flingPower;
  final Category? flingEffect;
  final List<Category>? attributes;
  final Category? category;
  final List<EffectEntry>? effectEntries;
  final List<FlavorTextEntry>? flavorTextEntries;
  final List<GameIndex>? gameIndices;
  final List<Name>? names;
  final Sprites? sprites;
  final List<HeldByPokemon>? heldByPokemon;
  final BabyTriggerFor? babyTriggerFor;

  ItemModel copyWith({
    int? id,
    String? name,
    int? cost,
    int? flingPower,
    Category? flingEffect,
    List<Category>? attributes,
    Category? category,
    List<EffectEntry>? effectEntries,
    List<FlavorTextEntry>? flavorTextEntries,
    List<GameIndex>? gameIndices,
    List<Name>? names,
    Sprites? sprites,
    List<HeldByPokemon>? heldByPokemon,
    BabyTriggerFor? babyTriggerFor,
  }) {
    return ItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      cost: cost ?? this.cost,
      flingPower: flingPower ?? this.flingPower,
      flingEffect: flingEffect ?? this.flingEffect,
      attributes: attributes ?? this.attributes,
      category: category ?? this.category,
      effectEntries: effectEntries ?? this.effectEntries,
      flavorTextEntries: flavorTextEntries ?? this.flavorTextEntries,
      gameIndices: gameIndices ?? this.gameIndices,
      names: names ?? this.names,
      sprites: sprites ?? this.sprites,
      heldByPokemon: heldByPokemon ?? this.heldByPokemon,
      babyTriggerFor: babyTriggerFor ?? this.babyTriggerFor,
    );
  }

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      cost: json["cost"] == null ? null : json["cost"],
      flingPower: json["fling_power"] == null ? null : json["fling_power"],
      flingEffect: json["fling_effect"] == null
          ? null
          : Category.fromJson(json["fling_effect"]),
      attributes: json["attributes"] == null
          ? null
          : List<Category>.from(
              json["attributes"].map((x) => Category.fromJson(x))),
      category:
          json["category"] == null ? null : Category.fromJson(json["category"]),
      effectEntries: json["effect_entries"] == null
          ? null
          : List<EffectEntry>.from(
              json["effect_entries"].map((x) => EffectEntry.fromJson(x))),
      flavorTextEntries: json["flavor_text_entries"] == null
          ? null
          : List<FlavorTextEntry>.from(json["flavor_text_entries"]
              .map((x) => FlavorTextEntry.fromJson(x))),
      gameIndices: json["game_indices"] == null
          ? null
          : List<GameIndex>.from(
              json["game_indices"].map((x) => GameIndex.fromJson(x))),
      names: json["names"] == null
          ? null
          : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
      sprites:
          json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
      heldByPokemon: json["held_by_pokemon"] == null
          ? null
          : List<HeldByPokemon>.from(
              json["held_by_pokemon"].map((x) => HeldByPokemon.fromJson(x))),
      babyTriggerFor: json["baby_trigger_for"] == null
          ? null
          : BabyTriggerFor.fromJson(json["baby_trigger_for"]),
    );
  }
}

class Category {
  Category({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Category copyWith({
    String? name,
    String? url,
  }) {
    return Category(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json["name"] == null ? null : json["name"],
      url: json["url"] == null ? null : json["url"],
    );
  }
}

class BabyTriggerFor {
  BabyTriggerFor({
    required this.url,
  });

  final String? url;

  BabyTriggerFor copyWith({
    String? url,
  }) {
    return BabyTriggerFor(
      url: url ?? this.url,
    );
  }

  factory BabyTriggerFor.fromJson(Map<String, dynamic> json) {
    return BabyTriggerFor(
      url: json["url"] == null ? null : json["url"],
    );
  }
}

class EffectEntry {
  EffectEntry({
    required this.effect,
    required this.shortEffect,
    required this.language,
  });

  final String? effect;
  final String? shortEffect;
  final Category? language;

  EffectEntry copyWith({
    String? effect,
    String? shortEffect,
    Category? language,
  }) {
    return EffectEntry(
      effect: effect ?? this.effect,
      shortEffect: shortEffect ?? this.shortEffect,
      language: language ?? this.language,
    );
  }

  factory EffectEntry.fromJson(Map<String, dynamic> json) {
    return EffectEntry(
      effect: json["effect"] == null ? null : json["effect"],
      shortEffect: json["short_effect"] == null ? null : json["short_effect"],
      language:
          json["language"] == null ? null : Category.fromJson(json["language"]),
    );
  }
}

class FlavorTextEntry {
  FlavorTextEntry({
    required this.text,
    required this.versionGroup,
    required this.language,
  });

  final String? text;
  final Category? versionGroup;
  final Category? language;

  FlavorTextEntry copyWith({
    String? text,
    Category? versionGroup,
    Category? language,
  }) {
    return FlavorTextEntry(
      text: text ?? this.text,
      versionGroup: versionGroup ?? this.versionGroup,
      language: language ?? this.language,
    );
  }

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) {
    return FlavorTextEntry(
      text: json["text"] == null ? null : json["text"],
      versionGroup: json["version_group"] == null
          ? null
          : Category.fromJson(json["version_group"]),
      language:
          json["language"] == null ? null : Category.fromJson(json["language"]),
    );
  }
}

class GameIndex {
  GameIndex({
    required this.gameIndex,
    required this.generation,
  });

  final int? gameIndex;
  final Category? generation;

  GameIndex copyWith({
    int? gameIndex,
    Category? generation,
  }) {
    return GameIndex(
      gameIndex: gameIndex ?? this.gameIndex,
      generation: generation ?? this.generation,
    );
  }

  factory GameIndex.fromJson(Map<String, dynamic> json) {
    return GameIndex(
      gameIndex: json["game_index"] == null ? null : json["game_index"],
      generation: json["generation"] == null
          ? null
          : Category.fromJson(json["generation"]),
    );
  }
}

class HeldByPokemon {
  HeldByPokemon({
    required this.pokemon,
    required this.versionDetails,
  });

  final Category? pokemon;
  final List<VersionDetail>? versionDetails;

  HeldByPokemon copyWith({
    Category? pokemon,
    List<VersionDetail>? versionDetails,
  }) {
    return HeldByPokemon(
      pokemon: pokemon ?? this.pokemon,
      versionDetails: versionDetails ?? this.versionDetails,
    );
  }

  factory HeldByPokemon.fromJson(Map<String, dynamic> json) {
    return HeldByPokemon(
      pokemon:
          json["pokemon"] == null ? null : Category.fromJson(json["pokemon"]),
      versionDetails: json["version_details"] == null
          ? null
          : List<VersionDetail>.from(
              json["version_details"].map((x) => VersionDetail.fromJson(x))),
    );
  }
}

class VersionDetail {
  VersionDetail({
    required this.rarity,
    required this.version,
  });

  final int? rarity;
  final Category? version;

  VersionDetail copyWith({
    int? rarity,
    Category? version,
  }) {
    return VersionDetail(
      rarity: rarity ?? this.rarity,
      version: version ?? this.version,
    );
  }

  factory VersionDetail.fromJson(Map<String, dynamic> json) {
    return VersionDetail(
      rarity: json["rarity"] == null ? null : json["rarity"],
      version:
          json["version"] == null ? null : Category.fromJson(json["version"]),
    );
  }
}

class Name {
  Name({
    required this.name,
    required this.language,
  });

  final String? name;
  final Category? language;

  Name copyWith({
    String? name,
    Category? language,
  }) {
    return Name(
      name: name ?? this.name,
      language: language ?? this.language,
    );
  }

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      name: json["name"] == null ? null : json["name"],
      language:
          json["language"] == null ? null : Category.fromJson(json["language"]),
    );
  }
}

class Sprites {
  Sprites({
    required this.spritesDefault,
  });

  final String? spritesDefault;

  Sprites copyWith({
    String? spritesDefault,
  }) {
    return Sprites(
      spritesDefault: spritesDefault ?? this.spritesDefault,
    );
  }

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      spritesDefault: json["default"] == null ? null : json["default"],
    );
  }
}
