import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile(
    this.id,
    this.collection,
    this.permissions,
    this.userid,
    this.username,
    this.useremail,
    this.isOAuth,
    this.useraddress,
    this.userphonenumber,
    this.userbio,
    this.userimage,
    this.userDob,
    this.usersex,
    this.userorigin,
  );

  String id;
  String collection;
  Permissions permissions;
  String userid;
  String username;
  String useremail;
  bool isOAuth;
  String useraddress;
  String userphonenumber;
  String userbio;
  String userimage;
  DateTime userDob;
  String usersex;
  String userorigin;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        json["\u0024id"],
        json["\u0024collection"],
        Permissions.fromJson(json["\u0024permissions"]),
        json["userid"],
        json["username"],
        json["useremail"],
        json["isOAuth"],
        json["useraddress"],
        json["userphonenumber"],
        json["userbio"],
        json["userimage"],
        DateTime.parse(json["userDOB"]),
        json["usersex"],
        json["userorigin"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024id": id,
        "\u0024collection": collection,
        "\u0024permissions": permissions.toJson(),
        "userid": userid,
        "username": username,
        "useremail": useremail,
        "isOAuth": isOAuth,
        "useraddress": useraddress,
        "userphonenumber": userphonenumber,
        "userbio": userbio,
        "userimage": userimage,
        "userDOB":
            "${userDob.year.toString().padLeft(4, '0')}-${userDob.month.toString().padLeft(2, '0')}-${userDob.day.toString().padLeft(2, '0')}",
        "usersex": usersex,
        "userorigin": userorigin,
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
