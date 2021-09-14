import 'dart:convert';

BlogCategoryModel postFromJson(String str) =>
    BlogCategoryModel.fromJson(json.decode(str));
String postToJson(BlogCategoryModel data) => json.encode(data.toJson());

class BlogCategoryModel {
  BlogCategoryModel(
      this.postcategory,
      this.postusername,
      this.postsubcategory,
      this.postasset,
      this.posttitle,
      this.postDescription,
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
  String postDescription;
  String postuseraddress;
  String postuserlocationcords;
  String posttime;
  String postuserid;
  bool isvideo;

  factory BlogCategoryModel.fromJson(Map<String, dynamic> json) =>
      BlogCategoryModel(
        json["postcategory"],
        json["postusername"],
        json["postsubcategory"],
        List<String>.from(json["postasset"].map((x) => x)),
        json["posttitle"],
        json["postDescription"],
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
        "postDescription": postDescription,
        "postuseraddress": postuseraddress,
        "postuserlocationcords": postuserlocationcords,
        "posttime": posttime,
        "postuserid": postuserid,
        "isvideo": isvideo,
      };
}
