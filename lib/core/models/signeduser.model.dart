import 'dart:convert';

SignedUser signedUserFromJson(String str) =>
    SignedUser.fromJson(json.decode(str));
String signedUserToJson(SignedUser data) => json.encode(data.toJson());

class SignedUser {
  String username;
  String useremail;
  String userfirstname;
  String userlastname;
  bool? isOAuth;
  String? userphonenumber;
  String? userimage;
  String? userDOB;
  String? usersex;
  String? userorigin;
  SignedUser(
      this.username, this.useremail, this.userfirstname, this.userlastname,
      [this.isOAuth,
      this.userphonenumber,
      this.userimage,
      this.userDOB,
      this.usersex,
      this.userorigin]);

  factory SignedUser.fromJson(Map<String, dynamic> json) => SignedUser(
      json["username"],
      json["useremail"],
      json["userfirstname"],
      json["userlastname"],
      json["isOAuth"],
      json["userphonenumber"],
      json["userimage"],
      json["userDOB"],
      json["usersex"],
      json["userorigin"]);

  Map<String, dynamic> toJson() => {
        "username": username,
        "useremail": useremail,
        "userfirstname": userfirstname,
        "userlastname": userlastname,
        "isOAuth": isOAuth,
        "userphonenumber": userphonenumber,
        "userimage": userimage,
        "userDOB": userDOB,
        "usersex": usersex,
        "userorigin": userorigin,
      };
}
