import 'dart:convert';

ResponseLocation responseLocationFromJson(String str) =>
    ResponseLocation.fromJson(json.decode(str));

String responseLocationToJson(ResponseLocation data) =>
    json.encode(data.toJson());

class ResponseLocation {
  bool resp;
  String message;
  String address;

  ResponseLocation({
    required this.resp,
    required this.message,
    required this.address,
  });

  factory ResponseLocation.fromJson(Map<String, dynamic> json) =>
      ResponseLocation(
        resp: json["resp"],
        message: json["message"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "message": message,
        "address": address,
      };
}
