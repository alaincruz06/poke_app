class PokemonModel {
  PokemonModel({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.abilities,
    required this.forms,
    required this.gameIndices,
    required this.heldItems,
    required this.locationAreaEncounters,
    required this.moves,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.pastTypes,
  });

  final int id;
  final String? name;
  final int? baseExperience;
  final int? height;
  final bool? isDefault;
  final int? order;
  final int? weight;
  final List<Ability>? abilities;
  final List<Species>? forms;
  final List<GameIndex>? gameIndices;
  final List<HeldItem>? heldItems;
  final String? locationAreaEncounters;
  final List<Move>? moves;
  final Species? species;
  final Sprites? sprites;
  final List<Stat>? stats;
  final List<Type>? types;
  final List<PastType>? pastTypes;

  PokemonModel copyWith({
    int? id,
    String? name,
    int? baseExperience,
    int? height,
    bool? isDefault,
    int? order,
    int? weight,
    List<Ability>? abilities,
    List<Species>? forms,
    List<GameIndex>? gameIndices,
    List<HeldItem>? heldItems,
    String? locationAreaEncounters,
    List<Move>? moves,
    Species? species,
    Sprites? sprites,
    List<Stat>? stats,
    List<Type>? types,
    List<PastType>? pastTypes,
  }) {
    return PokemonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      baseExperience: baseExperience ?? this.baseExperience,
      height: height ?? this.height,
      isDefault: isDefault ?? this.isDefault,
      order: order ?? this.order,
      weight: weight ?? this.weight,
      abilities: abilities ?? this.abilities,
      forms: forms ?? this.forms,
      gameIndices: gameIndices ?? this.gameIndices,
      heldItems: heldItems ?? this.heldItems,
      locationAreaEncounters:
          locationAreaEncounters ?? this.locationAreaEncounters,
      moves: moves ?? this.moves,
      species: species ?? this.species,
      sprites: sprites ?? this.sprites,
      stats: stats ?? this.stats,
      types: types ?? this.types,
      pastTypes: pastTypes ?? this.pastTypes,
    );
  }

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      baseExperience:
          json["base_experience"] == null ? null : json["base_experience"],
      height: json["height"] == null ? null : json["height"],
      isDefault: json["is_default"] == null ? null : json["is_default"],
      order: json["order"] == null ? null : json["order"],
      weight: json["weight"] == null ? null : json["weight"],
      abilities: json["abilities"] == null
          ? null
          : List<Ability>.from(
              json["abilities"].map((x) => Ability.fromJson(x))),
      forms: json["forms"] == null
          ? null
          : List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
      gameIndices: json["game_indices"] == null
          ? null
          : List<GameIndex>.from(
              json["game_indices"].map((x) => GameIndex.fromJson(x))),
      heldItems: json["held_items"] == null
          ? null
          : List<HeldItem>.from(
              json["held_items"].map((x) => HeldItem.fromJson(x))),
      locationAreaEncounters: json["location_area_encounters"] == null
          ? null
          : json["location_area_encounters"],
      moves: json["moves"] == null
          ? null
          : List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
      species:
          json["species"] == null ? null : Species.fromJson(json["species"]),
      sprites:
          json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
      stats: json["stats"] == null
          ? null
          : List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
      types: json["types"] == null
          ? null
          : List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
      pastTypes: json["past_types"] == null
          ? null
          : List<PastType>.from(
              json["past_types"].map((x) => PastType.fromJson(x))),
    );
  }
}

