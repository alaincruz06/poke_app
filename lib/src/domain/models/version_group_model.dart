class VersionGroupModel {
  VersionGroupModel({
    required this.generation,
    required this.id,
    required this.moveLearnMethods,
    required this.name,
    required this.order,
    required this.pokedexes,
    required this.regions,
    required this.versions,
  });

  final Generation? generation;
  final int id;
  final List<Generation>? moveLearnMethods;
  final String? name;
  final int? order;
  final List<Generation>? pokedexes;
  final List<Generation>? regions;
  final List<Generation>? versions;

  factory VersionGroupModel.fromJson(Map<String, dynamic>? json) {
    return VersionGroupModel(
      generation: Generation.fromJson(json?["generation"]),
      id: json?["id"],
      moveLearnMethods: json?["move_learn_methods"] == null
          ? []
          : List<Generation>.from(json?["move_learn_methods"]!.map((x) => Generation.fromJson(x))),
      name: json?["name"],
      order: json?["order"],
      pokedexes: json?["pokedexes"] == null
          ? []
          : List<Generation>.from(json?["pokedexes"]!.map((x) => Generation.fromJson(x))),
      regions: json?["regions"] == null
          ? []
          : List<Generation>.from(json?["regions"]!.map((x) => Generation.fromJson(x))),
      versions: json?["versions"] == null
          ? []
          : List<Generation>.from(json?["versions"]!.map((x) => Generation.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "generation": generation?.toJson(),
        "id": id,
        "move_learn_methods": moveLearnMethods == null
            ? []
            : List<dynamic>.from(moveLearnMethods!.map((x) => x.toJson())),
        "name": name,
        "order": order,
        "pokedexes": pokedexes == null ? [] : List<dynamic>.from(pokedexes!.map((x) => x.toJson())),
        "regions": regions == null ? [] : List<dynamic>.from(regions!.map((x) => x.toJson())),
        "versions": versions == null ? [] : List<dynamic>.from(versions!.map((x) => x.toJson())),
      };
}

class Generation {
  Generation({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  factory Generation.fromJson(Map<String, dynamic>? json) {
    return Generation(
      name: json?["name"],
      url: json?["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
