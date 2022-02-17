// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  ItemModel({
    this.id,
    this.name,
    this.cost,
    this.flingPower,
    this.flingEffect,
    this.attributes,
    this.category,
    this.effectEntries,
    this.flavorTextEntries,
    this.gameIndices,
    this.names,
    this.sprites,
    this.heldByPokemon,
    this.babyTriggerFor,
  });

  int? id;
  String? name;
  int? cost;
  int? flingPower;
  Category? flingEffect;
  List<Category>? attributes;
  Category? category;
  List<EffectEntry>? effectEntries;
  List<FlavorTextEntry>? flavorTextEntries;
  List<GameIndex>? gameIndices;
  List<Name>? names;
  Sprites? sprites;
  List<HeldByPokemon>? heldByPokemon;
  BabyTriggerFor? babyTriggerFor;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"],
        name: json["name"],
        cost: json["cost"],
        flingPower: json["fling_power"],
        flingEffect: Category.fromJson(json["fling_effect"]),
        attributes: List<Category>.from(
            json["attributes"].map((x) => Category.fromJson(x))),
        category: Category.fromJson(json["category"]),
        effectEntries: List<EffectEntry>.from(
            json["effect_entries"].map((x) => EffectEntry.fromJson(x))),
        flavorTextEntries: List<FlavorTextEntry>.from(
            json["flavor_text_entries"]
                .map((x) => FlavorTextEntry.fromJson(x))),
        gameIndices: List<GameIndex>.from(
            json["game_indices"].map((x) => GameIndex.fromJson(x))),
        names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        sprites: Sprites.fromJson(json["sprites"]),
        heldByPokemon: List<HeldByPokemon>.from(
            json["held_by_pokemon"].map((x) => HeldByPokemon.fromJson(x))),
        babyTriggerFor: BabyTriggerFor.fromJson(json["baby_trigger_for"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cost": cost,
        "fling_power": flingPower,
        "fling_effect": flingEffect?.toJson(),
        "attributes": List<dynamic>.from(attributes!.map((x) => x.toJson())),
        "category": category?.toJson(),
        "effect_entries":
            List<dynamic>.from(effectEntries!.map((x) => x.toJson())),
        "flavor_text_entries":
            List<dynamic>.from(flavorTextEntries!.map((x) => x.toJson())),
        "game_indices": List<dynamic>.from(gameIndices!.map((x) => x.toJson())),
        "names": List<dynamic>.from(names!.map((x) => x.toJson())),
        "sprites": sprites?.toJson(),
        "held_by_pokemon":
            List<dynamic>.from(heldByPokemon!.map((x) => x.toJson())),
        "baby_trigger_for": babyTriggerFor?.toJson(),
      };
}

class Category {
  Category({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"] as String? ?? "",
        url: json["url"] as String? ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class BabyTriggerFor {
  BabyTriggerFor({
    this.url,
  });

  String? url;

  factory BabyTriggerFor.fromJson(Map<String, dynamic> json) => BabyTriggerFor(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class EffectEntry {
  EffectEntry({
    this.effect,
    this.shortEffect,
    this.language,
  });

  String? effect;
  String? shortEffect;
  Category? language;

  factory EffectEntry.fromJson(Map<String, dynamic> json) => EffectEntry(
        effect: json["effect"],
        shortEffect: json["short_effect"],
        language: Category.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "effect": effect,
        "short_effect": shortEffect,
        "language": language?.toJson(),
      };
}

class FlavorTextEntry {
  FlavorTextEntry({
    this.text,
    this.versionGroup,
    this.language,
  });

  String? text;
  Category? versionGroup;
  Category? language;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        text: json["text"],
        versionGroup: Category.fromJson(json["version_group"]),
        language: Category.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "version_group": versionGroup?.toJson(),
        "language": language?.toJson(),
      };
}

class GameIndex {
  GameIndex({
    this.gameIndex,
    this.generation,
  });

  int? gameIndex;
  Category? generation;

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        generation: Category.fromJson(json["generation"]),
      );

  Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "generation": generation?.toJson(),
      };
}

class HeldByPokemon {
  HeldByPokemon({
    this.pokemon,
    this.versionDetails,
  });

  Category? pokemon;
  List<VersionDetail>? versionDetails;

  factory HeldByPokemon.fromJson(Map<String, dynamic> json) => HeldByPokemon(
        pokemon: Category.fromJson(json["pokemon"]),
        versionDetails: List<VersionDetail>.from(
            json["version_details"].map((x) => VersionDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pokemon": pokemon?.toJson(),
        "version_details":
            List<dynamic>.from(versionDetails!.map((x) => x.toJson())),
      };
}

class VersionDetail {
  VersionDetail({
    this.rarity,
    this.version,
  });

  int? rarity;
  Category? version;

  factory VersionDetail.fromJson(Map<String, dynamic> json) => VersionDetail(
        rarity: json["rarity"],
        version: Category.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "rarity": rarity,
        "version": version?.toJson(),
      };
}

class Name {
  Name({
    this.name,
    this.language,
  });

  String? name;
  Category? language;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        name: json["name"],
        language: Category.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "language": language?.toJson(),
      };
}

class Sprites {
  Sprites({
    this.spritesDefault,
  });

  String? spritesDefault;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        spritesDefault: json["default"],
      );

  Map<String, dynamic> toJson() => {
        "default": spritesDefault,
      };
}
