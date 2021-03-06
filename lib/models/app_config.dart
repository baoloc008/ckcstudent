import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

AppConfig appConfigFromJson(String str) => AppConfig.fromJson(json.decode(str));

String appConfigToJson(AppConfig data) => json.encode(data.toJson());

class AppConfig {
  List<CategoryModel> categoryList;
  List<String> homepageImageList;
  List<String> homepageFullImageList;
  String homepageBannerUrl;

  AppConfig({
    this.categoryList,
    this.homepageImageList,
    this.homepageFullImageList,
    this.homepageBannerUrl
  });

  factory AppConfig.fromMap(Map<String, dynamic> map, String reference) {
    return AppConfig(
      categoryList: List<CategoryModel>.from(
          map['category_list'].map((x) => CategoryModel.fromMap(x))),
      homepageImageList:
          List<String>.from(map['homepage_image_list'].map((x) => x)),
      homepageFullImageList:
          List<String>.from(map['homepage_full_image_list'].map((x) => x)),
      homepageBannerUrl: map['homepage_banner_url'].toString()
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
        homepageFullImageList:
            List<String>.from(json["homepage_full_image_list"].map((x) => x)),
        homepageBannerUrl: json["homepage_banner_url"].toString()
      );

  Map<String, dynamic> toJson() => {
        "category_list":
            List<dynamic>.from(categoryList.map((x) => x.toJson())),
        "homepage_image_list":
            List<dynamic>.from(homepageImageList.map((x) => x)),
        "homepage_full_image_list":
            List<dynamic>.from(homepageFullImageList.map((x) => x)),
        "homepage_banner_url": homepageBannerUrl
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
