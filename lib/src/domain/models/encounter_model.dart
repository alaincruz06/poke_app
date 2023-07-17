class EncounterModel {
  EncounterModel({
    required this.locationArea,
    required this.versionDetails,
  });

  final LocationArea? locationArea;
  final List<VersionDetail>? versionDetails;

  EncounterModel copyWith({
    LocationArea? locationArea,
    List<VersionDetail>? versionDetails,
  }) {
    return EncounterModel(
      locationArea: locationArea ?? this.locationArea,
      versionDetails: versionDetails ?? this.versionDetails,
    );
  }

  factory EncounterModel.fromJson(Map<String, dynamic> json) {
    return EncounterModel(
      locationArea:
          json["location_area"] == null ? null : LocationArea.fromJson(json["location_area"]),
      versionDetails: json["version_details"] == null
          ? null
          : List<VersionDetail>.from(json["version_details"].map((x) => VersionDetail.fromJson(x))),
    );
  }
}

class LocationArea {
  LocationArea({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  LocationArea copyWith({
    String? name,
    String? url,
  }) {
    return LocationArea(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory LocationArea.fromJson(Map<String, dynamic> json) {
    return LocationArea(
      name: json["name"] == null ? null : json["name"],
      url: json["url"] == null ? null : json["url"],
    );
  }
}

class VersionDetail {
  VersionDetail({
    required this.encounterDetails,
    required this.maxChance,
    required this.version,
  });

  final List<EncounterDetail>? encounterDetails;
  final int? maxChance;
  final LocationArea? version;

  VersionDetail copyWith({
    List<EncounterDetail>? encounterDetails,
    int? maxChance,
    LocationArea? version,
  }) {
    return VersionDetail(
      encounterDetails: encounterDetails ?? this.encounterDetails,
      maxChance: maxChance ?? this.maxChance,
      version: version ?? this.version,
    );
  }

  factory VersionDetail.fromJson(Map<String, dynamic> json) {
    return VersionDetail(
      encounterDetails: json["encounter_details"] == null
          ? null
          : List<EncounterDetail>.from(
              json["encounter_details"].map((x) => EncounterDetail.fromJson(x))),
      maxChance: json["max_chance"] == null ? null : json["max_chance"],
      version: json["version"] == null ? null : LocationArea.fromJson(json["version"]),
    );
  }
}

class EncounterDetail {
  EncounterDetail({
    required this.chance,
    required this.conditionValues,
    required this.maxLevel,
    required this.method,
    required this.minLevel,
  });

  final int? chance;
  final List<LocationArea>? conditionValues;
  final int? maxLevel;
  final LocationArea? method;
  final int? minLevel;

  EncounterDetail copyWith({
    int? chance,
    List<LocationArea>? conditionValues,
    int? maxLevel,
    LocationArea? method,
    int? minLevel,
  }) {
    return EncounterDetail(
      chance: chance ?? this.chance,
      conditionValues: conditionValues ?? this.conditionValues,
      maxLevel: maxLevel ?? this.maxLevel,
      method: method ?? this.method,
      minLevel: minLevel ?? this.minLevel,
    );
  }

  factory EncounterDetail.fromJson(Map<String, dynamic> json) {
    return EncounterDetail(
      chance: json["chance"] == null ? null : json["chance"],
      conditionValues: json["condition_values"] == null
          ? null
          : List<LocationArea>.from(json["condition_values"].map((x) => LocationArea.fromJson(x))),
      maxLevel: json["max_level"] == null ? null : json["max_level"],
      method: json["method"] == null ? null : LocationArea.fromJson(json["method"]),
      minLevel: json["min_level"] == null ? null : json["min_level"],
    );
  }
}
