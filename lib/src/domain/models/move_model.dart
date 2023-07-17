// ignore_for_file: prefer_if_null_operators

class MoveModel {
  MoveModel({
    required this.id,
    required this.name,
    required this.accuracy,
    required this.effectChance,
    required this.pp,
    required this.priority,
    required this.power,
    required this.contestCombos,
    required this.contestType,
    required this.contestEffect,
    required this.damageClass,
    required this.effectEntries,
    required this.effectChanges,
    required this.generation,
    required this.meta,
    required this.names,
    required this.pastValues,
    required this.statChanges,
    required this.superContestEffect,
    required this.target,
    required this.type,
    required this.learnedByPokemon,
    required this.flavorTextEntries,
  });

  final int id;
  final String? name;
  final dynamic? accuracy;
  final dynamic effectChance;
  final int? pp;
  final int? priority;
  final int? power;
  final ContestCombos? contestCombos;
  final ContestType? contestType;
  final ContestEffect? contestEffect;
  final ContestType? damageClass;
  final List<EffectEntry>? effectEntries;
  final List<dynamic>? effectChanges;
  final ContestType? generation;
  final Meta? meta;
  final List<Name>? names;
  final List<dynamic>? pastValues;
  final List<dynamic>? statChanges;
  final ContestEffect? superContestEffect;
  final ContestType? target;
  final ContestType? type;
  final List<ContestType>? learnedByPokemon;
  final List<FlavorTextEntry>? flavorTextEntries;

  MoveModel copyWith({
    int? id,
    String? name,
    dynamic accuracy,
    dynamic effectChance,
    int? pp,
    int? priority,
    int? power,
    ContestCombos? contestCombos,
    ContestType? contestType,
    ContestEffect? contestEffect,
    ContestType? damageClass,
    List<EffectEntry>? effectEntries,
    List<dynamic>? effectChanges,
    ContestType? generation,
    Meta? meta,
    List<Name>? names,
    List<dynamic>? pastValues,
    List<dynamic>? statChanges,
    ContestEffect? superContestEffect,
    ContestType? target,
    ContestType? type,
    List<ContestType>? learnedByPokemon,
    List<FlavorTextEntry>? flavorTextEntries,
  }) {
    return MoveModel(
      id: id ?? this.id,
      name: name ?? this.name,
      accuracy: accuracy ?? "-",
      effectChance: effectChance ?? this.effectChance,
      pp: pp ?? this.pp,
      priority: priority ?? this.priority,
      power: power ?? this.power,
      contestCombos: contestCombos ?? this.contestCombos,
      contestType: contestType ?? this.contestType,
      contestEffect: contestEffect ?? this.contestEffect,
      damageClass: damageClass ?? this.damageClass,
      effectEntries: effectEntries ?? this.effectEntries,
      effectChanges: effectChanges ?? this.effectChanges,
      generation: generation ?? this.generation,
      meta: meta ?? this.meta,
      names: names ?? this.names,
      pastValues: pastValues ?? this.pastValues,
      statChanges: statChanges ?? this.statChanges,
      superContestEffect: superContestEffect ?? this.superContestEffect,
      target: target ?? this.target,
      type: type ?? this.type,
      learnedByPokemon: learnedByPokemon ?? this.learnedByPokemon,
      flavorTextEntries: flavorTextEntries ?? this.flavorTextEntries,
    );
  }

  factory MoveModel.fromJson(Map<String, dynamic> json) {
    return MoveModel(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      accuracy: json["accuracy"] == null ? null : json["accuracy"],
      effectChance: json["effect_chance"] == null ? null : json["effect_chance"],
      pp: json["pp"] == null ? null : json["pp"],
      priority: json["priority"] == null ? null : json["priority"],
      power: json["power"] == null ? null : json["power"],
      contestCombos:
          json["contest_combos"] == null ? null : ContestCombos.fromJson(json["contest_combos"]),
      contestType: json["contest_type"] == null ? null : ContestType.fromJson(json["contest_type"]),
      contestEffect:
          json["contest_effect"] == null ? null : ContestEffect.fromJson(json["contest_effect"]),
      damageClass: json["damage_class"] == null ? null : ContestType.fromJson(json["damage_class"]),
      effectEntries: json["effect_entries"] == null
          ? null
          : List<EffectEntry>.from(json["effect_entries"].map((x) => EffectEntry.fromJson(x))),
      effectChanges: json["effect_changes"] == null
          ? null
          : List<dynamic>.from(json["effect_changes"].map((x) => x)),
      generation: json["generation"] == null ? null : ContestType.fromJson(json["generation"]),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      names: json["names"] == null
          ? null
          : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
      pastValues: json["past_values"] == null
          ? null
          : List<dynamic>.from(json["past_values"].map((x) => x)),
      statChanges: json["stat_changes"] == null
          ? null
          : List<dynamic>.from(json["stat_changes"].map((x) => x)),
      superContestEffect: json["super_contest_effect"] == null
          ? null
          : ContestEffect.fromJson(json["super_contest_effect"]),
      target: json["target"] == null ? null : ContestType.fromJson(json["target"]),
      type: json["type"] == null ? null : ContestType.fromJson(json["type"]),
      learnedByPokemon: json["learned_by_pokemon"] == null
          ? null
          : List<ContestType>.from(json["learned_by_pokemon"].map((x) => ContestType.fromJson(x))),
      flavorTextEntries: json["flavor_text_entries"] == null
          ? null
          : List<FlavorTextEntry>.from(
              json["flavor_text_entries"].map((x) => FlavorTextEntry.fromJson(x))),
    );
  }
}

