class EvolutionChainModel {
  EvolutionChainModel({
    required this.babyTriggerItem,
    required this.chain,
    required this.id,
  });

  final dynamic babyTriggerItem;
  final Chain? chain;
  final int id;

  EvolutionChainModel copyWith({
    dynamic? babyTriggerItem,
    Chain? chain,
    int? id,
  }) {
    return EvolutionChainModel(
      babyTriggerItem: babyTriggerItem ?? this.babyTriggerItem,
      chain: chain ?? this.chain,
      id: id ?? this.id,
    );
  }

  factory EvolutionChainModel.fromJson(Map<String, dynamic> json) {
    return EvolutionChainModel(
      babyTriggerItem: json["baby_trigger_item"],
      chain: json["chain"] == null ? null : Chain.fromJson(json["chain"]),
      id: json["id"] == null ? null : json["id"],
    );
  }
}

class Chain {
  Chain({
    required this.evolutionDetails,
    required this.evolvesTo,
    required this.isBaby,
    required this.species,
  });

  final List<EvolutionDetail>? evolutionDetails;
  final List<Chain>? evolvesTo;
  final bool? isBaby;
  final Species? species;

  Chain copyWith({
    List<EvolutionDetail>? evolutionDetails,
    List<Chain>? evolvesTo,
    bool? isBaby,
    Species? species,
  }) {
    return Chain(
      evolutionDetails: evolutionDetails ?? this.evolutionDetails,
      evolvesTo: evolvesTo ?? this.evolvesTo,
      isBaby: isBaby ?? this.isBaby,
      species: species ?? this.species,
    );
  }

  factory Chain.fromJson(Map<String, dynamic> json) {
    return Chain(
      evolutionDetails: json["evolution_details"] == null
          ? null
          : List<EvolutionDetail>.from(
              json["evolution_details"].map((x) => EvolutionDetail.fromJson(x))),
      evolvesTo: json["evolves_to"] == null
          ? null
          : List<Chain>.from(json["evolves_to"].map((x) => Chain.fromJson(x))),
      isBaby: json["is_baby"] == null ? null : json["is_baby"],
      species: json["species"] == null ? null : Species.fromJson(json["species"]),
    );
  }
}

class EvolutionDetail {
  EvolutionDetail({
    required this.gender,
    required this.heldItem,
    required this.item,
    required this.knownMove,
    required this.knownMoveType,
    required this.location,
    required this.minAffection,
    required this.minBeauty,
    required this.minHappiness,
    required this.minLevel,
    required this.needsOverworldRain,
    required this.partySpecies,
    required this.partyType,
    required this.relativePhysicalStats,
    required this.timeOfDay,
    required this.tradeSpecies,
    required this.trigger,
    required this.turnUpsideDown,
  });

  final dynamic gender;
  final dynamic heldItem;
  final Species? item;
  final dynamic knownMove;
  final dynamic knownMoveType;
  final dynamic location;
  final dynamic minAffection;
  final dynamic minBeauty;
  final dynamic minHappiness;
  final dynamic minLevel;
  final bool? needsOverworldRain;
  final dynamic partySpecies;
  final dynamic partyType;
  final dynamic relativePhysicalStats;
  final String? timeOfDay;
  final dynamic tradeSpecies;
  final Species? trigger;
  final bool? turnUpsideDown;

  EvolutionDetail copyWith({
    dynamic? gender,
    dynamic? heldItem,
    Species? item,
    dynamic? knownMove,
    dynamic? knownMoveType,
    dynamic? location,
    dynamic? minAffection,
    dynamic? minBeauty,
    dynamic? minHappiness,
    dynamic? minLevel,
    bool? needsOverworldRain,
    dynamic? partySpecies,
    dynamic? partyType,
    dynamic? relativePhysicalStats,
    String? timeOfDay,
    dynamic? tradeSpecies,
    Species? trigger,
    bool? turnUpsideDown,
  }) {
    return EvolutionDetail(
      gender: gender ?? this.gender,
      heldItem: heldItem ?? this.heldItem,
      item: item ?? this.item,
      knownMove: knownMove ?? this.knownMove,
      knownMoveType: knownMoveType ?? this.knownMoveType,
      location: location ?? this.location,
      minAffection: minAffection ?? this.minAffection,
      minBeauty: minBeauty ?? this.minBeauty,
      minHappiness: minHappiness ?? this.minHappiness,
      minLevel: minLevel ?? this.minLevel,
      needsOverworldRain: needsOverworldRain ?? this.needsOverworldRain,
      partySpecies: partySpecies ?? this.partySpecies,
      partyType: partyType ?? this.partyType,
      relativePhysicalStats: relativePhysicalStats ?? this.relativePhysicalStats,
      timeOfDay: timeOfDay ?? this.timeOfDay,
      tradeSpecies: tradeSpecies ?? this.tradeSpecies,
      trigger: trigger ?? this.trigger,
      turnUpsideDown: turnUpsideDown ?? this.turnUpsideDown,
    );
  }

  factory EvolutionDetail.fromJson(Map<String, dynamic> json) {
    return EvolutionDetail(
      gender: json["gender"],
      heldItem: json["held_item"],
      item: json["item"] == null ? null : Species.fromJson(json["item"]),
      knownMove: json["known_move"],
      knownMoveType: json["known_move_type"],
      location: json["location"],
      minAffection: json["min_affection"],
      minBeauty: json["min_beauty"],
      minHappiness: json["min_happiness"],
      minLevel: json["min_level"],
      needsOverworldRain:
          json["needs_overworld_rain"] == null ? null : json["needs_overworld_rain"],
      partySpecies: json["party_species"],
      partyType: json["party_type"],
      relativePhysicalStats: json["relative_physical_stats"],
      timeOfDay: json["time_of_day"] == null ? null : json["time_of_day"],
      tradeSpecies: json["trade_species"],
      trigger: json["trigger"] == null ? null : Species.fromJson(json["trigger"]),
      turnUpsideDown: json["turn_upside_down"] == null ? null : json["turn_upside_down"],
    );
  }
}

class Species {
  Species({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Species copyWith({
    String? name,
    String? url,
  }) {
    return Species(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory Species.fromJson(Map<String, dynamic> json) {
    return Species(
      name: json["name"] == null ? null : json["name"],
      url: json["url"] == null ? null : json["url"],
    );
  }
}
