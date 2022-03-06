// To parse this JSON data, do
//
//     final popularTitleModel = popularTitleModelFromJson(jsonString);

import 'dart:convert';

List<PopularTitleModel> popularTitleModelFromJson(String str) => List<PopularTitleModel>.from(json.decode(str).map((x) => PopularTitleModel.fromJson(x)));


class PopularTitleModel {
    PopularTitleModel({
        this.userId,
        this.id,
        this.title,
    });

    int ?userId;
    int ?id;
    String ?title;

    factory PopularTitleModel.fromJson(Map<String, dynamic> json) => PopularTitleModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
    };
}
