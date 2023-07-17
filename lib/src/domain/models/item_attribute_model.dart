class ItemAttributeModel {
  ItemAttributeModel({
    required this.descriptions,
    required this.id,
    required this.items,
    required this.name,
    required this.names,
  });

  final List<Description>? descriptions;
  final int id;
  final List<Item>? items;
  final String? name;
  final List<Name>? names;

  factory ItemAttributeModel.fromJson(Map<String, dynamic>? json) {
    return ItemAttributeModel(
      descriptions: json?["descriptions"] == null
          ? []
          : List<Description>.from(json?["descriptions"]!.map((x) => Description.fromJson(x))),
      id: json?["id"],
      items: json?["items"] == null
          ? []
          : List<Item>.from(json?["items"]!.map((x) => Item.fromJson(x))),
      name: json?["name"],
      names: json?["names"] == null
          ? []
          : List<Name>.from(json?["names"]!.map((x) => Name.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "descriptions":
            descriptions == null ? [] : List<dynamic>.from(descriptions!.map((x) => x.toJson())),
        "id": id,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "name": name,
        "names": names == null ? [] : List<dynamic>.from(names!.map((x) => x.toJson())),
      };
}

class Description {
  Description({
    required this.description,
    required this.language,
  });

  final String? description;
  final Item? language;

  factory Description.fromJson(Map<String, dynamic>? json) {
    return Description(
      description: json?["description"],
      language: Item.fromJson(json?["language"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "language": language?.toJson(),
      };
}

class Item {
  Item({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  factory Item.fromJson(Map<String, dynamic>? json) {
    return Item(
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

  final Item? language;
  final String? name;

  factory Name.fromJson(Map<String, dynamic>? json) {
    return Name(
      language: Item.fromJson(json?["language"]),
      name: json?["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "language": language?.toJson(),
        "name": name,
      };
}
