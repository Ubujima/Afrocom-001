import 'dart:convert';

ProfileUser profileUserFromJson(String str) =>
    ProfileUser.fromJson(json.decode(str));

String profileUserToJson(ProfileUser data) => json.encode(data.toJson());

class ProfileUser {
  ProfileUser(
    this.id,
    this.collection,
    this.permissions,
    this.username,
    this.useremail,
    this.userfirstname,
    this.userlastname,
    this.userDob,
    this.usersex,
    this.userorigin,
  );

  String id;
  String collection;
  Permissions permissions;
  String username;
  String useremail;
  String userfirstname;
  String userlastname;
  DateTime userDob;
  String usersex;
  String userorigin;

  factory ProfileUser.fromJson(Map<String, dynamic> json) => ProfileUser(
        json["\u0024id"],
        json["\u0024collection"],
        Permissions.fromJson(json["\u0024permissions"]),
        json["username"],
        json["useremail"],
        json["userfirstname"],
        json["userlastname"],
        DateTime.parse(json["userDOB"]),
        json["usersex"],
        json["userorigin"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024id": id,
        "\u0024collection": collection,
        "\u0024permissions": permissions.toJson(),
        "username": username,
        "useremail": useremail,
        "userfirstname": userfirstname,
        "userlastname": userlastname,
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
