// To parse this JSON data, do
//
//     final searchNews = searchNewsFromJson(jsonString);

import 'dart:convert';

SearchNews searchNewsFromJson(String str) => SearchNews.fromJson(json.decode(str));

String searchNewsToJson(SearchNews data) => json.encode(data.toJson());

class SearchNews {
    SearchNews({
        this.odataContext,
        this.value,
    });

    String odataContext;
    List<Value> value;

    factory SearchNews.fromJson(Map<String, dynamic> json) => SearchNews(
        odataContext: json["@odata.context"] == null ? null : json["@odata.context"],
        value: json["value"] == null ? null :  List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "@odata.context": odataContext == null ? null : odataContext,
        "value": value == null ? null :  List<dynamic>.from(value.map((x) => x.toJson())),
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
    Map<String, List<Metadatum>> metadata;
    String title;
    bool deleted;
    String id;

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        nextPageUrl: json["nextPageUrl"] == null ? null : json["nextPageUrl"],
        subCards: json["subCards"] == null ? null :  List<SubCard>.from(json["subCards"].map((x) => SubCard.fromJson(x))),
        metadata: json["metadata"] == null ? null :  Map.from(json["metadata"]).map((k, v) => MapEntry<String, List<Metadatum>>(k, List<Metadatum>.from(v.map((x) => Metadatum.fromJson(x))))),
        title: json["title"] == null ? null :  json["title"],
        deleted: json["deleted"] == null ? null :  json["deleted"],
        id: json["id"] == null ? null :  json["id"],
    );

    Map<String, dynamic> toJson() => {
        "nextPageUrl": nextPageUrl == null ? null : nextPageUrl,
        "subCards":subCards == null ? null :  List<dynamic>.from(subCards.map((x) => x.toJson())),
        "metadata": metadata == null ? null : Map.from(metadata).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "title": title == null ? null : title,
        "deleted": deleted == null ? null : deleted,
        "id": id == null ? null : id,
    };
}

