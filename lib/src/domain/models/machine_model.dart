class MachineModel {
  MachineModel({
    required this.id,
    required this.item,
    required this.move,
    required this.versionGroup,
  });

  final int id;
  final Item? item;
  final Item? move;
  final Item? versionGroup;

  factory MachineModel.fromJson(Map<String, dynamic>? json) {
    return MachineModel(
      id: json?["id"],
      item: Item.fromJson(json?["item"]),
      move: Item.fromJson(json?["move"]),
      versionGroup: Item.fromJson(json?["version_group"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "item": item?.toJson(),
        "move": move?.toJson(),
        "version_group": versionGroup?.toJson(),
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
