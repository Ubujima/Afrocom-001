import 'dart:convert';

SignedUser signedUserFromJson(String str) =>
    SignedUser.fromJson(json.decode(str));
String signedUserToJson(SignedUser data) => json.encode(data.toJson());

class SignedUser {
  String userid;
  String username;
  String useremail;
  bool isOAuth;
  String useraddress;
  String userphonenumber;
  String userbio;
  String userprofession;
  String? userimage;
  String? userDOB;
  String? usersex;
  String? userorigin;
  SignedUser(this.userid, this.username, this.useremail, this.isOAuth,
      this.useraddress, this.userphonenumber, this.userbio, this.userprofession,
      [this.userimage, this.userDOB, this.usersex, this.userorigin]);

  factory SignedUser.fromJson(Map<String, dynamic> json) => SignedUser(
      json["userid"],
      json["username"],
      json["useremail"],
      json["isOAuth"],
      json["useraddress"],
      json["userphonenumber"],
      json["userbio"],
      json["userprofession"],
      json["userimage"],
      json["userDOB"],
      json["usersex"],
      json["userorigin"]);

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "username": username,
        "useremail": useremail,
        "isOAuth": isOAuth,
        "useraddress": useraddress,
        "userphonenumber": userphonenumber,
        "userbio": userbio,
        "userprofession": userprofession,
        "userimage": userimage,
        "userDOB": userDOB,
        "usersex": usersex,
        "userorigin": userorigin,
      };
}
