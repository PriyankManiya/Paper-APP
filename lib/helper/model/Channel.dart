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
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
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
        nextPageUrl: json["nextPageUrl"],
        subCards: List<SubCard>.from(json["subCards"].map((x) => SubCard.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nextPageUrl": nextPageUrl,
        "subCards": List<dynamic>.from(subCards.map((x) => x.toJson())),
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
        provider: Provider.fromJson(json["provider"]),
    );

    Map<String, dynamic> toJson() => {
        "provider": provider.toJson(),
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
        id: json["id"],
        name: json["name"],
        logo: Logo.fromJson(json["logo"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo.toJson(),
    };
}

class Logo {
    Logo({
        this.url,
    });

    String url;

    factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}
