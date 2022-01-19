// To parse this JSON data, do
//
//     final articleList = articleListFromJson(jsonString);

import 'dart:convert';

ArticleList articleListFromJson(String str) => ArticleList.fromJson(json.decode(str));

String articleListToJson(ArticleList data) => json.encode(data.toJson());

class ArticleList {
    ArticleList({
        this.status,
        this.data,
        this.message,
    });

    int status;
    List<ArticleData> data;
    String message;

    factory ArticleList.fromJson(Map<String, dynamic> json) => ArticleList(
        status: json["status"]==null?null:json["status"],
        data: json["data"]==null?null:List<ArticleData>.from(json["data"].map((x) => ArticleData.fromJson(x))),
        message: json["message"]==null?null:json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status==null?null:status,
        "data": data==null?null:List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message==null?null:message,
    };
}

class ArticleData {
    ArticleData({
        this.id,
        this.articleId,
        this.categoryId,
        this.articleDetails,
        this.articleUrl,
        this.status,
        this.isDeleted,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.userData,
    });

    String id;
    String articleId;
    String categoryId;
    String articleDetails;
    String articleUrl;
    String status;
    bool isDeleted;
    String userId;
    DateTime createdAt;
    DateTime updatedAt;
    UserData userData;

    factory ArticleData.fromJson(Map<String, dynamic> json) => ArticleData(
        id:json["_id"] ==null ? null :  json["_id"],
        articleId: json["articleId"] ==null ? null : json["articleId"],
        categoryId: json["categoryId"] ==null ? null : json["categoryId"],
        articleDetails: json["articleDetails"] ==null ? null : json["articleDetails"],
        articleUrl: json["article_url"] ==null ? null : json["article_url"],
        status: json["status"] ==null ? null : json["status"],
        isDeleted: json["isDeleted"] ==null ? null : json["isDeleted"],
        userId: json["userId"] ==null ? null : json["userId"],
        createdAt: json["createdAt"] ==null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] ==null ? null : DateTime.parse(json["updatedAt"]),
        userData: json["user_data"] ==null ? null : UserData.fromJson(json["user_data"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "articleId": articleId == null ? null : articleId,
        "categoryId": categoryId == null ? null : categoryId,
        "articleDetails": articleDetails == null ? null : articleDetails,
        "article_url": articleUrl == null ? null : articleUrl,
        "status": status == null ? null : status,
        "isDeleted": isDeleted == null ? null : isDeleted,
        "userId": userId == null ? null : userId,
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
    DateTime createdAt;
    DateTime updatedAt;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["_id"] == null ? null : json["_id"],
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
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
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
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
