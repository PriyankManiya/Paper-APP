// To parse this JSON data, do
//
//     final newsdata = newsdataFromJson(jsonString);

import 'dart:convert';

Newsdata newsdataFromJson(String str) => Newsdata.fromJson(json.decode(str));

String newsdataToJson(Newsdata data) => json.encode(data.toJson());

class Newsdata {
    Newsdata({
        this.odataContext,
        this.value,
    });

    String odataContext;
    List<Value> value;

    factory Newsdata.fromJson(Map<String, dynamic> json) => Newsdata(
        odataContext: json["@odata.context"] == null ? null : json["@odata.context"],
        value: json["value"] == null ? null : List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "@odata.context": odataContext == null ? null : odataContext,
        "value": value == null ? null : List<dynamic>.from(value.map((x) => x.toJson())),
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
        nextPageUrl: json["nextPageUrl"] == null ? null : json["nextPageUrl"],
        subCards: json["subCards"] == null ? null : List<SubCard>.from(json["subCards"].map((x) => SubCard.fromJson(x))),
        metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
        title: json["title"] == null ? null : json["title"],
        deleted: json["deleted"] == null ? null : json["deleted"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "nextPageUrl": nextPageUrl == null ? null : nextPageUrl,
        "subCards": subCards == null ? null : List<dynamic>.from(subCards.map((x) => x.toJson())),
        "metadata": metadata == null ? null : metadata.toJson(),
        "title": title == null ? null : title,
        "deleted": deleted == null ? null : deleted,
        "id": id == null ? null : id,
    };
}

class Metadata {
    Metadata({
        this.aAarf8NoEnUs,
        this.entertainment,
    });

