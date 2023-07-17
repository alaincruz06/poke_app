class PokemonSpeciesModel {
  PokemonSpeciesModel({
    required this.id,
    required this.name,
    required this.order,
    required this.genderRate,
    required this.captureRate,
    required this.baseHappiness,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.hatchCounter,
    required this.hasGenderDifferences,
    required this.formsSwitchable,
    required this.growthRate,
    required this.pokedexNumbers,
    required this.eggGroups,
    required this.color,
    required this.shape,
    required this.evolvesFromSpecies,
    required this.evolutionChain,
    required this.habitat,
    required this.generation,
    required this.names,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.genera,
    required this.varieties,
  });

  final int id;
  final String? name;
  final int? order;
  final int? genderRate;
  final int? captureRate;
  final int? baseHappiness;
  final bool? isBaby;
  final bool? isLegendary;
  final bool? isMythical;
  final int? hatchCounter;
  final bool? hasGenderDifferences;
  final bool? formsSwitchable;
  final Color? growthRate;
  final List<PokedexNumber>? pokedexNumbers;
  final List<Color>? eggGroups;
  final Color? color;
  final Color? shape;
  final Color? evolvesFromSpecies;
  final EvolutionChain? evolutionChain;
  final dynamic habitat;
  final Color? generation;
  final List<Name>? names;
  final List<FlavorTextEntry>? flavorTextEntries;
  final List<FormDescription>? formDescriptions;
  final List<Genus>? genera;
  final List<Variety>? varieties;

  PokemonSpeciesModel copyWith({
    int? id,
    String? name,
    int? order,
    int? genderRate,
    int? captureRate,
    int? baseHappiness,
    bool? isBaby,
    bool? isLegendary,
    bool? isMythical,
    int? hatchCounter,
    bool? hasGenderDifferences,
    bool? formsSwitchable,
    Color? growthRate,
    List<PokedexNumber>? pokedexNumbers,
    List<Color>? eggGroups,
    Color? color,
    Color? shape,
    Color? evolvesFromSpecies,
    EvolutionChain? evolutionChain,
    dynamic? habitat,
    Color? generation,
    List<Name>? names,
    List<FlavorTextEntry>? flavorTextEntries,
    List<FormDescription>? formDescriptions,
    List<Genus>? genera,
    List<Variety>? varieties,
  }) {
    return PokemonSpeciesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
      genderRate: genderRate ?? this.genderRate,
      captureRate: captureRate ?? this.captureRate,
      baseHappiness: baseHappiness ?? this.baseHappiness,
      isBaby: isBaby ?? this.isBaby,
      isLegendary: isLegendary ?? this.isLegendary,
      isMythical: isMythical ?? this.isMythical,
      hatchCounter: hatchCounter ?? this.hatchCounter,
      hasGenderDifferences: hasGenderDifferences ?? this.hasGenderDifferences,
      formsSwitchable: formsSwitchable ?? this.formsSwitchable,
      growthRate: growthRate ?? this.growthRate,
      pokedexNumbers: pokedexNumbers ?? this.pokedexNumbers,
      eggGroups: eggGroups ?? this.eggGroups,
      color: color ?? this.color,
      shape: shape ?? this.shape,
      evolvesFromSpecies: evolvesFromSpecies ?? this.evolvesFromSpecies,
      evolutionChain: evolutionChain ?? this.evolutionChain,
      habitat: habitat ?? this.habitat,
      generation: generation ?? this.generation,
      names: names ?? this.names,
      flavorTextEntries: flavorTextEntries ?? this.flavorTextEntries,
      formDescriptions: formDescriptions ?? this.formDescriptions,
      genera: genera ?? this.genera,
      varieties: varieties ?? this.varieties,
    );
  }

  factory PokemonSpeciesModel.fromJson(Map<String, dynamic> json) {
    return PokemonSpeciesModel(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      order: json["order"] == null ? null : json["order"],
      genderRate: json["gender_rate"] == null ? null : json["gender_rate"],
      captureRate: json["capture_rate"] == null ? null : json["capture_rate"],
      baseHappiness: json["base_happiness"] == null ? null : json["base_happiness"],
      isBaby: json["is_baby"] == null ? null : json["is_baby"],
      isLegendary: json["is_legendary"] == null ? null : json["is_legendary"],
      isMythical: json["is_mythical"] == null ? null : json["is_mythical"],
      hatchCounter: json["hatch_counter"] == null ? null : json["hatch_counter"],
      hasGenderDifferences:
          json["has_gender_differences"] == null ? null : json["has_gender_differences"],
      formsSwitchable: json["forms_switchable"] == null ? null : json["forms_switchable"],
      growthRate: json["growth_rate"] == null ? null : Color.fromJson(json["growth_rate"]),
      pokedexNumbers: json["pokedex_numbers"] == null
          ? null
          : List<PokedexNumber>.from(json["pokedex_numbers"].map((x) => PokedexNumber.fromJson(x))),
      eggGroups: json["egg_groups"] == null
          ? null
          : List<Color>.from(json["egg_groups"].map((x) => Color.fromJson(x))),
      color: json["color"] == null ? null : Color.fromJson(json["color"]),
      shape: json["shape"] == null ? null : Color.fromJson(json["shape"]),
      evolvesFromSpecies: json["evolves_from_species"] == null
          ? null
          : Color.fromJson(json["evolves_from_species"]),
      evolutionChain:
          json["evolution_chain"] == null ? null : EvolutionChain.fromJson(json["evolution_chain"]),
      habitat: json["habitat"],
      generation: json["generation"] == null ? null : Color.fromJson(json["generation"]),
      names: json["names"] == null
          ? null
          : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
      flavorTextEntries: json["flavor_text_entries"] == null
          ? null
          : List<FlavorTextEntry>.from(
              json["flavor_text_entries"].map((x) => FlavorTextEntry.fromJson(x))),
      formDescriptions: json["form_descriptions"] == null
          ? null
          : List<FormDescription>.from(
              json["form_descriptions"].map((x) => FormDescription.fromJson(x))),
      genera: json["genera"] == null
          ? null
          : List<Genus>.from(json["genera"].map((x) => Genus.fromJson(x))),
      varieties: json["varieties"] == null
          ? null
          : List<Variety>.from(json["varieties"].map((x) => Variety.fromJson(x))),
    );
  }
}

