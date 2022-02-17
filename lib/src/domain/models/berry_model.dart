// To parse this JSON data, do
//
//     final BerryModel = BerryModelFromJson(jsonString);

import 'dart:convert';

BerryModel berryModelFromJson(String str) => BerryModel.fromJson(json.decode(str));

String berryModelToJson(BerryModel data) => json.encode(data.toJson());

class BerryModel {
    BerryModel({
        this.id,
        this.name,
        this.growthTime,
        this.maxHarvest,
        this.naturalGiftPower,
        this.size,
        this.smoothness,
        this.soilDryness,
        this.firmness,
        this.flavors,
        this.item,
        this.naturalGiftType,
    });

    int? id;
    String? name;
    int? growthTime;
    int? maxHarvest;
    int? naturalGiftPower;
    int? size;
    int? smoothness;
    int? soilDryness;
    Firmness? firmness;
    List<Flavor>? flavors;
    Firmness? item;
    Firmness? naturalGiftType;

    factory BerryModel.fromJson(Map<String, dynamic> json) => BerryModel(
        id: json["id"],
        name: json["name"],
        growthTime: json["growth_time"],
        maxHarvest: json["max_harvest"],
        naturalGiftPower: json["natural_gift_power"],
        size: json["size"],
        smoothness: json["smoothness"],
        soilDryness: json["soil_dryness"],
        firmness: Firmness.fromJson(json["firmness"]),
        flavors: List<Flavor>.from(json["flavors"].map((x) => Flavor.fromJson(x))),
        item: Firmness.fromJson(json["item"]),
        naturalGiftType: Firmness.fromJson(json["natural_gift_type"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "growth_time": growthTime,
        "max_harvest": maxHarvest,
        "natural_gift_power": naturalGiftPower,
        "size": size,
        "smoothness": smoothness,
        "soil_dryness": soilDryness,
        "firmness": firmness?.toJson(),
        "flavors": List<dynamic>.from(flavors!.map((x) => x.toJson())),
        "item": item?.toJson(),
        "natural_gift_type": naturalGiftType?.toJson(),
    };
}

class Firmness {
    Firmness({
        this.name,
        this.url,
    });

    String? name;
    String? url;

    factory Firmness.fromJson(Map<String, dynamic> json) => Firmness(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

class Flavor {
    Flavor({
        this.potency,
        this.flavor,
    });

    int? potency;
    Firmness? flavor;

    factory Flavor.fromJson(Map<String, dynamic> json) => Flavor(
        potency: json["potency"],
        flavor: Firmness.fromJson(json["flavor"]),
    );

    Map<String, dynamic> toJson() => {
        "potency": potency,
        "flavor": flavor?.toJson(),
    };
}
