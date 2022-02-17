// To parse this JSON data, do
//
//     final resultsModel = resultsModelFromJson(jsonString);

import 'dart:convert';

ResultsModel resultsModelFromJson(String str) => ResultsModel.fromJson(json.decode(str));

String resultsModelToJson(ResultsModel data) => json.encode(data.toJson());

class ResultsModel {
    ResultsModel({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    int? count;
    String? next;
    dynamic previous;
    List<Result>? results;

    factory ResultsModel.fromJson(Map<String, dynamic> json) => ResultsModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.name,
        this.url,
    });

    String? name;
    String? url;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
