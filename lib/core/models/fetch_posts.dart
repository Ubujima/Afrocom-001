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
  List<FetchedPostData> documents;

  factory FetchPosts.fromJson(Map<String, dynamic> json) => FetchPosts(
        json["sum"],
        List<FetchedPostData>.from(
            json["documents"].map((x) => FetchedPostData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sum": sum,
        "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
      };
}

class FetchedPostData {
  FetchedPostData(
      this.postcategory,
      this.postusername,
      this.postusermood,
      this.postasset,
      this.postusercaption,
      this.postuseraddress,
      this.postuserlocationcords,
      this.posttime,
      this.postuserid,
      this.isVideo);
  String postcategory;
  String postusername;
  String postusermood;
  List<String> postasset;
  String postusercaption;
  String postuseraddress;
  String postuserlocationcords;
  dynamic posttime;
  String postuserid;
  bool isVideo;

  factory FetchedPostData.fromJson(Map<String, dynamic> json) =>
      FetchedPostData(
        json["postcategory"],
        json["postusername"],
        json["postusermood"],
        List<String>.from(json["postasset"].map((x) => x)),
        json["postusercaption"],
        json["postuseraddress"],
        json["postuserlocationcords"],
        json["posttime"],
        json["postuserid"],
        json["isVideo"],
      );

  Map<String, dynamic> toJson() => {
        "postcategory": postcategory,
        "postusername": postusername,
        "postusermood": postusermood,
        "postasset": List<dynamic>.from(postasset.map((x) => x)),
        "postusercaption": postusercaption,
        "postuseraddress": postuseraddress,
        "postuserlocationcords": postuserlocationcords,
        "posttime": posttime,
        "postuserid": postuserid,
        "isVideo": isVideo,
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
