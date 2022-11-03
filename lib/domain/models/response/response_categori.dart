import 'dart:convert';

ResponseCategori responseCategoriFromJson(String str) =>
    ResponseCategori.fromJson(json.decode(str));

String responseCategoriToJson(ResponseCategori data) =>
    json.encode(data.toJson());

class ResponseCategori {
  bool resp;
  String message;
  List<Categori> categories;

  ResponseCategori({
    required this.resp,
    required this.message,
    required this.categories,
  });

  factory ResponseCategori.fromJson(Map<String, dynamic> json) =>
      ResponseCategori(
        resp: json["resp"],
        message: json["message"],
        categories: List<Categori>.from(
            json["categories"].map((x) => Categori.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "message": message,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Categori {
  String categoriUid;
  String categori;

  Categori({
    required this.categoriUid,
    required this.categori,
  });

  factory Categori.fromJson(Map<String, dynamic> json) => Categori(
        categoriUid: json["uid"],
        categori: json["categorie"],
      );

  Map<String, dynamic> toJson() => {
        "uid": categoriUid,
        "categori": categori,
      };
}
