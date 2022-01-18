// To parse this JSON data, do
//
//     final followingList = followingListFromJson(jsonString);

import 'dart:convert';

FollowingList followingListFromJson(String str) => FollowingList.fromJson(json.decode(str));

String followingListToJson(FollowingList data) => json.encode(data.toJson());

class FollowingList {
    FollowingList({
        this.status,
        this.data,
        this.message,
    });

    int status;
    List<FollowingData> data;
    String message;

    factory FollowingList.fromJson(Map<String, dynamic> json) => FollowingList(
        status: json["status"],
        data: List<FollowingData>.from(json["data"].map((x) => FollowingData.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class FollowingData {
    FollowingData({
        this.id,
        this.channelId,
        this.title,
        this.channelUrl,
        this.channelDetails,
        this.status,
        this.isDeleted,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.userData,
    });

    String id;
    String channelId;
    String title;
    String channelUrl;
    String channelDetails;
    String status;
    bool isDeleted;
    String userId;
    DateTime createdAt;
    DateTime updatedAt;
    UserData userData;

    factory FollowingData.fromJson(Map<String, dynamic> json) => FollowingData(
        id: json["_id"],
        channelId: json["channelId"],
        title: json["title"],
        channelUrl: json["channel_url"],
        channelDetails: json["channel_details"],
        status: json["status"],
        isDeleted: json["isDeleted"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userData: UserData.fromJson(json["user_data"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "channelId": channelId,
        "title": title,
        "channel_url": channelUrl,
        "channel_details": channelDetails,
        "status": status,
        "isDeleted": isDeleted,
        "userId": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "user_data": userData.toJson(),
    };
}

class UserData {
    UserData({
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

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
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
