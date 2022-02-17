// To parse this JSON data, do
//
//     final moveModel = moveModelFromJson(jsonString);

import 'dart:convert';

MoveModel moveModelFromJson(String str) => MoveModel.fromJson(json.decode(str));

String moveModelToJson(MoveModel data) => json.encode(data.toJson());

class MoveModel {
  MoveModel({
    this.accuracy,
    this.contestCombos,
    this.contestEffect,
    this.contestType,
    this.damageClass,
    this.effectChance,
    this.effectChanges,
    this.effectEntries,
    this.flavorTextEntries,
    this.generation,
    this.id,
    this.learnedByPokemon,
    this.machines,
    this.meta,
    this.name,
    this.names,
    this.pastValues,
    this.power,
    this.pp,
    this.priority,
    this.statChanges,
    this.superContestEffect,
    this.target,
    this.type,
  });

  int? accuracy;
  ContestCombos? contestCombos;
  ContestEffect? contestEffect;
  ContestType? contestType;
  ContestType? damageClass;
  dynamic effectChance;
  List<dynamic>? effectChanges;
  List<EffectEntry>? effectEntries;
  List<FlavorTextEntry>? flavorTextEntries;
  ContestType? generation;
  int? id;
  List<ContestType>? learnedByPokemon;
  List<dynamic>? machines;
  Meta? meta;
  String? name;
  List<Name>? names;
  List<dynamic>? pastValues;
  int? power;
  int? pp;
  int? priority;
  List<dynamic>? statChanges;
  ContestEffect? superContestEffect;
  ContestType? target;
  ContestType? type;

  factory MoveModel.fromJson(Map<String, dynamic> json) => MoveModel(
        accuracy: json["accuracy"],
        contestCombos: ContestCombos.fromJson(json["contest_combos"]),
        contestEffect: ContestEffect.fromJson(json["contest_effect"]),
        contestType: ContestType.fromJson(json["contest_type"]),
        damageClass: ContestType.fromJson(json["damage_class"]),
        effectChance: json["effect_chance"],
        effectChanges: List<dynamic>.from(json["effect_changes"].map((x) => x)),
        effectEntries: List<EffectEntry>.from(
            json["effect_entries"].map((x) => EffectEntry.fromJson(x))),
        flavorTextEntries: List<FlavorTextEntry>.from(
            json["flavor_text_entries"]
                .map((x) => FlavorTextEntry.fromJson(x))),
        generation: ContestType.fromJson(json["generation"]),
        id: json["id"],
        learnedByPokemon: List<ContestType>.from(
            json["learned_by_pokemon"].map((x) => ContestType.fromJson(x))),
        machines: List<dynamic>.from(json["machines"].map((x) => x)),
        meta: Meta.fromJson(json["meta"]),
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        pastValues: List<dynamic>.from(json["past_values"].map((x) => x)),
        power: json["power"],
        pp: json["pp"],
        priority: json["priority"],
        statChanges: List<dynamic>.from(json["stat_changes"].map((x) => x)),
        superContestEffect:
            ContestEffect.fromJson(json["super_contest_effect"]),
        target: ContestType.fromJson(json["target"]),
        type: ContestType.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "accuracy": accuracy,
        "contest_combos": contestCombos?.toJson(),
        "contest_effect": contestEffect?.toJson(),
        "contest_type": contestType?.toJson(),
        "damage_class": damageClass?.toJson(),
        "effect_chance": effectChance,
        "effect_changes": List<dynamic>.from(effectChanges!.map((x) => x)),
        "effect_entries":
            List<dynamic>.from(effectEntries!.map((x) => x.toJson())),
        "flavor_text_entries":
            List<dynamic>.from(flavorTextEntries!.map((x) => x.toJson())),
        "generation": generation?.toJson(),
        "id": id,
        "learned_by_pokemon":
            List<dynamic>.from(learnedByPokemon!.map((x) => x.toJson())),
        "machines": List<dynamic>.from(machines!.map((x) => x)),
        "meta": meta?.toJson(),
        "name": name,
        "names": List<dynamic>.from(names!.map((x) => x.toJson())),
        "past_values": List<dynamic>.from(pastValues!.map((x) => x)),
        "power": power,
        "pp": pp,
        "priority": priority,
        "stat_changes": List<dynamic>.from(statChanges!.map((x) => x)),
        "super_contest_effect": superContestEffect?.toJson(),
        "target": target?.toJson(),
        "type": type?.toJson(),
      };
}

