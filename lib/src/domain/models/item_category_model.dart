class ItemCategoryModel {
  ItemCategoryModel({
    required this.id,
    required this.items,
    required this.name,
    required this.names,
    required this.pocket,
  });

  final int id;
  final List<Pocket>? items;
  final String? name;
  final List<Name>? names;
  final Pocket? pocket;

  factory ItemCategoryModel.fromJson(Map<String, dynamic>? json) {
    return ItemCategoryModel(
      id: json?["id"],
      items: json?["items"] == null
          ? []
          : List<Pocket>.from(json?["items"]!.map((x) => Pocket.fromJson(x))),
      name: json?["name"],
      names: json?["names"] == null
          ? []
          : List<Name>.from(json?["names"]!.map((x) => Name.fromJson(x))),
      pocket: Pocket.fromJson(json?["pocket"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "name": name,
        "names": names == null ? [] : List<dynamic>.from(names!.map((x) => x.toJson())),
        "pocket": pocket?.toJson(),
      };
}

class Pocket {
  Pocket({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  factory Pocket.fromJson(Map<String, dynamic>? json) {
    return Pocket(
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
    required this.language,
    required this.name,
  });

  final Pocket? language;
  final String? name;

  factory Name.fromJson(Map<String, dynamic>? json) {
    return Name(
      language: Pocket.fromJson(json?["language"]),
      name: json?["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "language": language?.toJson(),
        "name": name,
      };
}
