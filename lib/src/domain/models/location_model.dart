class LocationModel {
  LocationModel({
    required this.id,
    required this.name,
    required this.region,
    required this.names,
    required this.gameIndices,
    required this.areas,
  });

  final int id;
  final String? name;
  final Region? region;
  final List<Name>? names;
  final List<GameIndex>? gameIndices;
  final List<Region>? areas;

  LocationModel copyWith({
    int? id,
    String? name,
    Region? region,
    List<Name>? names,
    List<GameIndex>? gameIndices,
    List<Region>? areas,
  }) {
    return LocationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      region: region ?? this.region,
      names: names ?? this.names,
      gameIndices: gameIndices ?? this.gameIndices,
      areas: areas ?? this.areas,
    );
  }

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      region: json["region"] == null ? null : Region.fromJson(json["region"]),
      names: json["names"] == null
          ? null
          : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
      gameIndices: json["game_indices"] == null
          ? null
          : List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromJson(x))),
      areas: json["areas"] == null
          ? null
          : List<Region>.from(json["areas"].map((x) => Region.fromJson(x))),
    );
  }
}

class Region {
  Region({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Region copyWith({
    String? name,
    String? url,
  }) {
    return Region(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      name: json["name"] == null ? null : json["name"],
      url: json["url"] == null ? null : json["url"],
    );
  }
}

class GameIndex {
  GameIndex({
    required this.gameIndex,
    required this.generation,
  });

  final int? gameIndex;
  final Region? generation;

  GameIndex copyWith({
    int? gameIndex,
    Region? generation,
  }) {
    return GameIndex(
      gameIndex: gameIndex ?? this.gameIndex,
      generation: generation ?? this.generation,
    );
  }

  factory GameIndex.fromJson(Map<String, dynamic> json) {
    return GameIndex(
      gameIndex: json["game_index"] == null ? null : json["game_index"],
      generation: json["generation"] == null ? null : Region.fromJson(json["generation"]),
    );
  }
}

class Name {
  Name({
    required this.name,
    required this.language,
  });

  final String? name;
  final Region? language;

  Name copyWith({
    String? name,
    Region? language,
  }) {
    return Name(
      name: name ?? this.name,
      language: language ?? this.language,
    );
  }

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      name: json["name"] == null ? null : json["name"],
      language: json["language"] == null ? null : Region.fromJson(json["language"]),
    );
  }
}
