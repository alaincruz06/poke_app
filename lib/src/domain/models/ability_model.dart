// To parse this JSON data, do
//
//     final abilityModel = abilityModelFromJson(jsonString);

import 'dart:convert';

AbilityModel abilityModelFromJson(String str) => AbilityModel.fromJson(json.decode(str));

String abilityModelToJson(AbilityModel data) => json.encode(data.toJson());

class AbilityModel {
    AbilityModel({
        this.id,
        this.name,
        this.isMainSeries,
        this.generation,
        this.names,
        this.effectEntries,
        this.effectChanges,
        this.flavorTextEntries,
        this.pokemon,
    });

    int? id;
    String? name;
    bool? isMainSeries;
    Generation? generation;
    List<Name>? names;
    List<AbilityModelEffectEntry>? effectEntries;
    List<EffectChange>? effectChanges;
    List<FlavorTextEntry>? flavorTextEntries;
    List<Pokemon>? pokemon;

    factory AbilityModel.fromJson(Map<String, dynamic> json) => AbilityModel(
        id: json["id"],
        name: json["name"],
        isMainSeries: json["is_main_series"],
        generation: Generation.fromJson(json["generation"]),
        names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        effectEntries: List<AbilityModelEffectEntry>.from(json["effect_entries"].map((x) => AbilityModelEffectEntry.fromJson(x))),
        effectChanges: List<EffectChange>.from(json["effect_changes"].map((x) => EffectChange.fromJson(x))),
        flavorTextEntries: List<FlavorTextEntry>.from(json["flavor_text_entries"].map((x) => FlavorTextEntry.fromJson(x))),
        pokemon: List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_main_series": isMainSeries,
        "generation": generation?.toJson(),
        "names": List<dynamic>.from(names!.map((x) => x.toJson())),
        "effect_entries": List<dynamic>.from(effectEntries!.map((x) => x.toJson())),
        "effect_changes": List<dynamic>.from(effectChanges!.map((x) => x.toJson())),
        "flavor_text_entries": List<dynamic>.from(flavorTextEntries!.map((x) => x.toJson())),
        "pokemon": List<dynamic>.from(pokemon!.map((x) => x.toJson())),
    };
}

class EffectChange {
    EffectChange({
        this.versionGroup,
        this.effectEntries,
    });

    Generation? versionGroup;
    List<EffectChangeEffectEntry>? effectEntries;

    factory EffectChange.fromJson(Map<String, dynamic> json) => EffectChange(
        versionGroup: Generation.fromJson(json["version_group"]),
        effectEntries: List<EffectChangeEffectEntry>.from(json["effect_entries"].map((x) => EffectChangeEffectEntry.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "version_group": versionGroup?.toJson(),
        "effect_entries": List<dynamic>.from(effectEntries!.map((x) => x.toJson())),
    };
}

class EffectChangeEffectEntry {
    EffectChangeEffectEntry({
        this.effect,
        this.language,
    });

    String? effect;
    Generation? language;

    factory EffectChangeEffectEntry.fromJson(Map<String, dynamic> json) => EffectChangeEffectEntry(
        effect: json["effect"],
        language: Generation.fromJson(json["language"]),
    );

    Map<String, dynamic> toJson() => {
        "effect": effect,
        "language": language?.toJson(),
    };
}

class Generation {
    Generation({
        this.name,
        this.url,
    });

    String? name;
    String? url;

    factory Generation.fromJson(Map<String, dynamic> json) => Generation(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

class AbilityModelEffectEntry {
    AbilityModelEffectEntry({
        this.effect,
        this.shortEffect,
        this.language,
    });

    String? effect;
    String? shortEffect;
    Generation? language;

    factory AbilityModelEffectEntry.fromJson(Map<String, dynamic> json) => AbilityModelEffectEntry(
        effect: json["effect"],
        shortEffect: json["short_effect"],
        language: Generation.fromJson(json["language"]),
    );

    Map<String, dynamic> toJson() => {
        "effect": effect,
        "short_effect": shortEffect,
        "language": language?.toJson(),
    };
}

class FlavorTextEntry {
    FlavorTextEntry({
        this.flavorText,
        this.language,
        this.versionGroup,
    });

    String? flavorText;
    Generation? language;
    Generation? versionGroup;

    factory FlavorTextEntry.fromJson(Map<String, dynamic> json) => FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: Generation.fromJson(json["language"]),
        versionGroup: Generation.fromJson(json["version_group"]),
    );

    Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
        "language": language?.toJson(),
        "version_group": versionGroup?.toJson(),
    };
}

class Name {
    Name({
        this.name,
        this.language,
    });

    String? name;
    Generation? language;

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        name: json["name"],
        language: Generation.fromJson(json["language"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "language": language?.toJson(),
    };
}

class Pokemon {
    Pokemon({
        this.isHidden,
        this.slot,
        this.pokemon,
    });

    bool? isHidden;
    int? slot;
    Generation? pokemon;

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        isHidden: json["is_hidden"],
        slot: json["slot"],
        pokemon: Generation.fromJson(json["pokemon"]),
    );

    Map<String, dynamic> toJson() => {
        "is_hidden": isHidden,
        "slot": slot,
        "pokemon": pokemon?.toJson(),
    };
}
