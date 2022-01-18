// To parse this JSON data, do
//
//     final follow = followFromJson(jsonString);

import 'dart:convert';

Follow followFromJson(String str) => Follow.fromJson(json.decode(str));

String followToJson(Follow data) => json.encode(data.toJson());

class Follow {
    Follow({
        this.status,
        this.data,
        this.message,
    });

    int status;
    Data data;
    String message;

    factory Follow.fromJson(Map<String, dynamic> json) => Follow(
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

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
