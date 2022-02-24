class ResultsModel {
  ResultsModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int? count;
  final String? next;
  final dynamic previous;
  final List<Result>? results;

  ResultsModel copyWith({
    int? count,
    String? next,
    dynamic? previous,
    List<Result>? results,
  }) {
    return ResultsModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  factory ResultsModel.fromJson(Map<String, dynamic> json) {
    return ResultsModel(
      count: json["count"] == null ? null : json["count"],
      next: json["next"] == null ? null : json["next"],
      previous: json["previous"],
      results: json["results"] == null
          ? null
          : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );
  }
}

class Result {
  Result({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Result copyWith({
    String? name,
    String? url,
  }) {
    return Result(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      name: json["name"] == null ? null : json["name"],
      url: json["url"] == null ? null : json["url"],
    );
  }
}
