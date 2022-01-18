// To parse this JSON data, do
//
//     final unfollow = unfollowFromJson(jsonString);

import 'dart:convert';

Unfollow unfollowFromJson(String str) => Unfollow.fromJson(json.decode(str));

String unfollowToJson(Unfollow data) => json.encode(data.toJson());

class Unfollow {
    Unfollow({
        this.status,
        this.data,
        this.message,
    });

    int status;
    UnfollowData data;
    String message;

    factory Unfollow.fromJson(Map<String, dynamic> json) => Unfollow(
        status: json["status"],
        data: UnfollowData.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
    };
}

class UnfollowData {
    UnfollowData({
        this.channelId,
        this.title,
        this.channelUrl,
        this.channelDetails,
        this.status,
        this.isDeleted,
        this.id,
        this.userId,
        this.createdAt,
        this.updatedAt,
    });

    String channelId;
    String title;
    String channelUrl;
    String channelDetails;
    String status;
    bool isDeleted;
    String id;
    String userId;
    DateTime createdAt;
    DateTime updatedAt;

    factory UnfollowData.fromJson(Map<String, dynamic> json) => UnfollowData(
        channelId: json["channelId"],
        title: json["title"],
        channelUrl: json["channel_url"],
        channelDetails: json["channel_details"],
        status: json["status"],
        isDeleted: json["isDeleted"],
        id: json["_id"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "channelId": channelId,
        "title": title,
        "channel_url": channelUrl,
        "channel_details": channelDetails,
        "status": status,
        "isDeleted": isDeleted,
        "_id": id,
        "userId": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
