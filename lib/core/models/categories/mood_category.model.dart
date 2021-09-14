import 'dart:convert';

MoodCategoryModel postFromJson(String str) =>
    MoodCategoryModel.fromJson(json.decode(str));
String postToJson(MoodCategoryModel data) => json.encode(data.toJson());

class MoodCategoryModel {
  MoodCategoryModel(
      this.postcategory,
      this.postusername,
      this.postsubcategory,
      this.postasset,
      this.posttitle,
      this.postuseraddress,
      this.postuserlocationcords,
      this.posttime,
      this.postuserid,
      this.isvideo);
  String postcategory;
  String postusername;
  String postsubcategory;
  List<String> postasset;
  String posttitle;
  String postuseraddress;
  String postuserlocationcords;
  String posttime;
  String postuserid;
  bool isvideo;

  factory MoodCategoryModel.fromJson(Map<String, dynamic> json) =>
      MoodCategoryModel(
        json["postcategory"],
        json["postusername"],
        json["postsubcategory"],
        List<String>.from(json["postasset"].map((x) => x)),
        json["posttitle"],
        json["postuseraddress"],
        json["postuserlocationcords"],
        json["posttime"],
        json["postuserid"],
        json["isvideo"],
      );

  Map<String, dynamic> toJson() => {
        "postcategory": postcategory,
        "postusername": postusername,
        "postsubcategory": postsubcategory,
        "postasset": List<dynamic>.from(postasset.map((x) => x)),
        "posttitle": posttitle,
        "postuseraddress": postuseraddress,
        "postuserlocationcords": postuserlocationcords,
        "posttime": posttime,
        "postuserid": postuserid,
        "isvideo": isvideo,
      };
}