    List<AAarf8NoEnUs> aAarf8NoEnUs;
    List<Entertainment> entertainment;

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        aAarf8NoEnUs: json["A_AARF8no_en-us"] == null ? null : List<AAarf8NoEnUs>.from(json["A_AARF8no_en-us"].map((x) => AAarf8NoEnUs.fromJson(x))),
        entertainment: json["Entertainment"] == null ? null : List<Entertainment>.from(json["Entertainment"].map((x) => Entertainment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "A_AARF8no_en-us": aAarf8NoEnUs == null ? null : List<dynamic>.from(aAarf8NoEnUs.map((x) => x.toJson())),
        "Entertainment": entertainment == null ? null : List<dynamic>.from(entertainment.map((x) => x.toJson())),
    };
}

class AAarf8NoEnUs {
    AAarf8NoEnUs({
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

    factory AAarf8NoEnUs.fromJson(Map<String, dynamic> json) => AAarf8NoEnUs(
        type: json["\$type"] == null ? null : json["\$type"],
        feedName: json["feedName"] == null ? null : json["feedName"],
        feedId: json["feedId"] == null ? null : json["feedId"],
        kicker: json["kicker"] == null ? null : List<Kicker>.from(json["kicker"].map((x) => Kicker.fromJson(x))),
        source: json["source"] == null ? null : json["source"],
    );

    Map<String, dynamic> toJson() => {
        "\$type": type == null ? null : type,
        "feedName": feedName == null ? null : feedName,
        "feedId": feedId == null ? null : feedId,
        "kicker": kicker == null ? null : List<dynamic>.from(kicker.map((x) => x.toJson())),
        "source": source == null ? null : source,
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
        feedName: json["feedName"] == null ? null : json["feedName"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "feedName": feedName == null ? null : feedName,
        "id": id == null ? null : id,
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
        type: json["\$type"] == null ? null : json["\$type"],
        infoPaneCount: json["infoPaneCount"] == null ? null : json["infoPaneCount"],
        sovTargeting: json["sovTargeting"] == null ? null : SovTargeting.fromJson(json["sovTargeting"]),
    );

    Map<String, dynamic> toJson() => {
        "\$type": type == null ? null : type,
        "infoPaneCount": infoPaneCount == null ? null : infoPaneCount,
        "sovTargeting": sovTargeting == null ? null : sovTargeting.toJson(),
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
    List<Image> images;
    String title;
    String subCardType;
    String url;
    bool deleted;
    String id;

    factory SubCard.fromJson(Map<String, dynamic> json) => SubCard(
        type: json["\$type"] == null ? null : json["\$type"],
        sourceId: json["sourceId"] == null ? null : json["sourceId"],
        cmsId: json["cmsId"] == null ? null : json["cmsId"],
        publishedDateTime: json["publishedDateTime"] == null ? null : DateTime.parse(json["publishedDateTime"]),
        provider: json["provider"] == null ? null : Provider.fromJson(json["provider"]),
        images: json["images"] == null ? null : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        title: json["title"] == null ? null : json["title"],
        subCardType: json["type"] == null ? null : json["type"],
        url: json["url"] == null ? null : json["url"],
        deleted: json["deleted"] == null ? null : json["deleted"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "\$type": type == null ? null : type,
        "sourceId": sourceId == null ? null : sourceId,
        "cmsId": cmsId == null ? null : cmsId,
        "publishedDateTime": publishedDateTime == null ? null : publishedDateTime.toIso8601String(),
        "provider": provider == null ? null : provider.toJson(),
        "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
        "title": title == null ? null : title,
        "type": subCardType == null ? null : subCardType,
        "url": url == null ? null : url,
        "deleted": deleted == null ? null : deleted,
        "id": id == null ? null : id,
    };
}

class Image {
    Image({
        this.width,
        this.height,
        this.quality,
        this.url,
        this.attribution,
        this.title,
        this.caption,
        this.focalRegion,
        this.source,
        this.colorSamples,
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
    ColorSamples colorSamples;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        quality: json["quality"] == null ? null : json["quality"],
        url: json["url"] == null ? null : json["url"],
        attribution: json["attribution"] == null ? null : json["attribution"],
        title: json["title"] == null ? null : json["title"],
        caption: json["caption"] == null ? null : json["caption"],
        focalRegion: json["focalRegion"] == null ? null : FocalRegion.fromJson(json["focalRegion"]),
        source: json["source"] == null ? null : json["source"],
        colorSamples: json["colorSamples"] == null ? null : ColorSamples.fromJson(json["colorSamples"]),
    );

    Map<String, dynamic> toJson() => {
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "quality": quality == null ? null : quality,
        "url": url == null ? null : url,
        "attribution": attribution == null ? null : attribution,
        "title": title == null ? null : title,
        "caption": caption == null ? null : caption,
        "focalRegion": focalRegion == null ? null : focalRegion.toJson(),
        "source": source == null ? null : source,
        "colorSamples": colorSamples == null ? null : colorSamples.toJson(),
    };
}

class ColorSamples {
    ColorSamples({
        this.type,
        this.values,
    });

    String type;
    List<ValueElement> values;

    factory ColorSamples.fromJson(Map<String, dynamic> json) => ColorSamples(
        type: json["\$type"] == null ? null : json["\$type"],
        values: json["\$values"] == null ? null : List<ValueElement>.from(json["\$values"].map((x) => ValueElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "\$type": type == null ? null : type,
        "\$values": values == null ? null : List<dynamic>.from(values.map((x) => x.toJson())),
    };
}

class ValueElement {
    ValueElement({
        this.isDarkMode,
        this.hexColor,
    });

    bool isDarkMode;
    String hexColor;

    factory ValueElement.fromJson(Map<String, dynamic> json) => ValueElement(
        isDarkMode: json["isDarkMode"] == null ? null : json["isDarkMode"],
        hexColor: json["hexColor"] == null ? null : json["hexColor"],
    );

    Map<String, dynamic> toJson() => {
        "isDarkMode": isDarkMode == null ? null : isDarkMode,
        "hexColor": hexColor == null ? null : hexColor,
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
        x1: json["x1"] == null ? null : json["x1"],
        x2: json["x2"] == null ? null : json["x2"],
        y1: json["y1"] == null ? null : json["y1"],
        y2: json["y2"] == null ? null : json["y2"],
    );

    Map<String, dynamic> toJson() => {
        "x1": x1 == null ? null : x1,
        "x2": x2 == null ? null : x2,
        "y1": y1 == null ? null : y1,
        "y2": y2 == null ? null : y2,
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
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        adNetworkId: json["adNetworkId"] == null ? null : json["adNetworkId"],
        logo: json["logo"] == null ? null : Logo.fromJson(json["logo"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "adNetworkId": adNetworkId == null ? null : adNetworkId,
        "logo": logo == null ? null : logo.toJson(),
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
        url: json["url"] == null ? null : json["url"],
        source: json["source"] == null ? null : json["source"],
    );

    Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "source": source == null ? null : source,
    };
}