class ContestCombos {
  ContestCombos({
    this.normal,
    this.contestCombosSuper,
  });

  Normal? normal;
  Normal? contestCombosSuper;

  factory ContestCombos.fromJson(Map<String, dynamic> json) => ContestCombos(
        normal: Normal.fromJson(json["normal"]),
        contestCombosSuper: Normal.fromJson(json["super"]),
      );

  Map<String, dynamic> toJson() => {
        "normal": normal?.toJson(),
        "super": contestCombosSuper?.toJson(),
      };
}

class Normal {
  Normal({
    this.useAfter,
    this.useBefore,
  });

  dynamic useAfter;
  List<ContestType>? useBefore;

  factory Normal.fromJson(Map<String, dynamic> json) => Normal(
        useAfter: json["use_after"],
        useBefore: json["use_before"] == null
            ? null
            : List<ContestType>.from(
                json["use_before"].map((x) => ContestType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "use_after": useAfter,
        "use_before": useBefore == null
            ? null
            : List<dynamic>.from(useBefore!.map((x) => x.toJson())),
      };
}

class ContestType {
  ContestType({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory ContestType.fromJson(Map<String, dynamic> json) => ContestType(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class ContestEffect {
  ContestEffect({
    this.url,
  });

  String? url;

  factory ContestEffect.fromJson(Map<String, dynamic> json) => ContestEffect(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class EffectEntry {
  EffectEntry({
    this.effect,
    this.language,
    this.shortEffect,
  });

  String? effect;
  ContestType? language;
  String? shortEffect;

  factory EffectEntry.fromJson(Map<String, dynamic> json) => EffectEntry(
        effect: json["effect"],
        language: ContestType.fromJson(json["language"]),
        shortEffect: json["short_effect"],
      );

  Map<String, dynamic> toJson() => {
        "effect": effect,
        "language": language?.toJson(),
        "short_effect": shortEffect,
      };
}

class FlavorTextEntry {
  FlavorTextEntry({
    this.flavorText,
    this.language,
    this.versionGroup,
  });

  String? flavorText;
  ContestType? language;
  ContestType? versionGroup;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: ContestType.fromJson(json["language"]),
        versionGroup: ContestType.fromJson(json["version_group"]),
      );

  Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
        "language": language?.toJson(),
        "version_group": versionGroup?.toJson(),
      };
}

class Meta {
  Meta({
    this.ailment,
    this.ailmentChance,
    this.category,
    this.critRate,
    this.drain,
    this.flinchChance,
    this.healing,
    this.maxHits,
    this.maxTurns,
    this.minHits,
    this.minTurns,
    this.statChance,
  });

  ContestType? ailment;
  int? ailmentChance;
  ContestType? category;
  int? critRate;
  int? drain;
  int? flinchChance;
  int? healing;
  dynamic maxHits;
  dynamic maxTurns;
  dynamic minHits;
  dynamic minTurns;
  int? statChance;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        ailment: ContestType.fromJson(json["ailment"]),
        ailmentChance: json["ailment_chance"],
        category: ContestType.fromJson(json["category"]),
        critRate: json["crit_rate"],
        drain: json["drain"],
        flinchChance: json["flinch_chance"],
        healing: json["healing"],
        maxHits: json["max_hits"],
        maxTurns: json["max_turns"],
        minHits: json["min_hits"],
        minTurns: json["min_turns"],
        statChance: json["stat_chance"],
      );

  Map<String, dynamic> toJson() => {
        "ailment": ailment?.toJson(),
        "ailment_chance": ailmentChance,
        "category": category?.toJson(),
        "crit_rate": critRate,
        "drain": drain,
        "flinch_chance": flinchChance,
        "healing": healing,
        "max_hits": maxHits,
        "max_turns": maxTurns,
        "min_hits": minHits,
        "min_turns": minTurns,
        "stat_chance": statChance,
      };
}

class Name {
  Name({
    this.language,
    this.name,
  });

  ContestType? language;
  String? name;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: ContestType.fromJson(json["language"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language": language?.toJson(),
        "name": name,
      };
}
