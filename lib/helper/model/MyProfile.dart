// To parse this JSON data, do
//
//     final myProfile = myProfileFromJson(jsonString);

import 'dart:convert';

MyProfile myProfileFromJson(String str) => MyProfile.fromJson(json.decode(str));

String myProfileToJson(MyProfile data) => json.encode(data.toJson());

class MyProfile {
    MyProfile({
        this.status,
        this.data,
        this.message,
    });

    int status;
    Data data;
    String message;

    factory MyProfile.fromJson(Map<String, dynamic> json) => MyProfile(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
    };
}

class Data {
    Data({
        this.id,
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
        this.role,
        this.createdAt,
        this.updatedAt,
    });

    String id;
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
    String role;
    DateTime createdAt;
    DateTime updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        fullName: json["full_name"],
        email: json["email"],
        password: json["password"],
        otp: json["otp"],
        socialId: json["social_id"],
        registerType: json["register_type"],
        deviceToken: json["deviceToken"],
        deviceType: json["deviceType"],
        profilePic: json["profile_pic"],
        isDeleted: json["isDeleted"],
        isActive: json["isActive"],
        role: json["role"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "full_name": fullName,
        "email": email,
        "password": password,
        "otp": otp,
        "social_id": socialId,
        "register_type": registerType,
        "deviceToken": deviceToken,
        "deviceType": deviceType,
        "profile_pic": profilePic,
        "isDeleted": isDeleted,
        "isActive": isActive,
        "role": role,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