class Ability {
  Ability({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  final bool? isHidden;
  final int? slot;
  final Species? ability;

  Ability copyWith({
    bool? isHidden,
    int? slot,
    Species? ability,
  }) {
    return Ability(
      isHidden: isHidden ?? this.isHidden,
      slot: slot ?? this.slot,
      ability: ability ?? this.ability,
    );
  }

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      isHidden: json["is_hidden"] == null ? null : json["is_hidden"],
      slot: json["slot"] == null ? null : json["slot"],
      ability:
          json["ability"] == null ? null : Species.fromJson(json["ability"]),
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

class GameIndex {
  GameIndex({
    required this.gameIndex,
    required this.version,
  });

  final int? gameIndex;
  final Species? version;

  GameIndex copyWith({
    int? gameIndex,
    Species? version,
  }) {
    return GameIndex(
      gameIndex: gameIndex ?? this.gameIndex,
      version: version ?? this.version,
    );
  }

  factory GameIndex.fromJson(Map<String, dynamic> json) {
    return GameIndex(
      gameIndex: json["game_index"] == null ? null : json["game_index"],
      version:
          json["version"] == null ? null : Species.fromJson(json["version"]),
    );
  }
}

class HeldItem {
  HeldItem({
    required this.item,
    required this.versionDetails,
  });

  final Species? item;
  final List<VersionDetail>? versionDetails;

  HeldItem copyWith({
    Species? item,
    List<VersionDetail>? versionDetails,
  }) {
    return HeldItem(
      item: item ?? this.item,
      versionDetails: versionDetails ?? this.versionDetails,
    );
  }

  factory HeldItem.fromJson(Map<String, dynamic> json) {
    return HeldItem(
      item: json["item"] == null ? null : Species.fromJson(json["item"]),
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
  final Species? version;

  VersionDetail copyWith({
    int? rarity,
    Species? version,
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
          json["version"] == null ? null : Species.fromJson(json["version"]),
    );
  }
}

class Move {
  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  final Species? move;
  final List<VersionGroupDetail>? versionGroupDetails;

  Move copyWith({
    Species? move,
    List<VersionGroupDetail>? versionGroupDetails,
  }) {
    return Move(
      move: move ?? this.move,
      versionGroupDetails: versionGroupDetails ?? this.versionGroupDetails,
    );
  }

  factory Move.fromJson(Map<String, dynamic> json) {
    return Move(
      move: json["move"] == null ? null : Species.fromJson(json["move"]),
      versionGroupDetails: json["version_group_details"] == null
          ? null
          : List<VersionGroupDetail>.from(json["version_group_details"]
              .map((x) => VersionGroupDetail.fromJson(x))),
    );
  }
}

class VersionGroupDetail {
  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.versionGroup,
    required this.moveLearnMethod,
  });

  final int? levelLearnedAt;
  final Species? versionGroup;
  final Species? moveLearnMethod;

  VersionGroupDetail copyWith({
    int? levelLearnedAt,
    Species? versionGroup,
    Species? moveLearnMethod,
  }) {
    return VersionGroupDetail(
      levelLearnedAt: levelLearnedAt ?? this.levelLearnedAt,
      versionGroup: versionGroup ?? this.versionGroup,
      moveLearnMethod: moveLearnMethod ?? this.moveLearnMethod,
    );
  }

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) {
    return VersionGroupDetail(
      levelLearnedAt:
          json["level_learned_at"] == null ? null : json["level_learned_at"],
      versionGroup: json["version_group"] == null
          ? null
          : Species.fromJson(json["version_group"]),
      moveLearnMethod: json["move_learn_method"] == null
          ? null
          : Species.fromJson(json["move_learn_method"]),
    );
  }
}

class PastType {
  PastType({
    required this.generation,
    required this.types,
  });

  final Species? generation;
  final List<Type>? types;

  PastType copyWith({
    Species? generation,
    List<Type>? types,
  }) {
    return PastType(
      generation: generation ?? this.generation,
      types: types ?? this.types,
    );
  }

  factory PastType.fromJson(Map<String, dynamic> json) {
    return PastType(
      generation: json["generation"] == null
          ? null
          : Species.fromJson(json["generation"]),
      types: json["types"] == null
          ? null
          : List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
    );
  }
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  final int? slot;
  final Species? type;

  Type copyWith({
    int? slot,
    Species? type,
  }) {
    return Type(
      slot: slot ?? this.slot,
      type: type ?? this.type,
    );
  }

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      slot: json["slot"] == null ? null : json["slot"],
      type: json["type"] == null ? null : Species.fromJson(json["type"]),
    );
  }
}

