// To parse this JSON data, do
//
//     final trendTitleModel = trendTitleModelFromJson(jsonString);

import 'dart:convert';

List<TrendTitleModel> trendTitleModelFromJson(String str) => List<TrendTitleModel>.from(json.decode(str).map((x) => TrendTitleModel.fromJson(x)));



class TrendTitleModel {
    TrendTitleModel({
        this.albumId,
        this.id,
        this.title,
        this.url,
        this.thumbnailUrl,
    });

    int ?albumId;
    int ?id;
    String ?title;
    String ?url;
    String ?thumbnailUrl;

    factory TrendTitleModel.fromJson(Map<String, dynamic> json) => TrendTitleModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
