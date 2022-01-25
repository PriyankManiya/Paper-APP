// To parse this JSON data, do
//
//     final signIn = signInFromJson(jsonString);

import 'dart:convert';


SignIn signInFromJson(String str) => SignIn.fromJson(json.decode(str));

String signInToJson(SignIn data) => json.encode(data.toJson());

class SignIn {
    SignIn({
        this.status,
        this.data,
        this.token,
        this.message,
    });

    int status;
    Data data;
    String token;
    String message;

    factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        token: json["token"] == null ? null : json["token"],
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": status == null ? null : data.toJson(),
        "token": status == null ? null : token,
        "message": status == null ? null : message,
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
        this.role,
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
    String role;
    DateTime createdAt;
    DateTime updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        fullName: json["full_name"] == null ? null : json["full_name"],
        email: json["email"] == null ? null :  json["email"],
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
        role: json["role"] == null ? null : json["role"],
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
        "role": role == null ? null : role,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