class GenerationV {
  GenerationV({
    required this.blackWhite,
  });

  final Sprites? blackWhite;

  GenerationV copyWith({
    Sprites? blackWhite,
  }) {
    return GenerationV(
      blackWhite: blackWhite ?? this.blackWhite,
    );
  }

  factory GenerationV.fromJson(Map<String, dynamic> json) {
    return GenerationV(
      blackWhite: json["black-white"] == null
          ? null
          : Sprites.fromJson(json["black-white"]),
    );
  }
}

class GenerationIv {
  GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  final Sprites? diamondPearl;
  final Sprites? heartgoldSoulsilver;
  final Sprites? platinum;

  GenerationIv copyWith({
    Sprites? diamondPearl,
    Sprites? heartgoldSoulsilver,
    Sprites? platinum,
  }) {
    return GenerationIv(
      diamondPearl: diamondPearl ?? this.diamondPearl,
      heartgoldSoulsilver: heartgoldSoulsilver ?? this.heartgoldSoulsilver,
      platinum: platinum ?? this.platinum,
    );
  }

  factory GenerationIv.fromJson(Map<String, dynamic> json) {
    return GenerationIv(
      diamondPearl: json["diamond-pearl"] == null
          ? null
          : Sprites.fromJson(json["diamond-pearl"]),
      heartgoldSoulsilver: json["heartgold-soulsilver"] == null
          ? null
          : Sprites.fromJson(json["heartgold-soulsilver"]),
      platinum:
          json["platinum"] == null ? null : Sprites.fromJson(json["platinum"]),
    );
  }
}

class Versions {
  Versions({
    required this.generationI,
    required this.generationIi,
    required this.generationIii,
    required this.generationIv,
    required this.generationV,
    required this.generationVi,
    required this.generationVii,
    required this.generationViii,
  });

  final GenerationI? generationI;
  final GenerationIi? generationIi;
  final GenerationIii? generationIii;
  final GenerationIv? generationIv;
  final GenerationV? generationV;
  final Map<String, Home>? generationVi;
  final GenerationVii? generationVii;
  final GenerationViii? generationViii;

  Versions copyWith({
    GenerationI? generationI,
    GenerationIi? generationIi,
    GenerationIii? generationIii,
    GenerationIv? generationIv,
    GenerationV? generationV,
    Map<String, Home>? generationVi,
    GenerationVii? generationVii,
    GenerationViii? generationViii,
  }) {
    return Versions(
      generationI: generationI ?? this.generationI,
      generationIi: generationIi ?? this.generationIi,
      generationIii: generationIii ?? this.generationIii,
      generationIv: generationIv ?? this.generationIv,
      generationV: generationV ?? this.generationV,
      generationVi: generationVi ?? this.generationVi,
      generationVii: generationVii ?? this.generationVii,
      generationViii: generationViii ?? this.generationViii,
    );
  }

  factory Versions.fromJson(Map<String, dynamic> json) {
    return Versions(
      generationI: json["generation-i"] == null
          ? null
          : GenerationI.fromJson(json["generation-i"]),
      generationIi: json["generation-ii"] == null
          ? null
          : GenerationIi.fromJson(json["generation-ii"]),
      generationIii: json["generation-iii"] == null
          ? null
          : GenerationIii.fromJson(json["generation-iii"]),
      generationIv: json["generation-iv"] == null
          ? null
          : GenerationIv.fromJson(json["generation-iv"]),
      generationV: json["generation-v"] == null
          ? null
          : GenerationV.fromJson(json["generation-v"]),
      generationVi: json["generation-vi"] == null
          ? null
          : Map.from(json["generation-vi"])
              .map((k, v) => MapEntry<String, Home>(k, Home.fromJson(v))),
      generationVii: json["generation-vii"] == null
          ? null
          : GenerationVii.fromJson(json["generation-vii"]),
      generationViii: json["generation-viii"] == null
          ? null
          : GenerationViii.fromJson(json["generation-viii"]),
    );
  }
}

