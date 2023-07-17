// ignore_for_file: prefer_if_null_operators

class AbilityModel {
  AbilityModel({
    required this.id,
    required this.name,
    required this.isMainSeries,
    required this.generation,
    required this.names,
    required this.effectEntries,
    required this.effectChanges,
    required this.flavorTextEntries,
    required this.pokemon,
  });

  final int id;
  final String? name;
  final bool? isMainSeries;
  final Generation? generation;
  final List<Name>? names;
  final List<AbilityModelEffectEntry>? effectEntries;
  final List<EffectChange>? effectChanges;
  final List<FlavorTextEntry>? flavorTextEntries;
  final List<Pokemon>? pokemon;

  AbilityModel copyWith({
    int? id,
    String? name,
    bool? isMainSeries,
    Generation? generation,
    List<Name>? names,
    List<AbilityModelEffectEntry>? effectEntries,
    List<EffectChange>? effectChanges,
    List<FlavorTextEntry>? flavorTextEntries,
    List<Pokemon>? pokemon,
  }) {
    return AbilityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isMainSeries: isMainSeries ?? this.isMainSeries,
      generation: generation ?? this.generation,
      names: names ?? this.names,
      effectEntries: effectEntries ?? this.effectEntries,
      effectChanges: effectChanges ?? this.effectChanges,
      flavorTextEntries: flavorTextEntries ?? this.flavorTextEntries,
      pokemon: pokemon ?? this.pokemon,
    );
  }

  factory AbilityModel.fromJson(Map<String, dynamic> json) {
    return AbilityModel(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      isMainSeries: json["is_main_series"] == null ? null : json["is_main_series"],
      generation: json["generation"] == null ? null : Generation.fromJson(json["generation"]),
      names: json["names"] == null
          ? null
          : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
      effectEntries: json["effect_entries"] == null
          ? null
          : List<AbilityModelEffectEntry>.from(
              json["effect_entries"].map((x) => AbilityModelEffectEntry.fromJson(x))),
      effectChanges: json["effect_changes"] == null
          ? null
          : List<EffectChange>.from(json["effect_changes"].map((x) => EffectChange.fromJson(x))),
      flavorTextEntries: json["flavor_text_entries"] == null
          ? null
          : List<FlavorTextEntry>.from(
              json["flavor_text_entries"].map((x) => FlavorTextEntry.fromJson(x))),
      pokemon: json["pokemon"] == null
          ? null
          : List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
    );
  }
}

class EffectChange {
  EffectChange({
    required this.versionGroup,
    required this.effectEntries,
  });

  final Generation? versionGroup;
  final List<EffectChangeEffectEntry>? effectEntries;

  EffectChange copyWith({
    Generation? versionGroup,
    List<EffectChangeEffectEntry>? effectEntries,
  }) {
    return EffectChange(
      versionGroup: versionGroup ?? this.versionGroup,
      effectEntries: effectEntries ?? this.effectEntries,
    );
  }

  factory EffectChange.fromJson(Map<String, dynamic> json) {
    return EffectChange(
      versionGroup:
          json["version_group"] == null ? null : Generation.fromJson(json["version_group"]),
      effectEntries: json["effect_entries"] == null
          ? null
          : List<EffectChangeEffectEntry>.from(
              json["effect_entries"].map((x) => EffectChangeEffectEntry.fromJson(x))),
    );
  }
}

class EffectChangeEffectEntry {
  EffectChangeEffectEntry({
    required this.effect,
    required this.language,
  });

  final String? effect;
  final Generation? language;

  EffectChangeEffectEntry copyWith({
    String? effect,
    Generation? language,
  }) {
    return EffectChangeEffectEntry(
      effect: effect ?? this.effect,
      language: language ?? this.language,
    );
  }

  factory EffectChangeEffectEntry.fromJson(Map<String, dynamic> json) {
    return EffectChangeEffectEntry(
      effect: json["effect"] == null ? null : json["effect"],
      language: json["language"] == null ? null : Generation.fromJson(json["language"]),
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

class AbilityModelEffectEntry {
  AbilityModelEffectEntry({
    required this.effect,
    required this.shortEffect,
    required this.language,
  });

  final String? effect;
  final String? shortEffect;
  final Generation? language;

  AbilityModelEffectEntry copyWith({
    String? effect,
    String? shortEffect,
    Generation? language,
  }) {
    return AbilityModelEffectEntry(
      effect: effect ?? this.effect,
      shortEffect: shortEffect ?? this.shortEffect,
      language: language ?? this.language,
    );
  }

  factory AbilityModelEffectEntry.fromJson(Map<String, dynamic> json) {
    return AbilityModelEffectEntry(
      effect: json["effect"] == null ? null : json["effect"],
      shortEffect: json["short_effect"] == null ? null : json["short_effect"],
      language: json["language"] == null ? null : Generation.fromJson(json["language"]),
    );
  }
}

class FlavorTextEntry {
  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.versionGroup,
  });

  final String? flavorText;
  final Generation? language;
  final Generation? versionGroup;

  FlavorTextEntry copyWith({
    String? flavorText,
    Generation? language,
    Generation? versionGroup,
  }) {
    return FlavorTextEntry(
      flavorText: flavorText ?? this.flavorText,
      language: language ?? this.language,
      versionGroup: versionGroup ?? this.versionGroup,
    );
  }

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) {
    return FlavorTextEntry(
      flavorText: json["flavor_text"] == null ? null : json["flavor_text"],
      language: json["language"] == null ? null : Generation.fromJson(json["language"]),
      versionGroup:
          json["version_group"] == null ? null : Generation.fromJson(json["version_group"]),
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

class Pokemon {
  Pokemon({
    required this.isHidden,
    required this.slot,
    required this.pokemon,
  });

  final bool? isHidden;
  final int? slot;
  final Generation? pokemon;

  Pokemon copyWith({
    bool? isHidden,
    int? slot,
    Generation? pokemon,
  }) {
    return Pokemon(
      isHidden: isHidden ?? this.isHidden,
      slot: slot ?? this.slot,
      pokemon: pokemon ?? this.pokemon,
    );
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      isHidden: json["is_hidden"] == null ? null : json["is_hidden"],
      slot: json["slot"] == null ? null : json["slot"],
      pokemon: json["pokemon"] == null ? null : Generation.fromJson(json["pokemon"]),
    );
  }
}
