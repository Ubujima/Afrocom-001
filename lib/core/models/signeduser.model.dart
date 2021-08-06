import 'dart:convert';

SignedUser signedUserFromJson(String str) =>
    SignedUser.fromJson(json.decode(str));
String signedUserToJson(SignedUser data) => json.encode(data.toJson());

class SignedUser {
  String username;
  String useremail;
  String userfirstname;
  String userlastname;
  String? userDOB;
  String? usersex;
  String? userorigin;
  SignedUser(
      this.username, this.useremail, this.userfirstname, this.userlastname,
      [this.userDOB, this.usersex, this.userorigin]);

  factory SignedUser.fromJson(Map<String, dynamic> json) => SignedUser(
      json["username"],
      json["useremail"],
      json["userfirstname"],
      json["userlastname"],
      json["userDOB"],
      json["usersex"],
      json["userorigin"]);

  Map<String, dynamic> toJson() => {
        "username": username,
        "useremail": useremail,
        "userfirstname": userfirstname,
        "userlastname": userlastname,
        "userDOB": userDOB,
        "usersex": usersex,
        "userorigin": userorigin,
      };
}