class Sprites {
  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    required this.other,
    required this.versions,
    required this.animated,
  });

  final String? backDefault;
  final dynamic backFemale;
  final String? backShiny;
  final dynamic backShinyFemale;
  final String? frontDefault;
  final dynamic frontFemale;
  final String? frontShiny;
  final dynamic frontShinyFemale;
  final Other? other;
  final Versions? versions;
  final Sprites? animated;

  Sprites copyWith({
    String? backDefault,
    dynamic? backFemale,
    String? backShiny,
    dynamic? backShinyFemale,
    String? frontDefault,
    dynamic? frontFemale,
    String? frontShiny,
    dynamic? frontShinyFemale,
    Other? other,
    Versions? versions,
    Sprites? animated,
  }) {
    return Sprites(
      backDefault: backDefault ?? this.backDefault,
      backFemale: backFemale ?? this.backFemale,
      backShiny: backShiny ?? this.backShiny,
      backShinyFemale: backShinyFemale ?? this.backShinyFemale,
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
      frontShiny: frontShiny ?? this.frontShiny,
      frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
      other: other ?? this.other,
      versions: versions ?? this.versions,
      animated: animated ?? this.animated,
    );
  }

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      backDefault: json["back_default"] == null ? null : json["back_default"],
      backFemale: json["back_female"],
      backShiny: json["back_shiny"] == null ? null : json["back_shiny"],
      backShinyFemale: json["back_shiny_female"],
      frontDefault:
          json["front_default"] == null ? null : json["front_default"],
      frontFemale: json["front_female"],
      frontShiny: json["front_shiny"] == null ? null : json["front_shiny"],
      frontShinyFemale: json["front_shiny_female"],
      other: json["other"] == null ? null : Other.fromJson(json["other"]),
      versions:
          json["versions"] == null ? null : Versions.fromJson(json["versions"]),
      animated:
          json["animated"] == null ? null : Sprites.fromJson(json["animated"]),
    );
  }
}

class GenerationI {
  GenerationI({
    required this.redBlue,
    required this.yellow,
  });

  final RedBlue? redBlue;
  final RedBlue? yellow;

  GenerationI copyWith({
    RedBlue? redBlue,
    RedBlue? yellow,
  }) {
    return GenerationI(
      redBlue: redBlue ?? this.redBlue,
      yellow: yellow ?? this.yellow,
    );
  }

  factory GenerationI.fromJson(Map<String, dynamic> json) {
    return GenerationI(
      redBlue:
          json["red-blue"] == null ? null : RedBlue.fromJson(json["red-blue"]),
      yellow: json["yellow"] == null ? null : RedBlue.fromJson(json["yellow"]),
    );
  }
}

class RedBlue {
  RedBlue({
    required this.backDefault,
    required this.backGray,
    required this.frontDefault,
    required this.frontGray,
  });

  final String? backDefault;
  final String? backGray;
  final String? frontDefault;
  final String? frontGray;

  RedBlue copyWith({
    String? backDefault,
    String? backGray,
    String? frontDefault,
    String? frontGray,
  }) {
    return RedBlue(
      backDefault: backDefault ?? this.backDefault,
      backGray: backGray ?? this.backGray,
      frontDefault: frontDefault ?? this.frontDefault,
      frontGray: frontGray ?? this.frontGray,
    );
  }

  factory RedBlue.fromJson(Map<String, dynamic> json) {
    return RedBlue(
      backDefault: json["back_default"] == null ? null : json["back_default"],
      backGray: json["back_gray"] == null ? null : json["back_gray"],
      frontDefault:
          json["front_default"] == null ? null : json["front_default"],
      frontGray: json["front_gray"] == null ? null : json["front_gray"],
    );
  }
}

