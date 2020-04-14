import 'dart:convert';

List<Category> categoryFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  String id;
  String weburl;
  String itemicon;
  String itemtext;

  Category({
    this.id,
    this.weburl,
    this.itemicon,
    this.itemtext,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
