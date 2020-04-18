import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

AppConfig appConfigFromJson(String str) => AppConfig.fromJson(json.decode(str));

String appConfigToJson(AppConfig data) => json.encode(data.toJson());

class AppConfig {
  List<CategoryModel> categoryList;
  List<String> homepageImageList;

  AppConfig({
    this.categoryList,
    this.homepageImageList,
  });

  factory AppConfig.fromMap(Map<String, dynamic> map, String reference) {
    return AppConfig(
      categoryList: List<CategoryModel>.from(
          map['category_list'].map((x) => CategoryModel.fromMap(x))),
      homepageImageList:
          List<String>.from(map['homepage_image_list'].map((x) => x)),
    );
  }

  factory AppConfig.fromSnapshot(DocumentSnapshot snapshot) {
    return AppConfig.fromMap(snapshot.data, snapshot.documentID);
  }

  factory AppConfig.fromJson(Map<String, dynamic> json) => AppConfig(
        categoryList: List<CategoryModel>.from(
            json["category_list"].map((x) => CategoryModel.fromJson(x))),
        homepageImageList:
            List<String>.from(json["homepage_image_list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "category_list":
            List<dynamic>.from(categoryList.map((x) => x.toJson())),
        "homepage_image_list":
            List<dynamic>.from(homepageImageList.map((x) => x)),
      };
}

class CategoryModel {
  String id;
  String url;
  String icon;
  String text;

  CategoryModel({
    this.id,
    this.url,
    this.icon,
    this.text,
  });

  CategoryModel.fromMap(Map<dynamic, dynamic> map)
      : id = map["id"],
        url = map["url"],
        icon = map["icon"],
        text = map["text"];

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        url: json["url"],
        icon: json["icon"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "icon": icon,
        "text": text,
      };
}