class GenerationIi {
  GenerationIi({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  final Crystal? crystal;
  final Crystal? gold;
  final Crystal? silver;

  GenerationIi copyWith({
    Crystal? crystal,
    Crystal? gold,
    Crystal? silver,
  }) {
    return GenerationIi(
      crystal: crystal ?? this.crystal,
      gold: gold ?? this.gold,
      silver: silver ?? this.silver,
    );
  }

  factory GenerationIi.fromJson(Map<String, dynamic> json) {
    return GenerationIi(
      crystal:
          json["crystal"] == null ? null : Crystal.fromJson(json["crystal"]),
      gold: json["gold"] == null ? null : Crystal.fromJson(json["gold"]),
      silver: json["silver"] == null ? null : Crystal.fromJson(json["silver"]),
    );
  }
}

class Crystal {
  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
  });

  final String? backDefault;
  final String? backShiny;
  final String? frontDefault;
  final String? frontShiny;

  Crystal copyWith({
    String? backDefault,
    String? backShiny,
    String? frontDefault,
    String? frontShiny,
  }) {
    return Crystal(
      backDefault: backDefault ?? this.backDefault,
      backShiny: backShiny ?? this.backShiny,
      frontDefault: frontDefault ?? this.frontDefault,
      frontShiny: frontShiny ?? this.frontShiny,
    );
  }

  factory Crystal.fromJson(Map<String, dynamic> json) {
    return Crystal(
      backDefault: json["back_default"] == null ? null : json["back_default"],
      backShiny: json["back_shiny"] == null ? null : json["back_shiny"],
      frontDefault:
          json["front_default"] == null ? null : json["front_default"],
      frontShiny: json["front_shiny"] == null ? null : json["front_shiny"],
    );
  }
}

