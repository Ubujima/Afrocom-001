import 'dart:convert';

PlaceCategoryModel postFromJson(String str) =>
    PlaceCategoryModel.fromJson(json.decode(str));
String postToJson(PlaceCategoryModel data) => json.encode(data.toJson());

class PlaceCategoryModel {
  PlaceCategoryModel(
      this.postcategory,
      this.postusername,
      this.postsubcategory,
      this.postasset,
      this.posttitle,
      this.postDescription,
      this.placeaddress,
      this.postuseraddress,
      this.placeHours,
      this.placeWebsite,
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
  String placeaddress;
  String placeHours;
  String placeWebsite;
  String postuseraddress;
  String postuserlocationcords;
  String posttime;
  String postuserid;
  bool isvideo;

  factory PlaceCategoryModel.fromJson(Map<String, dynamic> json) =>
      PlaceCategoryModel(
        json["postcategory"],
        json["postusername"],
        json["postsubcategory"],
        List<String>.from(json["postasset"].map((x) => x)),
        json["posttitle"],
        json["postDescription"],
        json["placeaddress"],
        json["placeHours"],
        json["placeWebsite"],
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
        "placeaddress": placeaddress,
        "placeHours": placeHours,
        "placeWebsite": placeWebsite,
        "postuseraddress": postuseraddress,
        "postuserlocationcords": postuserlocationcords,
        "posttime": posttime,
        "postuserid": postuserid,
        "isvideo": isvideo,
      };
}
