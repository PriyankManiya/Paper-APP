// To parse this JSON data, do
//
//     final likeList = likeListFromJson(jsonString);

import 'dart:convert';

LikeList likeListFromJson(String str) => LikeList.fromJson(json.decode(str));

String likeListToJson(LikeList data) => json.encode(data.toJson());

class LikeList {
    LikeList({
        this.status,
        this.data,
        this.message,
    });

    int status;
    List<LikeListData> data;
    String message;

    factory LikeList.fromJson(Map<String, dynamic> json) => LikeList(
        status:json["status"] ==null ?null : json["status"],
        data:json["data"] ==null ?null : List<LikeListData>.from(json["data"].map((x) => LikeListData.fromJson(x))),
        message: json["message"] ==null ?null :json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null: status,
        "data": data == null ? null:List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message == null ? null:message,
    };
}

class LikeListData {
    LikeListData({
        this.id,
        this.articleId,
        this.userId,
        this.status,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.userData,
    });

    String id;
    String articleId;
    String userId;
    String status;
    bool isDeleted;
    DateTime createdAt;
    DateTime updatedAt;
    UserData userData;

    factory LikeListData.fromJson(Map<String, dynamic> json) => LikeListData(
        id: json["_id"] == null ? null :json["_id"],
        articleId:json["articleId"] == null ? null : json["articleId"],
        userId:json["user_id"] == null ? null : json["user_id"],
        status:json["status"] == null ? null : json["status"],
        isDeleted:json["isDeleted"] == null ? null : json["isDeleted"],
        createdAt:json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt:json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        userData: json["user_data"] == null ? null :UserData.fromJson(json["user_data"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "articleId":articleId == null ? null :  articleId,
        "user_id":userId == null ? null :  userId,
        "status": status == null ? null : status,
        "isDeleted": isDeleted == null ? null : isDeleted,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "user_data": userData == null ? null : userData.toJson(),
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
        id: json["_id"] == null ? null : json["_id"],
        fullName:json["full_name"] == null ? null :  json["full_name"],
        email:json["email"] == null ? null :  json["email"],
        password:json["password"] == null ? null :  json["password"],
        otp:json["otp"] == null ? null :  json["otp"],
        socialId:json["social_id"] == null ? null :  json["social_id"],
        registerType:json["register_type"] == null ? null :  json["register_type"],
        deviceToken:json["deviceToken"] == null ? null :  json["deviceToken"],
        deviceType:json["deviceType"] == null ? null :  json["deviceType"],
        profilePic:json["profile_pic"] == null ? null :  json["profile_pic"],
        isDeleted:json["isDeleted"] == null ? null :  json["isDeleted"],
        isActive:json["isActive"] == null ? null :  json["isActive"],
        role:json["role"] == null ? null :  json["role"],
        createdAt:json["createdAt"] == null ? null :  DateTime.parse(json["createdAt"]),
        updatedAt:json["updatedAt"] == null ? null :  DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id ==null ? null : id,
        "full_name":fullName ==null ? null :  fullName,
        "email":email ==null ? null :  email,
        "password":password ==null ? null :  password,
        "otp":otp ==null ? null : otp,
        "social_id": socialId ==null ? null : socialId,
        "register_type":registerType ==null ? null :  registerType,
        "deviceToken":deviceToken ==null ? null :  deviceToken,
        "deviceType":deviceType ==null ? null :  deviceType,
        "profile_pic":profilePic ==null ? null :  profilePic,
        "isDeleted":isDeleted ==null ? null :  isDeleted,
        "isActive":isActive ==null ? null :  isActive,
        "role":role ==null ? null :  role,
        "createdAt": createdAt ==null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt ==null ? null : updatedAt.toIso8601String(),
    };
}
