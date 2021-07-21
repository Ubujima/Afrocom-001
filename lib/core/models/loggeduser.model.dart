import 'dart:convert';

LoggedUser loggedUserFromMap(String str) =>
    LoggedUser.fromMap(json.decode(str));

String loggedUserToMap(LoggedUser data) => json.encode(data.toMap());

class LoggedUser {
  LoggedUser(
    this.id,
    this.userId,
    this.expire,
    this.provider,
    this.providerUid,
    this.providerToken,
    this.ip,
    this.osCode,
    this.osName,
    this.osVersion,
    this.clientType,
    this.clientCode,
    this.clientName,
    this.clientVersion,
    this.clientEngine,
    this.clientEngineVersion,
    this.deviceName,
    this.deviceBrand,
    this.deviceModel,
    this.countryCode,
    this.countryName,
    this.current,
  );

  String id;
  String userId;
  int expire;
  String provider;
  String providerUid;
  String providerToken;
  String ip;
  String osCode;
  String osName;
  String osVersion;
  String clientType;
  String clientCode;
  String clientName;
  String clientVersion;
  String clientEngine;
  String clientEngineVersion;
  String deviceName;
  String deviceBrand;
  String deviceModel;
  String countryCode;
  String countryName;
  bool current;

  factory LoggedUser.fromMap(Map<String, dynamic> json) => LoggedUser(
        json["id"],
        json["userId"],
        json["expire"],
        json["provider"],
        json["providerUid"],
        json["providerToken"],
        json["ip"],
        json["osCode"],
        json["osName"],
        json["osVersion"],
        json["clientType"],
        json["clientCode"],
        json["clientName"],
        json["clientVersion"],
        json["clientEngine"],
        json["clientEngineVersion"],
        json["deviceName"],
        json["deviceBrand"],
        json["deviceModel"],
        json["countryCode"],
        json["countryName"],
        json["current"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "expire": expire,
        "provider": provider,
        "providerUid": providerUid,
        "providerToken": providerToken,
        "ip": ip,
        "osCode": osCode,
        "osName": osName,
        "osVersion": osVersion,
        "clientType": clientType,
        "clientCode": clientCode,
        "clientName": clientName,
        "clientVersion": clientVersion,
        "clientEngine": clientEngine,
        "clientEngineVersion": clientEngineVersion,
        "deviceName": deviceName,
        "deviceBrand": deviceBrand,
        "deviceModel": deviceModel,
        "countryCode": countryCode,
        "countryName": countryName,
        "current": current,
      };
}