class ContestCombos {
  ContestCombos({
    required this.normal,
    required this.contestCombosSuper,
  });

  final Normal? normal;
  final Normal? contestCombosSuper;

  ContestCombos copyWith({
    Normal? normal,
    Normal? contestCombosSuper,
  }) {
    return ContestCombos(
      normal: normal ?? this.normal,
      contestCombosSuper: contestCombosSuper ?? this.contestCombosSuper,
    );
  }

  factory ContestCombos.fromJson(Map<String, dynamic> json) {
    return ContestCombos(
      normal: json["normal"] == null ? null : Normal.fromJson(json["normal"]),
      contestCombosSuper: json["super"] == null ? null : Normal.fromJson(json["super"]),
    );
  }
}

class Normal {
  Normal({
    required this.useBefore,
    required this.useAfter,
  });

  final List<ContestType>? useBefore;
  final dynamic useAfter;

  Normal copyWith({
    List<ContestType>? useBefore,
    dynamic? useAfter,
  }) {
    return Normal(
      useBefore: useBefore ?? this.useBefore,
      useAfter: useAfter ?? this.useAfter,
    );
  }

  factory Normal.fromJson(Map<String, dynamic> json) {
    return Normal(
      useBefore: json["use_before"] == null
          ? null
          : List<ContestType>.from(json["use_before"].map((x) => ContestType.fromJson(x))),
      useAfter: json["use_after"],
    );
  }
}

class ContestType {
  ContestType({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  ContestType copyWith({
    String? name,
    String? url,
  }) {
    return ContestType(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory ContestType.fromJson(Map<String, dynamic> json) {
    return ContestType(
      name: json["name"] == null ? null : json["name"],
      url: json["url"] == null ? null : json["url"],
    );
  }
}

class ContestEffect {
  ContestEffect({
    required this.url,
  });

  final String? url;

  ContestEffect copyWith({
    String? url,
  }) {
    return ContestEffect(
      url: url ?? this.url,
    );
  }

  factory ContestEffect.fromJson(Map<String, dynamic> json) {
    return ContestEffect(
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
  final ContestType? language;

  EffectEntry copyWith({
    String? effect,
    String? shortEffect,
    ContestType? language,
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
      language: json["language"] == null ? null : ContestType.fromJson(json["language"]),
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
  final ContestType? language;
  final ContestType? versionGroup;

  FlavorTextEntry copyWith({
    String? flavorText,
    ContestType? language,
    ContestType? versionGroup,
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
      language: json["language"] == null ? null : ContestType.fromJson(json["language"]),
      versionGroup:
          json["version_group"] == null ? null : ContestType.fromJson(json["version_group"]),
    );
  }
}

class Meta {
  Meta({
    required this.ailment,
    required this.category,
    required this.minHits,
    required this.maxHits,
    required this.minTurns,
    required this.maxTurns,
    required this.drain,
    required this.healing,
    required this.critRate,
    required this.ailmentChance,
    required this.flinchChance,
    required this.statChance,
  });

  final ContestType? ailment;
  final ContestType? category;
  final dynamic minHits;
  final dynamic maxHits;
  final dynamic minTurns;
  final dynamic maxTurns;
  final int? drain;
  final int? healing;
  final int? critRate;
  final int? ailmentChance;
  final int? flinchChance;
  final int? statChance;

  Meta copyWith({
    ContestType? ailment,
    ContestType? category,
    dynamic? minHits,
    dynamic? maxHits,
    dynamic? minTurns,
    dynamic? maxTurns,
    int? drain,
    int? healing,
    int? critRate,
    int? ailmentChance,
    int? flinchChance,
    int? statChance,
  }) {
    return Meta(
      ailment: ailment ?? this.ailment,
      category: category ?? this.category,
      minHits: minHits ?? this.minHits,
      maxHits: maxHits ?? this.maxHits,
      minTurns: minTurns ?? this.minTurns,
      maxTurns: maxTurns ?? this.maxTurns,
      drain: drain ?? this.drain,
      healing: healing ?? this.healing,
      critRate: critRate ?? this.critRate,
      ailmentChance: ailmentChance ?? this.ailmentChance,
      flinchChance: flinchChance ?? this.flinchChance,
      statChance: statChance ?? this.statChance,
    );
  }

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      ailment: json["ailment"] == null ? null : ContestType.fromJson(json["ailment"]),
      category: json["category"] == null ? null : ContestType.fromJson(json["category"]),
      minHits: json["min_hits"],
      maxHits: json["max_hits"],
      minTurns: json["min_turns"],
      maxTurns: json["max_turns"],
      drain: json["drain"] == null ? null : json["drain"],
      healing: json["healing"] == null ? null : json["healing"],
      critRate: json["crit_rate"] == null ? null : json["crit_rate"],
      ailmentChance: json["ailment_chance"] == null ? null : json["ailment_chance"],
      flinchChance: json["flinch_chance"] == null ? null : json["flinch_chance"],
      statChance: json["stat_chance"] == null ? null : json["stat_chance"],
    );
  }
}

class Name {
  Name({
    required this.name,
    required this.language,
  });

  final String? name;
  final ContestType? language;

  Name copyWith({
    String? name,
    ContestType? language,
  }) {
    return Name(
      name: name ?? this.name,
      language: language ?? this.language,
    );
  }

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      name: json["name"] == null ? null : json["name"],
      language: json["language"] == null ? null : ContestType.fromJson(json["language"]),
    );
  }
}
