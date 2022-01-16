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
        status: json["status"],
        data: Data.fromJson(json["data"]),
        token: json["token"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "token": token,
        "message": message,
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
        id: json["_id"],
        role: json["role"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
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
        "_id": id,
        "role": role,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
