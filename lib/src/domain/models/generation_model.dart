class GenerationModel {
  GenerationModel({
    required this.id,
    required this.name,
    required this.abilities,
    required this.mainRegion,
    required this.moves,
    required this.names,
    required this.pokemonSpecies,
    required this.types,
    required this.versionGroups,
  });

  final int id;
  final String? name;
  final List<dynamic>? abilities;
  final MainRegion? mainRegion;
  final List<MainRegion>? moves;
  final List<Name>? names;
  final List<MainRegion>? pokemonSpecies;
  final List<MainRegion>? types;
  final List<MainRegion>? versionGroups;

  factory GenerationModel.fromJson(Map<String, dynamic>? json) {
    return GenerationModel(
      id: json?["id"],
      name: json?["name"],
      abilities:
          json?["abilities"] == null ? [] : List<dynamic>.from(json?["abilities"]!.map((x) => x)),
      mainRegion: MainRegion.fromJson(json?["main_region"]),
      moves: json?["moves"] == null
          ? []
          : List<MainRegion>.from(json?["moves"]!.map((x) => MainRegion.fromJson(x))),
      names: json?["names"] == null
          ? []
          : List<Name>.from(json?["names"]!.map((x) => Name.fromJson(x))),
      pokemonSpecies: json?["pokemon_species"] == null
          ? []
          : List<MainRegion>.from(json?["pokemon_species"]!.map((x) => MainRegion.fromJson(x))),
      types: json?["types"] == null
          ? []
          : List<MainRegion>.from(json?["types"]!.map((x) => MainRegion.fromJson(x))),
      versionGroups: json?["version_groups"] == null
          ? []
          : List<MainRegion>.from(json?["version_groups"]!.map((x) => MainRegion.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "abilities": abilities == null ? [] : List<dynamic>.from(abilities!.map((x) => x)),
        "main_region": mainRegion?.toJson(),
        "moves": moves == null ? [] : List<dynamic>.from(moves!.map((x) => x.toJson())),
        "names": names == null ? [] : List<dynamic>.from(names!.map((x) => x.toJson())),
        "pokemon_species": pokemonSpecies == null
            ? []
            : List<dynamic>.from(pokemonSpecies!.map((x) => x.toJson())),
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x.toJson())),
        "version_groups":
            versionGroups == null ? [] : List<dynamic>.from(versionGroups!.map((x) => x.toJson())),
      };
}

class MainRegion {
  MainRegion({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  factory MainRegion.fromJson(Map<String, dynamic>? json) {
    return MainRegion(
      name: json?["name"],
      url: json?["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Name {
  Name({
    required this.name,
    required this.language,
  });

  final String? name;
  final MainRegion? language;

  factory Name.fromJson(Map<String, dynamic>? json) {
    return Name(
      name: json?["name"],
      language: MainRegion.fromJson(json?["language"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "language": language?.toJson(),
      };
}