class GenerationIii {
  GenerationIii({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  final Emerald? emerald;
  final Crystal? fireredLeafgreen;
  final Crystal? rubySapphire;

  GenerationIii copyWith({
    Emerald? emerald,
    Crystal? fireredLeafgreen,
    Crystal? rubySapphire,
  }) {
    return GenerationIii(
      emerald: emerald ?? this.emerald,
      fireredLeafgreen: fireredLeafgreen ?? this.fireredLeafgreen,
      rubySapphire: rubySapphire ?? this.rubySapphire,
    );
  }

  factory GenerationIii.fromJson(Map<String, dynamic> json) {
    return GenerationIii(
      emerald:
          json["emerald"] == null ? null : Emerald.fromJson(json["emerald"]),
      fireredLeafgreen: json["firered-leafgreen"] == null
          ? null
          : Crystal.fromJson(json["firered-leafgreen"]),
      rubySapphire: json["ruby-sapphire"] == null
          ? null
          : Crystal.fromJson(json["ruby-sapphire"]),
    );
  }
}

class Emerald {
  Emerald({
    required this.frontDefault,
    required this.frontShiny,
  });

  final String? frontDefault;
  final String? frontShiny;

  Emerald copyWith({
    String? frontDefault,
    String? frontShiny,
  }) {
    return Emerald(
      frontDefault: frontDefault ?? this.frontDefault,
      frontShiny: frontShiny ?? this.frontShiny,
    );
  }

  factory Emerald.fromJson(Map<String, dynamic> json) {
    return Emerald(
      frontDefault:
          json["front_default"] == null ? null : json["front_default"],
      frontShiny: json["front_shiny"] == null ? null : json["front_shiny"],
    );
  }
}

class Home {
  Home({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  final String? frontDefault;
  final dynamic frontFemale;
  final String? frontShiny;
  final dynamic frontShinyFemale;

  Home copyWith({
    String? frontDefault,
    dynamic? frontFemale,
    String? frontShiny,
    dynamic? frontShinyFemale,
  }) {
    return Home(
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
      frontShiny: frontShiny ?? this.frontShiny,
      frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
    );
  }

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      frontDefault:
          json["front_default"] == null ? null : json["front_default"],
      frontFemale: json["front_female"],
      frontShiny: json["front_shiny"] == null ? null : json["front_shiny"],
      frontShinyFemale: json["front_shiny_female"],
    );
  }
}

class GenerationVii {
  GenerationVii({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  final DreamWorld? icons;
  final Home? ultraSunUltraMoon;

  GenerationVii copyWith({
    DreamWorld? icons,
    Home? ultraSunUltraMoon,
  }) {
    return GenerationVii(
      icons: icons ?? this.icons,
      ultraSunUltraMoon: ultraSunUltraMoon ?? this.ultraSunUltraMoon,
    );
  }

  factory GenerationVii.fromJson(Map<String, dynamic> json) {
    return GenerationVii(
      icons: json["icons"] == null ? null : DreamWorld.fromJson(json["icons"]),
      ultraSunUltraMoon: json["ultra-sun-ultra-moon"] == null
          ? null
          : Home.fromJson(json["ultra-sun-ultra-moon"]),
    );
  }
}

class DreamWorld {
  DreamWorld({
    required this.frontDefault,
    required this.frontFemale,
  });

  final String? frontDefault;
  final dynamic frontFemale;

  DreamWorld copyWith({
    String? frontDefault,
    dynamic? frontFemale,
  }) {
    return DreamWorld(
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
    );
  }

  factory DreamWorld.fromJson(Map<String, dynamic> json) {
    return DreamWorld(
      frontDefault:
          json["front_default"] == null ? null : json["front_default"],
      frontFemale: json["front_female"],
    );
  }
}

class GenerationViii {
  GenerationViii({
    required this.icons,
  });

  final DreamWorld? icons;

  GenerationViii copyWith({
    DreamWorld? icons,
  }) {
    return GenerationViii(
      icons: icons ?? this.icons,
    );
  }

  factory GenerationViii.fromJson(Map<String, dynamic> json) {
    return GenerationViii(
      icons: json["icons"] == null ? null : DreamWorld.fromJson(json["icons"]),
    );
  }
}

class Other {
  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  final DreamWorld? dreamWorld;
  final Home? home;
  final OfficialArtwork? officialArtwork;

  Other copyWith({
    DreamWorld? dreamWorld,
    Home? home,
    OfficialArtwork? officialArtwork,
  }) {
    return Other(
      dreamWorld: dreamWorld ?? this.dreamWorld,
      home: home ?? this.home,
      officialArtwork: officialArtwork ?? this.officialArtwork,
    );
  }

  factory Other.fromJson(Map<String, dynamic> json) {
    return Other(
      dreamWorld: json["dream_world"] == null
          ? null
          : DreamWorld.fromJson(json["dream_world"]),
      home: json["home"] == null ? null : Home.fromJson(json["home"]),
      officialArtwork: json["official-artwork"] == null
          ? null
          : OfficialArtwork.fromJson(json["official-artwork"]),
    );
  }
}

class OfficialArtwork {
  OfficialArtwork({
    required this.frontDefault,
  });

  final String? frontDefault;

  OfficialArtwork copyWith({
    String? frontDefault,
  }) {
    return OfficialArtwork(
      frontDefault: frontDefault ?? this.frontDefault,
    );
  }

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) {
    return OfficialArtwork(
      frontDefault:
          json["front_default"] == null ? null : json["front_default"],
    );
  }
}

class Stat {
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  final int? baseStat;
  final int? effort;
  final Species? stat;

  Stat copyWith({
    int? baseStat,
    int? effort,
    Species? stat,
  }) {
    return Stat(
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
      stat: stat ?? this.stat,
    );
  }

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      baseStat: json["base_stat"] == null ? null : json["base_stat"],
      effort: json["effort"] == null ? null : json["effort"],
      stat: json["stat"] == null ? null : Species.fromJson(json["stat"]),
    );
  }
}
