import 'dart:convert';

CampaignAndProjectCategoryModel postFromJson(String str) =>
    CampaignAndProjectCategoryModel.fromJson(json.decode(str));
String postToJson(CampaignAndProjectCategoryModel data) =>
    json.encode(data.toJson());

class CampaignAndProjectCategoryModel {
  CampaignAndProjectCategoryModel(
      this.postcategory,
      this.postusername,
      this.postsubcategory,
      this.postasset,
      this.posttitle,
      this.postDescription,
      this.requiredFunds,
      this.raisedFunds,
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
  String requiredFunds;
  String raisedFunds;
  String postuseraddress;
  String postuserlocationcords;
  String posttime;
  String postuserid;
  bool isvideo;

  factory CampaignAndProjectCategoryModel.fromJson(Map<String, dynamic> json) =>
      CampaignAndProjectCategoryModel(
        json["postcategory"],
        json["postusername"],
        json["postsubcategory"],
        List<String>.from(json["postasset"].map((x) => x)),
        json["posttitle"],
        json["postDescription"],
        json["requiredFunds"],
        json["raisedFunds"],
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
        "requiredFunds": requiredFunds,
        "raisedFunds": raisedFunds,
        "postuseraddress": postuseraddress,
        "postuserlocationcords": postuserlocationcords,
        "posttime": posttime,
        "postuserid": postuserid,
        "isvideo": isvideo,
      };
}
