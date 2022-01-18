// To parse this JSON data, do
//
//     final channel = channelFromJson(jsonString);

import 'dart:convert';

Channel channelFromJson(String str) => Channel.fromJson(json.decode(str));

String channelToJson(Channel data) => json.encode(data.toJson());

class Channel {
    Channel({
        this.value,
    });

    List<Value> value;

    factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        value: json["value"] == null ? null :List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "value":value==null?null: List<dynamic>.from(value.map((x) => x.toJson())),
    };
}

class Value {
    Value({
        this.nextPageUrl,
        this.subCards,
    });

    String nextPageUrl;
    List<SubCard> subCards;

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        nextPageUrl:json["nextPageUrl"] == null ? null : json["nextPageUrl"],
        subCards:json["subCards"] == null ? null : List<SubCard>.from(json["subCards"].map((x) => SubCard.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nextPageUrl": nextPageUrl,
        "subCards":subCards == null ? null : List<dynamic>.from(subCards.map((x) => x.toJson())),
    };
}

class SubCard {
    SubCard({
        this.provider,
        this.isFollow,
        this.followingId
    });

    Provider provider;
    bool isFollow;
    String followingId;

    factory SubCard.fromJson(Map<String, dynamic> json) => SubCard(
        provider: json["provider"]==null?null :Provider.fromJson(json["provider"]),
        isFollow : json["isFollow"] == null ? false : json["isFollow"]
    );

    Map<String, dynamic> toJson() => {
        "provider":provider == null? null : provider.toJson(),
        "isFollow":isFollow == null? false : isFollow
    };
}

class Provider {
    Provider({
        this.id,
        this.name,
        this.logo,
    });

    String id;
    String name;
    Logo logo;

    factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        logo: json["logo"] == null ? null : Logo.fromJson(json["logo"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null :id,
        "name":name==null ? null : name,
        "logo": logo==null ? null : logo.toJson(),
    };
}

class Logo {
    Logo({
        this.url,
    });

    String url;

    factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        url: json["url"] ==null ? null: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url==null ? null : url,
    };
}
