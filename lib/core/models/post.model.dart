import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));
String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post(
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
  String posttime;
  String postuserid;
  bool isVideo;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
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
