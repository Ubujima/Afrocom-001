import 'dart:convert';

SignedUser signedUserFromJson(String str) =>
    SignedUser.fromJson(json.decode(str));

String signedUserToJson(SignedUser data) => json.encode(data.toJson());

class SignedUser {
  String username;
  String useremail;
  String userfullname;
  String? userdob;
  SignedUser(this.username, this.useremail, this.userfullname, [this.userdob]);

  factory SignedUser.fromJson(Map<String, dynamic> json) => SignedUser(
        json["username"],
        json["useremail"],
        json["userfullname"],
        json["userdob"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "useremail": useremail,
        "userfullname": userfullname,
        "userdob": userdob,
      };
}
