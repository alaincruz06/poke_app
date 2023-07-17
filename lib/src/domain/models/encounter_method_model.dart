class EncounterMethodModel {
  EncounterMethodModel({
    required this.id,
    required this.name,
    required this.names,
    required this.order,
  });

  final int id;
  final String? name;
  final List<Name>? names;
  final int? order;

  EncounterMethodModel copyWith({
    int? id,
    String? name,
    List<Name>? names,
    int? order,
  }) {
    return EncounterMethodModel(
      id: id ?? this.id,
      name: name ?? this.name,
      names: names ?? this.names,
      order: order ?? this.order,
    );
  }

  factory EncounterMethodModel.fromJson(Map<String, dynamic> json) {
    return EncounterMethodModel(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      names: json["names"] == null
          ? null
          : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
      order: json["order"] == null ? null : json["order"],
    );
  }
}

class Name {
  Name({
    required this.language,
    required this.name,
  });

  final Language? language;
  final String? name;

  Name copyWith({
    Language? language,
    String? name,
  }) {
    return Name(
      language: language ?? this.language,
      name: name ?? this.name,
    );
  }

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      language: json["language"] == null ? null : Language.fromJson(json["language"]),
      name: json["name"] == null ? null : json["name"],
    );
  }
}

class Language {
  Language({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Language copyWith({
    String? name,
    String? url,
  }) {
    return Language(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      name: json["name"] == null ? null : json["name"],
      url: json["url"] == null ? null : json["url"],
    );
  }
}
