import 'dart:convert';

FacebookUser facebookUserFromJson(String str) =>
    FacebookUser.fromJson(json.decode(str));

String facebookUserToJson(FacebookUser data) => json.encode(data.toJson());

class FacebookUser {
  FacebookUser(
    this.name,
    this.email,
    this.picture,
    this.id,
  );

  String name;
  String email;
  Picture picture;
  String id;

  factory FacebookUser.fromJson(Map<String, dynamic> json) => FacebookUser(
        json["name"],
        json["email"],
        Picture.fromJson(json["picture"]),
        json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "picture": picture.toJson(),
        "id": id,
      };
}

class Picture {
  Picture(
    this.data,
  );

  Data data;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data(
    this.height,
    this.url,
    this.width,
  );

  int height;
  String url;
  int width;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        json["height"],
        json["url"],
        json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
      };
}
