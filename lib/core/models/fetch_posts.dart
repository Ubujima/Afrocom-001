import 'dart:convert';

FetchPosts fetchPostsFromJson(String str) =>
    FetchPosts.fromJson(json.decode(str));

String fetchPostsToJson(FetchPosts data) => json.encode(data.toJson());

class FetchPosts {
  FetchPosts(
    this.sum,
    this.documents,
  );

  int sum;
  List<FetchPostsData> documents;

  factory FetchPosts.fromJson(Map<String, dynamic> json) => FetchPosts(
        json["sum"],
        List<FetchPostsData>.from(
            json["documents"].map((x) => FetchPostsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sum": sum,
        "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
      };
}

class FetchPostsData {
  FetchPostsData(
    this.id,
    this.collection,
    this.permissions,
    this.postcategory,
    this.postusername,
    this.postusermood,
    this.postuserimage,
    this.postusercaption,
    this.postuseraddress,
    this.postuserlocationcords,
    this.posttime,
    this.postuserid,
  );

  String id;
  String collection;
  Permissions permissions;
  String postcategory;
  String postusername;
  String postusermood;
  List<String> postuserimage;
  String postusercaption;
  String postuseraddress;
  String postuserlocationcords;
  DateTime posttime;
  String postuserid;

  factory FetchPostsData.fromJson(Map<String, dynamic> json) => FetchPostsData(
        json["\u0024id"],
        json["\u0024collection"],
        Permissions.fromJson(json["\u0024permissions"]),
        json["postcategory"],
        json["postusername"],
        json["postusermood"],
        List<String>.from(json["postuserimage"].map((x) => x)),
        json["postusercaption"],
        json["postuseraddress"],
        json["postuserlocationcords"],
        DateTime.parse(json["posttime"]),
        json["postuserid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024id": id,
        "\u0024collection": collection,
        "\u0024permissions": permissions.toJson(),
        "postcategory": postcategory,
        "postusername": postusername,
        "postusermood": postusermood,
        "postuserimage": List<dynamic>.from(postuserimage.map((x) => x)),
        "postusercaption": postusercaption,
        "postuseraddress": postuseraddress,
        "postuserlocationcords": postuserlocationcords,
        "posttime": posttime.toIso8601String(),
        "postuserid": postuserid,
      };
}

class Permissions {
  Permissions(
    this.read,
    this.write,
  );

  List<String> read;
  List<String> write;

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
        List<String>.from(json["read"].map((x) => x)),
        List<String>.from(json["write"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "read": List<dynamic>.from(read.map((x) => x)),
        "write": List<dynamic>.from(write.map((x) => x)),
      };
}
