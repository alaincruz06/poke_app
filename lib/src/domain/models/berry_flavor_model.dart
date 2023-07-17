class BerryFlavorModel {
  BerryFlavorModel({
    required this.id,
    required this.name,
    required this.berries,
    required this.contestType,
    required this.names,
  });

  final int id;
  final String? name;
  final List<Berry>? berries;
  final ContestType? contestType;
  final List<Name>? names;

  BerryFlavorModel copyWith({
    int? id,
    String? name,
    List<Berry>? berries,
    ContestType? contestType,
    List<Name>? names,
  }) {
    return BerryFlavorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      berries: berries ?? this.berries,
      contestType: contestType ?? this.contestType,
      names: names ?? this.names,
    );
  }

  factory BerryFlavorModel.fromJson(Map<String, dynamic> json) {
    return BerryFlavorModel(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      berries: json["berries"] == null
          ? null
          : List<Berry>.from(json["berries"].map((x) => Berry.fromJson(x))),
      contestType: json["contest_type"] == null ? null : ContestType.fromJson(json["contest_type"]),
      names: json["names"] == null
          ? null
          : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
    );
  }
}

class Berry {
  Berry({
    required this.potency,
    required this.berry,
  });

  final int? potency;
  final ContestType? berry;

  Berry copyWith({
    int? potency,
    ContestType? berry,
  }) {
    return Berry(
      potency: potency ?? this.potency,
      berry: berry ?? this.berry,
    );
  }

  factory Berry.fromJson(Map<String, dynamic> json) {
    return Berry(
      potency: json["potency"] == null ? null : json["potency"],
      berry: json["berry"] == null ? null : ContestType.fromJson(json["berry"]),
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
