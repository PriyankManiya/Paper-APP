// To parse this JSON data, do
//
//     final newsdata = newsdataFromJson(jsonString);

import 'dart:convert';

Newsdata newsModel(String str) => Newsdata.fromJson(json.decode(str));

class Newsdata {
    Newsdata({
        this.odataContext,
        this.value,
    });

    String odataContext;
    List<Value> value;

    factory Newsdata.fromJson(Map<String, dynamic> json) => Newsdata(
        odataContext: json["@odata.context"],
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "@odata.context": odataContext,
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
    };
}

class Value {
    Value({
        this.nextPageUrl,
        this.subCards,
        this.metadata,
        this.title,
        this.deleted,
        this.id,
    });

    String nextPageUrl;
    List<SubCard> subCards;
    Metadata metadata;
    String title;
    bool deleted;
    String id;

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        nextPageUrl: json["nextPageUrl"],
        subCards: List<SubCard>.from(json["subCards"].map((x) => SubCard.fromJson(x))),
        metadata: Metadata.fromJson(json["metadata"]),
        title: json["title"],
        deleted: json["deleted"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "nextPageUrl": nextPageUrl,
        "subCards": List<dynamic>.from(subCards.map((x) => x.toJson())),
        "metadata": metadata.toJson(),
        "title": title,
        "deleted": deleted,
        "id": id,
    };
}

class Metadata {
    Metadata({
        this.aAarac57EnUs,
        this.entertainment,
    });

    List<AAarac57EnUs> aAarac57EnUs;
    List<Entertainment> entertainment;

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        aAarac57EnUs: List<AAarac57EnUs>.from(json["A_AARAC57_en-us"].map((x) => AAarac57EnUs.fromJson(x))),
        entertainment: List<Entertainment>.from(json["Entertainment"].map((x) => Entertainment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "A_AARAC57_en-us": List<dynamic>.from(aAarac57EnUs.map((x) => x.toJson())),
        "Entertainment": List<dynamic>.from(entertainment.map((x) => x.toJson())),
    };
}

class AAarac57EnUs {
    AAarac57EnUs({
        this.type,
        this.feedName,
        this.feedId,
        this.kicker,
        this.source,
    });

    String type;
    String feedName;
    String feedId;
    List<Kicker> kicker;
    String source;

    factory AAarac57EnUs.fromJson(Map<String, dynamic> json) => AAarac57EnUs(
        type: json["\u0024type"],
        feedName: json["feedName"],
        feedId: json["feedId"],
        kicker: List<Kicker>.from(json["kicker"].map((x) => Kicker.fromJson(x))),
        source: json["source"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024type": type,
        "feedName": feedName,
        "feedId": feedId,
        "kicker": List<dynamic>.from(kicker.map((x) => x.toJson())),
        "source": source,
    };
}

class Kicker {
    Kicker({
        this.feedName,
        this.id,
    });

    String feedName;
    String id;

    factory Kicker.fromJson(Map<String, dynamic> json) => Kicker(
        feedName: json["feedName"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "feedName": feedName,
        "id": id,
    };
}

class Entertainment {
    Entertainment({
        this.type,
        this.infoPaneCount,
        this.sovTargeting,
    });

    String type;
    int infoPaneCount;
    SovTargeting sovTargeting;

    factory Entertainment.fromJson(Map<String, dynamic> json) => Entertainment(
        type: json["\u0024type"],
        infoPaneCount: json["infoPaneCount"],
        sovTargeting: SovTargeting.fromJson(json["sovTargeting"]),
    );

    Map<String, dynamic> toJson() => {
        "\u0024type": type,
        "infoPaneCount": infoPaneCount,
        "sovTargeting": sovTargeting.toJson(),
    };
}

class SovTargeting {
    SovTargeting();

    factory SovTargeting.fromJson(Map<String, dynamic> json) => SovTargeting(
    );

    Map<String, dynamic> toJson() => {
    };
}

class SubCard {
    SubCard({
        this.type,
        this.sourceId,
        this.cmsId,
        this.publishedDateTime,
        this.provider,
        this.images,
        this.title,
        this.subCardType,
        this.url,
        this.deleted,
        this.id,
    });

    String type;
    String sourceId;
    String cmsId;
    DateTime publishedDateTime;
    Provider provider;
    List<Imagee> images;
    String title;
    String subCardType;
    String url;
    bool deleted;
    String id;

    factory SubCard.fromJson(Map<String, dynamic> json) => SubCard(
        type: json["\u0024type"],
        sourceId: json["sourceId"],
        cmsId: json["cmsId"],
        publishedDateTime: DateTime.parse(json["publishedDateTime"]),
        provider: Provider.fromJson(json["provider"]),
        images: List<Imagee>.from(json["images"].map((x) => Imagee.fromJson(x))),
        title: json["title"],
        subCardType: json["type"],
        url: json["url"],
        deleted: json["deleted"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024type": type,
        "sourceId": sourceId,
        "cmsId": cmsId,
        "publishedDateTime": publishedDateTime.toIso8601String(),
        "provider": provider.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "title": title,
        "type": subCardType,
        "url": url,
        "deleted": deleted,
        "id": id,
    };
}

class Imagee {
    Imagee({
        this.width,
        this.height,
        this.quality,
        this.url,
        this.attribution,
        this.title,
        this.caption,
        this.focalRegion,
        this.source,
    });

    int width;
    int height;
    int quality;
    String url;
    String attribution;
    String title;
    String caption;
    FocalRegion focalRegion;
    String source;

    factory Imagee.fromJson(Map<String, dynamic> json) => Imagee(
        width: json["width"],
        height: json["height"],
        quality: json["quality"],
        url: json["url"],
        attribution: json["attribution"],
        title: json["title"],
        caption: json["caption"],
        focalRegion: FocalRegion.fromJson(json["focalRegion"]),
        source: json["source"],
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "quality": quality,
        "url": url,
        "attribution": attribution,
        "title": title,
        "caption": caption,
        "focalRegion": focalRegion.toJson(),
        "source": source,
    };
}

class FocalRegion {
    FocalRegion({
        this.x1,
        this.x2,
        this.y1,
        this.y2,
    });

    int x1;
    int x2;
    int y1;
    int y2;

    factory FocalRegion.fromJson(Map<String, dynamic> json) => FocalRegion(
        x1: json["x1"],
        x2: json["x2"],
        y1: json["y1"],
        y2: json["y2"],
    );

    Map<String, dynamic> toJson() => {
        "x1": x1,
        "x2": x2,
        "y1": y1,
        "y2": y2,
    };
}

class Provider {
    Provider({
        this.id,
        this.name,
        this.adNetworkId,
        this.logo,
    });

    String id;
    String name;
    String adNetworkId;
    Logo logo;

    factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["id"],
        name: json["name"],
        adNetworkId: json["adNetworkId"],
        logo: Logo.fromJson(json["logo"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "adNetworkId": adNetworkId,
        "logo": logo.toJson(),
    };
}

class Logo {
    Logo({
        this.url,
        this.source,
    });

    String url;
    String source;

    factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        url: json["url"],
        source: json["source"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "source": source,
    };
}
