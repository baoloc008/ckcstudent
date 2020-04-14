import 'dart:convert';

AppConfig appConfigFromJson(String str) => AppConfig.fromJson(json.decode(str));

String appConfigToJson(AppConfig data) => json.encode(data.toJson());

class AppConfig {
  int currenttimestamp;
  List<Categorylist> categorylist;
  List<String> imagelist;

  AppConfig({
    this.currenttimestamp,
    this.categorylist,
    this.imagelist,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) => AppConfig(
        currenttimestamp: json["currenttimestamp"],
        categorylist: List<Categorylist>.from(
            json["categorylist"].map((x) => Categorylist.fromJson(x))),
        imagelist: List<String>.from(json["imagelist"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "currenttimestamp": currenttimestamp,
        "categorylist": List<dynamic>.from(categorylist.map((x) => x.toJson())),
        "imagelist": List<dynamic>.from(imagelist.map((x) => x)),
      };
}

class Categorylist {
  String id;
  String weburl;
  String itemicon;
  String itemtext;

  Categorylist({
    this.id,
    this.weburl,
    this.itemicon,
    this.itemtext,
  });

  factory Categorylist.fromJson(Map<String, dynamic> json) => Categorylist(
        id: json["id"],
        weburl: json["weburl"],
        itemicon: json["itemicon"],
        itemtext: json["itemtext"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "weburl": weburl,
        "itemicon": itemicon,
        "itemtext": itemtext,
      };
}
