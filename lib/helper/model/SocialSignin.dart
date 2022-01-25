// To parse this JSON data, do
//
//     final socialSignin = socialSigninFromJson(jsonString);

import 'dart:convert';

SocialSignin socialSigninFromJson(String str) => SocialSignin.fromJson(json.decode(str));

String socialSigninToJson(SocialSignin data) => json.encode(data.toJson());

class SocialSignin {
    SocialSignin({
        this.status,
        this.token,
        this.data,
        this.message,
    });

    int status;
    String token;
    Data data;
    String message;

    factory SocialSignin.fromJson(Map<String, dynamic> json) => SocialSignin(
        status: json["status"] == null ? null : json["status"],
        token: json["token"] == null ? null :  json["token"],
        data: json["data"] == null ? null :  Data.fromJson(json["data"]),
        message: json["message"] == null ? null :  json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "token": token == null ? null : token,
        "data": data == null ? null : data.toJson(),
        "message": message == null ? null : message,
    };
}

class Data {
    Data({
        this.fullName,
        this.email,
        this.password,
        this.otp,
        this.socialId,
        this.registerType,
        this.deviceToken,
        this.deviceType,
        this.profilePic,
        this.isDeleted,
        this.isActive,
        this.id,
        this.createdAt,
        this.updatedAt,
    });

    String fullName;
    String email;
    String password;
    String otp;
    String socialId;
    String registerType;
    String deviceToken;
    String deviceType;
    String profilePic;
    bool isDeleted;
    bool isActive;
    String id;
    DateTime createdAt;
    DateTime updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        fullName: json["full_name"] == null ? null : json["full_name"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        otp: json["otp"] == null ? null : json["otp"],
        socialId: json["social_id"] == null ? null : json["social_id"],
        registerType: json["register_type"] == null ? null : json["register_type"],
        deviceToken: json["deviceToken"] == null ? null : json["deviceToken"],
        deviceType: json["deviceType"] == null ? null : json["deviceType"],
        profilePic: json["profile_pic"] == null ? null : json["profile_pic"],
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        id: json["_id"] == null ? null : json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName == null ? null : fullName,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "otp": otp == null ? null : otp,
        "social_id": socialId == null ? null : socialId,
        "register_type": registerType == null ? null : registerType,
        "deviceToken": deviceToken == null ? null : deviceToken,
        "deviceType": deviceType == null ? null : deviceType,
        "profile_pic": profilePic == null ? null : profilePic,
        "isDeleted": isDeleted == null ? null : isDeleted,
        "isActive": isActive == null ? null : isActive,
        "_id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