class Color {
  Color({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Color copyWith({
    String? name,
    String? url,
  }) {
    return Color(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(
      name: json["name"] == null ? null : json["name"],
      url: json["url"] == null ? null : json["url"],
    );
  }
}

class EvolutionChain {
  EvolutionChain({
    required this.url,
  });

  final String? url;

  EvolutionChain copyWith({
    String? url,
  }) {
    return EvolutionChain(
      url: url ?? this.url,
    );
  }

  factory EvolutionChain.fromJson(Map<String, dynamic> json) {
    return EvolutionChain(
      url: json["url"] == null ? null : json["url"],
    );
  }
}

class FlavorTextEntry {
  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  final String? flavorText;
  final Color? language;
  final Color? version;

  FlavorTextEntry copyWith({
    String? flavorText,
    Color? language,
    Color? version,
  }) {
    return FlavorTextEntry(
      flavorText: flavorText ?? this.flavorText,
      language: language ?? this.language,
      version: version ?? this.version,
    );
  }

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) {
    return FlavorTextEntry(
      flavorText: json["flavor_text"] == null ? null : json["flavor_text"],
      language: json["language"] == null ? null : Color.fromJson(json["language"]),
      version: json["version"] == null ? null : Color.fromJson(json["version"]),
    );
  }
}

class FormDescription {
  FormDescription({
    required this.description,
    required this.language,
  });

  final String? description;
  final Color? language;

  FormDescription copyWith({
    String? description,
    Color? language,
  }) {
    return FormDescription(
      description: description ?? this.description,
      language: language ?? this.language,
    );
  }

  factory FormDescription.fromJson(Map<String, dynamic> json) {
    return FormDescription(
      description: json["description"] == null ? null : json["description"],
      language: json["language"] == null ? null : Color.fromJson(json["language"]),
    );
  }
}

class Genus {
  Genus({
    required this.genus,
    required this.language,
  });

  final String? genus;
  final Color? language;

  Genus copyWith({
    String? genus,
    Color? language,
  }) {
    return Genus(
      genus: genus ?? this.genus,
      language: language ?? this.language,
    );
  }

  factory Genus.fromJson(Map<String, dynamic> json) {
    return Genus(
      genus: json["genus"] == null ? null : json["genus"],
      language: json["language"] == null ? null : Color.fromJson(json["language"]),
    );
  }
}

class Name {
  Name({
    required this.name,
    required this.language,
  });

  final String? name;
  final Color? language;

  Name copyWith({
    String? name,
    Color? language,
  }) {
    return Name(
      name: name ?? this.name,
      language: language ?? this.language,
    );
  }

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      name: json["name"] == null ? null : json["name"],
      language: json["language"] == null ? null : Color.fromJson(json["language"]),
    );
  }
}

class PokedexNumber {
  PokedexNumber({
    required this.entryNumber,
    required this.pokedex,
  });

  final int? entryNumber;
  final Color? pokedex;

  PokedexNumber copyWith({
    int? entryNumber,
    Color? pokedex,
  }) {
    return PokedexNumber(
      entryNumber: entryNumber ?? this.entryNumber,
      pokedex: pokedex ?? this.pokedex,
    );
  }

  factory PokedexNumber.fromJson(Map<String, dynamic> json) {
    return PokedexNumber(
      entryNumber: json["entry_number"] == null ? null : json["entry_number"],
      pokedex: json["pokedex"] == null ? null : Color.fromJson(json["pokedex"]),
    );
  }
}

class Variety {
  Variety({
    required this.isDefault,
    required this.pokemon,
  });

  final bool? isDefault;
  final Color? pokemon;

  Variety copyWith({
    bool? isDefault,
    Color? pokemon,
  }) {
    return Variety(
      isDefault: isDefault ?? this.isDefault,
      pokemon: pokemon ?? this.pokemon,
    );
  }

  factory Variety.fromJson(Map<String, dynamic> json) {
    return Variety(
      isDefault: json["is_default"] == null ? null : json["is_default"],
      pokemon: json["pokemon"] == null ? null : Color.fromJson(json["pokemon"]),
    );
  }
}
