import 'dart:convert';

import 'package:latlong2/latlong.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post(
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
  String postcategory;
  String postusername;
  String postusermood;
  List<String> postuserimage;
  String postusercaption;
  String postuseraddress;
  String postuserlocationcords;
  String posttime;
  String postuserid;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        json["postcategory"],
        json["postusername"],
        json["postusermood"],
        List<String>.from(json["postuserimage"].map((x) => x)),
        json["postusercaption"],
        json["postuseraddress"],
        json["postuserlocationcords"],
        json["posttime"],
        json["postuserid"],
      );

  Map<String, dynamic> toJson() => {
        "postcategory": postcategory,
        "postusername": postusername,
        "postusermood": postusermood,
        "postuserimage": List<dynamic>.from(postuserimage.map((x) => x)),
        "postusercaption": postusercaption,
        "postuseraddress": postuseraddress,
        "postuserlocationcords": postuserlocationcords,
        "posttime": posttime,
        "postuserid": postuserid,
      };
}
