// To parse this JSON data, do
//
//     final like = likeFromJson(jsonString);

import 'dart:convert';

Like likeFromJson(String str) => Like.fromJson(json.decode(str));

String likeToJson(Like data) => json.encode(data.toJson());

class Like {
    Like({
        this.status,
        this.data,
        this.message,
    });

    int status;
    LikeData data;
    String message;

    factory Like.fromJson(Map<String, dynamic> json) => Like(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null :  LikeData.fromJson(json["data"]),
        message: json["message"] == null ? null :  json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : data.toJson(),
        "message": message == null ? null : message,
    };
}

class LikeData {
    LikeData({
        this.articleId,
        this.userId,
        this.status,
        this.isDeleted,
        this.id,
        this.createdAt,
        this.updatedAt,
    });

    String articleId;
    String userId;
    String status;
    bool isDeleted;
    String id;
    DateTime createdAt;
    DateTime updatedAt;

    factory LikeData.fromJson(Map<String, dynamic> json) => LikeData(
        articleId: json["articleId"] == null ? null :json["articleId"],
        userId: json["user_id"] == null ? null : json["user_id"],
        status: json["status"] == null ? null :json["status"],
        isDeleted: json["isDeleted"] == null ? null :json["isDeleted"],
        id: json["_id"] == null ? null :json["_id"],
        createdAt: json["createdAt"] == null ? null :DateTime.parse(json["createdAt"]),
        updatedAt:json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "articleId": articleId == null ? null : articleId,
        "user_id": userId == null ? null : userId,
        "status": status == null ? null :  status,
        "isDeleted": isDeleted == null ? null :  isDeleted,
        "_id": id == null ? null :  id,
        "createdAt": createdAt == null ? null :  createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null :  updatedAt.toIso8601String(),
    };
}
