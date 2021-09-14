import 'dart:convert';

EventCategoryModel postFromJson(String str) =>
    EventCategoryModel.fromJson(json.decode(str));
String postToJson(EventCategoryModel data) => json.encode(data.toJson());

class EventCategoryModel {
  EventCategoryModel(
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
      this.eventAddress,
      this.eventDate,
      this.eventTime);
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
  String eventAddress;
  String eventDate;
  String eventTime;

  factory EventCategoryModel.fromJson(Map<String, dynamic> json) =>
      EventCategoryModel(
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
        json["eventAddress"],
        json["eventDate"],
        json["eventTime"],
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
        "eventAddress": eventAddress,
        "eventDate": eventDate,
        "eventTime": eventTime,
      };
}