class Metadatum {
    Metadatum({
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

    factory Metadatum.fromJson(Map<String, dynamic> json) => Metadatum(
        type: json["\u0024type"] == null ? null : json["\u0024type"],
        feedName: json["feedName"] == null ? null : json["feedName"],
        feedId:json["feedId"] == null ? null :  json["feedId"],
        kicker: json["kicker"] == null ? null : List<Kicker>.from(json["kicker"].map((x) => Kicker.fromJson(x))),
        source: json["source"] == null ? null : json["source"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024type": type == null ? null : type,
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
        id: json["id"] == null ? null :  json["id"],
    );

    Map<String, dynamic> toJson() => {
        "feedName": feedName == null ? null : feedName,
        "id": id == null ? null : id,
    };
}

class SubCard {
    SubCard({
        this.type,
        this.source,
        this.sourceId,
        this.cmsId,
        this.publishedDateTime,
        this.provider,
        this.images,
        this.subCardAbstract,
        this.readTimeMin,
        this.headlines,
        this.tags,
        this.algoTags,
        this.categories,
        this.hasSyndicationRights,
        this.title,
        this.subCardType,
        this.url,
        this.locale,
        this.createdBy,
        this.createdDateTime,
        this.updatedDateTime,
        this.deleted,
        this.et,
        this.id,
        this.t,
    });

    String type;
    String source;
    String sourceId;
    String cmsId;
    DateTime publishedDateTime;
    Provider provider;
    List<Image> images;
    String subCardAbstract;
    int readTimeMin;
    List<Headline> headlines;
    List<Tag> tags;
    List<dynamic> algoTags;
    List<Category> categories;
    bool hasSyndicationRights;
    String title;
    String subCardType;
    String url;
    Locale locale;
    String createdBy;
    DateTime createdDateTime;
    DateTime updatedDateTime;
    bool deleted;
    String et;
    String id;
    String t;

    factory SubCard.fromJson(Map<String, dynamic> json) => SubCard(
        type: json["\u0024type"] == null ? null : json["\u0024type"],
        source: json["source"] == null ? null : json["source"],
        sourceId: json["sourceId"] == null ? null : json["sourceId"],
        cmsId: json["cmsId"] == null ? null : json["cmsId"],
        publishedDateTime: json["publishedDateTime"] == null ? null : DateTime.parse(json["publishedDateTime"]),
        provider: json["provider"] == null ? null : Provider.fromJson(json["provider"]),
        images: json["images"] == null ? null : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        subCardAbstract: json["abstract"] == null ? null : json["abstract"],
        readTimeMin: json["readTimeMin"] == null ? null : json["readTimeMin"],
        headlines: json["headlines"] == null ? null : List<Headline>.from(json["headlines"].map((x) => Headline.fromJson(x))),
        tags: json["tags"] == null ? null : List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        algoTags: json["algoTags"] == null ? null : List<dynamic>.from(json["algoTags"].map((x) => x)),
        categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        hasSyndicationRights: json["hasSyndicationRights"] == null ? null : json["hasSyndicationRights"],
        title: json["title"] == null ? null : json["title"],
        subCardType: json["type"] == null ? null : json["type"],
        url: json["url"] == null ? null : json["url"],
        locale: json["locale"] == null ? null : localeValues.map[json["locale"]],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        createdDateTime: json["createdDateTime"] == null ? null : DateTime.parse(json["createdDateTime"]),
        updatedDateTime: json["updatedDateTime"] == null ? null : DateTime.parse(json["updatedDateTime"]),
        deleted: json["deleted"] == null ? null : json["deleted"],
        et: json["_et"] == null ? null : json["_et"],
        id: json["id"] == null ? null : json["id"],
        t: json["_t"] == null ? null : json["_t"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024type": type == null ? null : type,
        "source": source == null ? null : source,
        "sourceId": sourceId == null ? null : sourceId,
        "cmsId": cmsId == null ? null : cmsId,
        "publishedDateTime": publishedDateTime == null ? null : publishedDateTime.toIso8601String(),
        "provider": provider == null ? null : provider.toJson(),
        "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
        "abstract": subCardAbstract == null ? null : subCardAbstract,
        "readTimeMin": readTimeMin == null ? null : readTimeMin,
        "headlines": headlines == null ? null : List<dynamic>.from(headlines.map((x) => x.toJson())),
        "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x.toJson())),
        "algoTags": algoTags == null ? null : List<dynamic>.from(algoTags.map((x) => x)),
        "categories": categories == null ? null : List<dynamic>.from(categories.map((x) => x.toJson())),
        "hasSyndicationRights": hasSyndicationRights == null ? null : hasSyndicationRights,
        "title": title == null ? null : title,
        "type": subCardType == null ? null : subCardType,
        "url": url == null ? null : url,
        "locale": locale == null ? null : localeValues.reverse[locale],
        "createdBy": createdBy == null ? null : createdBy,
        "createdDateTime": createdDateTime == null ? null : createdDateTime.toIso8601String(),
        "updatedDateTime": updatedDateTime == null ? null : updatedDateTime.toIso8601String(),
        "deleted": deleted == null ? null : deleted,
        "_et": et == null ? null : et,
        "id": id == null ? null : id,
        "_t": t == null ? null : t,
    };
}

class Category {
    Category({
        this.product,
        this.label,
        this.source,
        this.score,
        this.locale,
    });

    String product;
    String label;
    String source;
    double score;
    Locale locale;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        product: json["product"] == null ? null : json["product"],
        label: json["label"] == null ? null : json["label"],
        source: json["source"] == null ? null : json["source"],
        score: json["score"] == null ? null : json["score"].toDouble(),
        locale: json["locale"] == null ? null : json["locale"] == null ? null : localeValues.map[json["locale"]],
    );

    Map<String, dynamic> toJson() => {
        "product": product == null ? null : product,
        "label": label == null ? null : label,
        "source": source == null ? null : source,
        "score": score == null ? null : score,
        "locale": locale == null ? null : localeValues.reverse[locale],
    };
}

enum Locale { PT_BR }

final localeValues = EnumValues({
    "pt-br": Locale.PT_BR
});

class Headline {
    Headline({
        this.title,
        this.subTitle,
        this.kicker,
        this.imageCaption,
        this.image,
    });

    String title;
    String subTitle;
    String kicker;
    String imageCaption;
    Image image;

    factory Headline.fromJson(Map<String, dynamic> json) => Headline(
        title: json["title"] == null ? null : json["title"],
        subTitle: json["subTitle"] == null ? null : json["subTitle"],
        kicker: json["kicker"] == null ? null : json["kicker"],
        imageCaption: json["imageCaption"] == null ? null : json["imageCaption"] == null ? null : json["imageCaption"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "subTitle": subTitle == null ? null : subTitle,
        "kicker": kicker == null ? null : kicker,
        "imageCaption": imageCaption == null ? null : imageCaption,
        "image": image == null ? null : image.toJson(),
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
    });

    int width;
    int height;
    int quality;
    String url;
    String attribution;
    String title;
    String caption;
    FocalRegion focalRegion;
    Source source;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        quality: json["quality"] == null ? null : json["quality"],
        url: json["url"] == null ? null : json["url"],
        attribution: json["attribution"] == null ? null : json["attribution"],
        title: json["title"] == null ? null : json["title"],
        caption: json["caption"] == null ? null : json["caption"],
        focalRegion: json["focalRegion"] == null ? null : FocalRegion.fromJson(json["focalRegion"]),
        source: json["source"] == null ? null : sourceValues.map[json["source"]],
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
        "source": sourceValues == null ? null : sourceValues.reverse[source],
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

enum Source { MSN }

final sourceValues = EnumValues({
    "msn": Source.MSN
});

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
        adNetworkId: json["adNetworkId"] == null ? null : json["adNetworkId"] == null ? null : json["adNetworkId"],
        logo: json["logo"] == null ? null :  Logo.fromJson(json["logo"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "adNetworkId": adNetworkId == null ? null : adNetworkId == null ? null : adNetworkId,
        "logo": logo == null ? null : logo.toJson(),
    };
}

class Logo {
    Logo({
        this.url,
        this.source,
    });

    String url;
    Source source;

    factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        url: json["url"] == null ? null : json["url"],
        source: json["source"] == null ? null : sourceValues.map[json["source"]],
    );

    Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "source": source == null ? null : sourceValues.reverse[source],
    };
}

class Tag {
    Tag({
        this.label,
        this.weight,
        this.feedId,
        this.locale,
    });

    String label;
    double weight;
    String feedId;
    Locale locale;

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        label: json["label"] == null ? null : json["label"],
        weight: json["weight"] == null ? null : json["weight"].toDouble(),
        feedId: json["feedId"] == null ? null : json["feedId"],
        locale: json["locale"] == null ? null : localeValues.map[json["locale"]],
    );

    Map<String, dynamic> toJson() => {
        "label": label == null ? null : label,
        "weight": weight == null ? null : weight,
        "feedId": feedId == null ? null : feedId,
        "locale": locale == null ? null :  localeValues.reverse[locale],
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
