import 'dart:convert';

JobCategoryModel postFromJson(String str) =>
    JobCategoryModel.fromJson(json.decode(str));
String postToJson(JobCategoryModel data) => json.encode(data.toJson());

class JobCategoryModel {
  JobCategoryModel(
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
      this.isvideo,
      this.jobAddress,
      this.contractType,
      this.experienceLevel);
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
  String jobAddress;
  String contractType;
  String experienceLevel;

  factory JobCategoryModel.fromJson(Map<String, dynamic> json) =>
      JobCategoryModel(
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
        json["jobAddress"],
        json["contractType"],
        json["experienceLevel"],
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
        "jobAddress": jobAddress,
        "contractType": contractType,
        "experienceLevel": experienceLevel,
      };
}
