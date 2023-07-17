class BerryFirmnessesModel {
  BerryFirmnessesModel({
    required this.id,
    required this.name,
    required this.berries,
    required this.names,
  });

  final int id;
  final String? name;
  final List<Berry>? berries;
  final List<Name>? names;

  BerryFirmnessesModel copyWith({
    int? id,
    String? name,
    List<Berry>? berries,
    List<Name>? names,
  }) {
    return BerryFirmnessesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      berries: berries ?? this.berries,
      names: names ?? this.names,
    );
  }

  factory BerryFirmnessesModel.fromJson(Map<String, dynamic> json) {
    return BerryFirmnessesModel(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      berries: json["berries"] == null
          ? null
          : List<Berry>.from(json["berries"].map((x) => Berry.fromJson(x))),
      names: json["names"] == null
          ? null
          : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
    );
  }
}

class Berry {
  Berry({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Berry copyWith({
    String? name,
    String? url,
  }) {
    return Berry(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory Berry.fromJson(Map<String, dynamic> json) {
    return Berry(
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
  final Berry? language;

  Name copyWith({
    String? name,
    Berry? language,
  }) {
    return Name(
      name: name ?? this.name,
      language: language ?? this.language,
    );
  }

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      name: json["name"] == null ? null : json["name"],
      language: json["language"] == null ? null : Berry.fromJson(json["language"]),
    );
  }
}
