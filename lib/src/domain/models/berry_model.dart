class BerryModel {
  BerryModel({
    required this.id,
    required this.name,
    required this.growthTime,
    required this.maxHarvest,
    required this.naturalGiftPower,
    required this.size,
    required this.smoothness,
    required this.soilDryness,
    required this.firmness,
    required this.flavors,
    required this.item,
    required this.naturalGiftType,
  });

  final int id;
  final String? name;
  final int? growthTime;
  final int? maxHarvest;
  final int? naturalGiftPower;
  final int? size;
  final int? smoothness;
  final int? soilDryness;
  final Firmness? firmness;
  final List<Flavor>? flavors;
  final Firmness? item;
  final Firmness? naturalGiftType;

  BerryModel copyWith({
    int? id,
    String? name,
    int? growthTime,
    int? maxHarvest,
    int? naturalGiftPower,
    int? size,
    int? smoothness,
    int? soilDryness,
    Firmness? firmness,
    List<Flavor>? flavors,
    Firmness? item,
    Firmness? naturalGiftType,
  }) {
    return BerryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      growthTime: growthTime ?? this.growthTime,
      maxHarvest: maxHarvest ?? this.maxHarvest,
      naturalGiftPower: naturalGiftPower ?? this.naturalGiftPower,
      size: size ?? this.size,
      smoothness: smoothness ?? this.smoothness,
      soilDryness: soilDryness ?? this.soilDryness,
      firmness: firmness ?? this.firmness,
      flavors: flavors ?? this.flavors,
      item: item ?? this.item,
      naturalGiftType: naturalGiftType ?? this.naturalGiftType,
    );
  }

  factory BerryModel.fromJson(Map<String, dynamic> json) {
    return BerryModel(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      growthTime: json["growth_time"] == null ? null : json["growth_time"],
      maxHarvest: json["max_harvest"] == null ? null : json["max_harvest"],
      naturalGiftPower: json["natural_gift_power"] == null
          ? null
          : json["natural_gift_power"],
      size: json["size"] == null ? null : json["size"],
      smoothness: json["smoothness"] == null ? null : json["smoothness"],
      soilDryness: json["soil_dryness"] == null ? null : json["soil_dryness"],
      firmness:
          json["firmness"] == null ? null : Firmness.fromJson(json["firmness"]),
      flavors: json["flavors"] == null
          ? null
          : List<Flavor>.from(json["flavors"].map((x) => Flavor.fromJson(x))),
      item: json["item"] == null ? null : Firmness.fromJson(json["item"]),
      naturalGiftType: json["natural_gift_type"] == null
          ? null
          : Firmness.fromJson(json["natural_gift_type"]),
    );
  }
}

class Firmness {
  Firmness({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Firmness copyWith({
    String? name,
    String? url,
  }) {
    return Firmness(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory Firmness.fromJson(Map<String, dynamic> json) {
    return Firmness(
      name: json["name"] == null ? null : json["name"],
      url: json["url"] == null ? null : json["url"],
    );
  }
}

class Flavor {
  Flavor({
    required this.potency,
    required this.flavor,
  });

  final int? potency;
  final Firmness? flavor;

  Flavor copyWith({
    int? potency,
    Firmness? flavor,
  }) {
    return Flavor(
      potency: potency ?? this.potency,
      flavor: flavor ?? this.flavor,
    );
  }

  factory Flavor.fromJson(Map<String, dynamic> json) {
    return Flavor(
      potency: json["potency"] == null ? null : json["potency"],
      flavor: json["flavor"] == null ? null : Firmness.fromJson(json["flavor"]),
    );
  }
}
