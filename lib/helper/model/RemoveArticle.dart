// To parse this JSON data, do
//
//     final removeArticle = removeArticleFromJson(jsonString);

import 'dart:convert';

RemoveArticle removeArticleFromJson(String str) => RemoveArticle.fromJson(json.decode(str));

String removeArticleToJson(RemoveArticle data) => json.encode(data.toJson());

class RemoveArticle {
    RemoveArticle({
        this.status,
        this.data,
        this.message,
    });

    int status;
    Data data;
    String message;

    factory RemoveArticle.fromJson(Map<String, dynamic> json) => RemoveArticle(
        status:json["status"] == null ? null : json["status"],
        data:json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"] == null ? null :json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status":status ==null ? null : status,
        "data":data ==null ? null : data.toJson(),
        "message":message ==null ? null : message,
    };
}

class Data {
    Data({
        this.articleId,
        this.categoryId,
        this.articleDetails,
        this.articleUrl,
        this.status,
        this.isDeleted,
        this.id,
        this.userId,
        this.createdAt,
        this.updatedAt,
    });

    String articleId;
    String categoryId;
    String articleDetails;
    String articleUrl;
    String status;
    bool isDeleted;
    String id;
    String userId;
    DateTime createdAt;
    DateTime updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        articleId: json["articleId"] == null ? null : json["articleId"],
        categoryId:json["categoryId"] == null ? null :  json["categoryId"],
        articleDetails: json["articleDetails"] == null ? null : json["articleDetails"],
        articleUrl: json["article_url"] == null ? null : json["article_url"],
        status: json["status"] == null ? null : json["status"],
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        id: json["articl_ideId"] == null ? null : json["_id"],
        userId:json["userId"] == null ? null :  json["userId"],
        createdAt:json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt:json["updatedAt"] == null ? null :  DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "articleId":articleId == null ? null : articleId,
        "categoryId":categoryId == null ? null : categoryId,
        "articleDetails": articleDetails == null ? null :articleDetails,
        "article_url":articleUrl == null ? null : articleUrl,
        "status": status == null ? null :status,
        "isDeleted":isDeleted == null ? null : isDeleted,
        "_id": id == null ? null :id,
        "userId":userId == null ? null : userId,
        "createdAt": createdAt == null ? null :createdAt.toIso8601String(),
        "updatedAt":updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
