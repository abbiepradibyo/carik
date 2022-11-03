import 'dart:convert';

ResponsePost responsePostFromJson(String str) =>
    ResponsePost.fromJson(json.decode(str));

String responsePostToJson(ResponsePost data) => json.encode(data.toJson());

class ResponsePost {
  bool resp;
  String message;
  List<Post> posts;

  ResponsePost({
    required this.resp,
    required this.message,
    required this.posts,
  });

  factory ResponsePost.fromJson(Map<String, dynamic> json) => ResponsePost(
        resp: json["resp"],
        message: json["message"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "message": message,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
      };
}

class Post {
  String postUid;
  String desc;
  String typePrivacy;
  DateTime createdAt;
  String personUid;
  String username;
  String avatar;
  String images;
  int countLikes;
  int isLike;
  int countApplay;
  int isApplay;
  String lat;
  String long;
  double distance;

  Post({
    required this.postUid,
    required this.desc,
    required this.typePrivacy,
    required this.createdAt,
    required this.personUid,
    required this.username,
    required this.avatar,
    required this.images,
    required this.countApplay,
    required this.countLikes,
    required this.isLike,
    required this.isApplay,
    required this.lat,
    required this.long,
    required this.distance,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      postUid: json["post_uid"],
      desc: json["desc"],
      typePrivacy: json["type_privacy"],
      createdAt: DateTime.parse(json["created_at"]),
      personUid: json["person_uid"],
      username: json["username"],
      avatar: json["avatar"],
      images: json["images"] ?? "",
      countApplay: json["is_applay"] ?? -0,
      countLikes: json["count_likes"] ?? -0,
      isLike: json["is_like"] ?? -0,
      isApplay: json["is_applay"] ?? -0,
      lat: json["latitude"] ?? 0,
      long: json["longitude"] ?? 0,
      distance: json["distance"] ?? 0);

  Map<String, dynamic> toJson() => {
        "post_uid": postUid,
        "desc": desc,
        "type_privacy": typePrivacy,
        "created_at": createdAt.toIso8601String(),
        "person_uid": personUid,
        "username": username,
        "avatar": avatar,
        "images": images,
        "count_apply": countApplay,
        "count_likes": countLikes,
        "is_like": isLike,
        "is_apply": isApplay,
        "latitude": lat,
        "longitude": long,
        "distance": distance
      };
}
