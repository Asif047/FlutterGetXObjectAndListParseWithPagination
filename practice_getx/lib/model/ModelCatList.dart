import 'dart:convert';

List<ModelCatList> modelCatListFromJson(String str) => List<ModelCatList>.from(json.decode(str).map((x) => ModelCatList.fromJson(x)));

String modelCatListToJson(List<ModelCatList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelCatList {
  String id;
  String url;
  int width;
  int height;

  ModelCatList({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory ModelCatList.fromJson(Map<String, dynamic> json) => ModelCatList(
    id: json["id"],
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "width": width,
    "height": height,
  };
}
