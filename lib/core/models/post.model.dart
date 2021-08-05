// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  String postcaption;
  String postusername;
  String postimage;
  String postdate;
  String postlocation;
  String? id;
  String? collection;
  Permissions? permissions;
  int? postlikes;
  String? postcomments;
  Post(
    this.postcaption,
    this.postusername,
    this.postimage,
    this.postdate,
    this.postlocation, [
    this.id,
    this.collection,
    this.permissions,
    this.postlikes,
    this.postcomments,
  ]);

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        json["postcaption"],
        json["postusername"],
        json["postimage"],
        json["postdate"],
        json["postlocation"],
        json["\$id"],
        json["\$collection"],
        Permissions.fromJson(json["\$permissions"]),
        json["postlikes"],
        json["postcomments"],
      );

  Map<String, dynamic> toJson() => {
        "\$id": id,
        "\$collection": collection,
        "\permissions": permissions!.toJson(),
        "postcaption": postcaption,
        "postusername": postusername,
        "postimage": postimage,
        "postlikes": postlikes,
        "postcomments": postcomments,
        "postdate": postdate,
        "postlocation": postlocation,
      };
}

class Permissions {
  Permissions(
    this.read,
    this.write,
  );

  List<dynamic> read;
  List<dynamic> write;

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
        List<dynamic>.from(json["read"].map((x) => x)),
        List<dynamic>.from(json["write"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "read": List<dynamic>.from(read.map((x) => x)),
        "write": List<dynamic>.from(write.map((x) => x)),
      };
}
