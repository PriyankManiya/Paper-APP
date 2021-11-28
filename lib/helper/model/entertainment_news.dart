
// import 'dart:convert';

// NewsData newsDataFromJson(String str) => NewsData.fromJson(json.decode(str));

// String newsDataToJson(NewsData data) => json.encode(data.toJson());

// class NewsData {
//     NewsData({
//         this.odataContext,
//         this.value,
//     });

//     String odataContext;
//     List<Value> value;

//     factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
//         odataContext: json["@odata.context"] == null ? null : json["@odata.context"],
//         value: json["value"] == null ? null : List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "@odata.context": odataContext == null ? null : odataContext,
//         "value": value == null ? null : List<dynamic>.from(value.map((x) => x.toJson())),
//     };
// }

// class Value {
//     Value({
//         this.nextPageUrl,
//         this.subCards,
//         this.metadata,
//         this.title,
//         this.deleted,
//         this.id,
//     });

//     String nextPageUrl;
//     List<SubCard> subCards;
//     Metadata metadata;
//     String title;
//     bool deleted;
//     String id;

//     factory Value.fromJson(Map<String, dynamic> json) => Value(
//         nextPageUrl: json["nextPageUrl"] == null ? null : json["nextPageUrl"],
//         subCards: json["subCards"] == null ? null : List<SubCard>.from(json["subCards"].map((x) => SubCard.fromJson(x))),
//         metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
//         title: json["title"] == null ? null : json["title"],
//         deleted: json["deleted"] == null ? null : json["deleted"],
//         id: json["id"] == null ? null : json["id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "nextPageUrl": nextPageUrl == null ? null : nextPageUrl,
//         "subCards": subCards == null ? null : List<dynamic>.from(subCards.map((x) => x.toJson())),
//         "metadata": metadata == null ? null : metadata.toJson(),
//         "title": title == null ? null : title,
//         "deleted": deleted == null ? null : deleted,
//         "id": id == null ? null : id,
//     };
// }

// class Metadata {
//     Metadata({
//         this.aAaqNrg9EnUs,
//         this.aAaNo5KzEnUs,
//         this.entertainment,
//     });

//     List<AAaEnUs> aAaqNrg9EnUs;
//     List<AAaEnUs> aAaNo5KzEnUs;
//     List<Entertainment> entertainment;

//     factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
//         aAaqNrg9EnUs: json["A_AAQNrg9_en-us"] == null ? null : List<AAaEnUs>.from(json["A_AAQNrg9_en-us"].map((x) => AAaEnUs.fromJson(x))),
//         aAaNo5KzEnUs: json["A_AANo5KZ_en-us"] == null ? null : List<AAaEnUs>.from(json["A_AANo5KZ_en-us"].map((x) => AAaEnUs.fromJson(x))),
//         entertainment: json["Entertainment"] == null ? null : List<Entertainment>.from(json["Entertainment"].map((x) => Entertainment.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "A_AAQNrg9_en-us": aAaqNrg9EnUs == null ? null : List<dynamic>.from(aAaqNrg9EnUs.map((x) => x.toJson())),
//         "A_AANo5KZ_en-us": aAaNo5KzEnUs == null ? null : List<dynamic>.from(aAaNo5KzEnUs.map((x) => x.toJson())),
//         "Entertainment": entertainment == null ? null : List<dynamic>.from(entertainment.map((x) => x.toJson())),
//     };
// }

// class AAaEnUs {
//     AAaEnUs({
//         this.type,
//         this.feedName,
//         this.feedId,
//         this.kicker,
//         this.source,
//     });

//     String type;
//     String feedName;
//     String feedId;
//     List<Kicker> kicker;
//     String source;

//     factory AAaEnUs.fromJson(Map<String, dynamic> json) => AAaEnUs(
//         type: json["\u0024type"] == null ? null : json["\u0024type"],
//         feedName: json["feedName"] == null ? null : json["feedName"],
//         feedId: json["feedId"] == null ? null : json["feedId"],
//         kicker: json["kicker"] == null ? null : List<Kicker>.from(json["kicker"].map((x) => Kicker.fromJson(x))),
//         source: json["source"] == null ? null : json["source"],
//     );

//     Map<String, dynamic> toJson() => {
//         "\u0024type": type == null ? null : type,
//         "feedName": feedName == null ? null : feedName,
//         "feedId": feedId == null ? null : feedId,
//         "kicker": kicker == null ? null : List<dynamic>.from(kicker.map((x) => x.toJson())),
//         "source": source == null ? null : source,
//     };
// }

// class Kicker {
//     Kicker({
//         this.feedName,
//         this.id,
//     });

//     String feedName;
//     String id;

//     factory Kicker.fromJson(Map<String, dynamic> json) => Kicker(
//         feedName: json["feedName"] == null ? null : json["feedName"],
//         id: json["id"] == null ? null : json["id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "feedName": feedName == null ? null : feedName,
//         "id": id == null ? null : id,
//     };
// }

// class Entertainment {
//     Entertainment({
//         this.type,
//         this.infoPaneCount,
//         this.sovTargeting,
//     });

//     String type;
//     int infoPaneCount;
//     SovTargeting sovTargeting;

//     factory Entertainment.fromJson(Map<String, dynamic> json) => Entertainment(
//         type: json["\u0024type"] == null ? null : json["\u0024type"],
//         infoPaneCount: json["infoPaneCount"] == null ? null : json["infoPaneCount"],
//         sovTargeting: json["sovTargeting"] == null ? null : SovTargeting.fromJson(json["sovTargeting"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "\u0024type": type == null ? null : type,
//         "infoPaneCount": infoPaneCount == null ? null : infoPaneCount,
//         "sovTargeting": sovTargeting == null ? null : sovTargeting.toJson(),
//     };
// }

// class SovTargeting {
//     SovTargeting();

//     factory SovTargeting.fromJson(Map<String, dynamic> json) => SovTargeting(
//     );

//     Map<String, dynamic> toJson() => {
//     };
// }

// class SubCard {
//     SubCard({
//         this.type,
//         this.source,
//         this.sourceId,
//         this.cmsId,
//         this.publishedDateTime,
//         this.provider,
//         this.images,
//         this.subCardAbstract,
//         this.readTimeMin,
//         this.headlines,
//         this.tags,
//         this.algoTags,
//         this.categories,
//         this.hasSyndicationRights,
//         this.title,
//         this.subCardType,
//         this.url,
//         this.locale,
//         this.createdBy,
//         this.createdDateTime,
//         this.updatedDateTime,
//         this.deleted,
//         this.et,
//         this.id,
//         this.t,
//         this.isLocalContent,
//     });

//     Type type;
//     SubCardSource source;
//     String sourceId;
//     String cmsId;
//     DateTime publishedDateTime;
//     Provider provider;
//     List<Image> images;
//     String subCardAbstract;
//     int readTimeMin;
//     List<Headline> headlines;
//     List<Tag> tags;
//     List<dynamic> algoTags;
//     List<Category> categories;
//     bool hasSyndicationRights;
//     String title;
//     TypeEnum subCardType;
//     String url;
//     Locale locale;
//     CreatedBy createdBy;
//     DateTime createdDateTime;
//     DateTime updatedDateTime;
//     bool deleted;
//     Et et;
//     String id;
//     T t;
//     bool isLocalContent;

//     factory SubCard.fromJson(Map<String, dynamic> json) => SubCard(
//         type: typeValues.map[json["\u0024type"]],
//         source: subCardSourceValues.map[json["source"]],
//         sourceId: json["sourceId"],
//         cmsId: json["cmsId"],
//         publishedDateTime: DateTime.parse(json["publishedDateTime"]),
//         provider: Provider.fromJson(json["provider"]),
//         images: json["images"] == null ? null : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
//         subCardAbstract: json["abstract"],
//         readTimeMin: json["readTimeMin"],
//         headlines: List<Headline>.from(json["headlines"].map((x) => Headline.fromJson(x))),
//         tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
//         algoTags: List<dynamic>.from(json["algoTags"].map((x) => x)),
//         categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
//         hasSyndicationRights: json["hasSyndicationRights"],
//         title: json["title"],
//         subCardType: typeEnumValues.map[json["type"]],
//         url: json["url"],
//         locale: localeValues.map[json["locale"]],
//         createdBy: createdByValues.map[json["createdBy"]],
//         createdDateTime: DateTime.parse(json["createdDateTime"]),
//         updatedDateTime: DateTime.parse(json["updatedDateTime"]),
//         deleted: json["deleted"],
//         et: etValues.map[json["_et"]],
//         id: json["id"],
//         t: tValues.map[json["_t"]],
//         isLocalContent: json["isLocalContent"] == null ? null : json["isLocalContent"],
//     );

//     Map<String, dynamic> toJson() => {
//         "\u0024type": typeValues.reverse[type],
//         "source": subCardSourceValues.reverse[source],
//         "sourceId": sourceId,
//         "cmsId": cmsId,
//         "publishedDateTime": publishedDateTime.toIso8601String(),
//         "provider": provider.toJson(),
//         "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
//         "abstract": subCardAbstract,
//         "readTimeMin": readTimeMin,
//         "headlines": List<dynamic>.from(headlines.map((x) => x.toJson())),
//         "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
//         "algoTags": List<dynamic>.from(algoTags.map((x) => x)),
//         "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
//         "hasSyndicationRights": hasSyndicationRights,
//         "title": title,
//         "type": typeEnumValues.reverse[subCardType],
//         "url": url,
//         "locale": localeValues.reverse[locale],
//         "createdBy": createdByValues.reverse[createdBy],
//         "createdDateTime": createdDateTime.toIso8601String(),
//         "updatedDateTime": updatedDateTime.toIso8601String(),
//         "deleted": deleted,
//         "_et": etValues.reverse[et],
//         "id": id,
//         "_t": tValues.reverse[t],
//         "isLocalContent": isLocalContent == null ? null : isLocalContent,
//     };
// }

// class Category {
//     Category({
//         this.product,
//         this.label,
//         this.source,
//         this.score,
//         this.locale,
//     });

//     String product;
//     String label;
//     String source;
//     double score;
//     String locale;

//     factory Category.fromJson(Map<String, dynamic> json) => Category(
//         product: json["product"] == null ? null : json["product"],
//         label: json["label"] == null ? null : json["label"],
//         source: json["source"] == null ? null : json["source"],
//         score: json["score"] == null ? null : json["score"].toDouble(),
//         locale: json["locale"] == null ? null : json["locale"],
//     );

//     Map<String, dynamic> toJson() => {
//         "product": product == null ? null : product,
//         "label": label == null ? null : label,
//         "source": source == null ? null : source,
//         "score": score == null ? null : score,
//         "locale": locale == null ? null : locale,
//     };
// }

// class Imagee {
//     Imagee({
//         this.width,
//         this.height,
//         this.quality,
//         this.url,
//         this.attribution,
//         this.title,
//         this.focalRegion,
//         this.source,
//         this.colorSamples,
//         this.caption,
//     });

//     int width;
//     int height;
//     int quality;
//     String url;
//     String attribution;
//     String title;
//     FocalRegion focalRegion;
//     String source;
//     ColorSamples colorSamples;
//     String caption;

//     factory Imagee.fromJson(Map<String, dynamic> json) => Imagee(
//         width: json["width"] == null ? null : json["width"],
//         height: json["height"] == null ? null : json["height"],
//         quality: json["quality"] == null ? null : json["quality"],
//         url: json["url"] == null ? null : json["url"],
//         attribution: json["attribution"] == null ? null : json["attribution"],
//         title: json["title"] == null ? null : json["title"],
//         focalRegion: json["focalRegion"] == null ? null : FocalRegion.fromJson(json["focalRegion"]),
//         source: json["source"] == null ? null : json["source"],
//         colorSamples: json["colorSamples"] == null ? null : ColorSamples.fromJson(json["colorSamples"]),
//         caption: json["caption"] == null ? null : json["caption"],
//     );

//     Map<String, dynamic> toJson() => {
//         "width": width == null ? null : width,
//         "height": height == null ? null : height,
//         "quality": quality == null ? null : quality,
//         "url": url == null ? null : url,
//         "attribution": attribution == null ? null : attribution,
//         "title": title == null ? null : title,
//         "focalRegion": focalRegion == null ? null : focalRegion.toJson(),
//         "source": source == null ? null : source,
//         "colorSamples": colorSamples == null ? null : colorSamples.toJson(),
//         "caption": caption == null ? null : caption,
//     };
// }

// class ColorSamples {
//     ColorSamples({
//         this.type,
//         this.values,
//     });

//     String type;
//     List<ValueElement> values;

//     factory ColorSamples.fromJson(Map<String, dynamic> json) => ColorSamples(
//         type: json["\u0024type"] == null ? null : json["\u0024type"],
//         values: json["\u0024values"] == null ? null : List<ValueElement>.from(json["\u0024values"].map((x) => ValueElement.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "\u0024type": type == null ? null : type,
//         "\u0024values": values == null ? null : List<dynamic>.from(values.map((x) => x.toJson())),
//     };
// }

// class ValueElement {
//     ValueElement({
//         this.isDarkMode,
//         this.hexColor,
//     });

//     bool isDarkMode;
//     String hexColor;

//     factory ValueElement.fromJson(Map<String, dynamic> json) => ValueElement(
//         isDarkMode: json["isDarkMode"] == null ? null : json["isDarkMode"],
//         hexColor: json["hexColor"] == null ? null : json["hexColor"],
//     );

//     Map<String, dynamic> toJson() => {
//         "isDarkMode": isDarkMode == null ? null : isDarkMode,
//         "hexColor": hexColor == null ? null : hexColor,
//     };
// }

// class FocalRegion {
//     FocalRegion({
//         this.x1,
//         this.x2,
//         this.y1,
//         this.y2,
//     });

//     int x1;
//     int x2;
//     int y1;
//     int y2;

//     factory FocalRegion.fromJson(Map<String, dynamic> json) => FocalRegion(
//         x1: json["x1"] == null ? null : json["x1"],
//         x2: json["x2"] == null ? null : json["x2"],
//         y1: json["y1"] == null ? null : json["y1"],
//         y2: json["y2"] == null ? null : json["y2"],
//     );

//     Map<String, dynamic> toJson() => {
//         "x1": x1 == null ? null : x1,
//         "x2": x2 == null ? null : x2,
//         "y1": y1 == null ? null : y1,
//         "y2": y2 == null ? null : y2,
//     };
// }

// class Provider {
//     Provider({
//         this.id,
//         this.name,
//         this.adNetworkId,
//         this.logo,
//     });

//     String id;
//     String name;
//     String adNetworkId;
//     Logo logo;

//     factory Provider.fromJson(Map<String, dynamic> json) => Provider(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//         adNetworkId: json["adNetworkId"] == null ? null : json["adNetworkId"],
//         logo: json["logo"] == null ? null : Logo.fromJson(json["logo"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "name": name == null ? null : name,
//         "adNetworkId": adNetworkId == null ? null : adNetworkId,
//         "logo": logo == null ? null : logo.toJson(),
//     };
// }

// class Logo {
//     Logo({
//         this.url,
//         this.source,
//     });

//     String url;
//     String source;

//     factory Logo.fromJson(Map<String, dynamic> json) => Logo(
//         url: json["url"] == null ? null : json["url"],
//         source: json["source"] == null ? null : json["source"],
//     );

//     Map<String, dynamic> toJson() => {
//         "url": url == null ? null : url,
//         "source": source == null ? null : source,
//     };
// }

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
    Map<String, List<Metadatum>> metadata;
    Title title;
    bool deleted;
    String id;

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        nextPageUrl: json["nextPageUrl"],
        subCards: List<SubCard>.from(json["subCards"].map((x) => SubCard.fromJson(x))),
        metadata: Map.from(json["metadata"]).map((k, v) => MapEntry<String, List<Metadatum>>(k, List<Metadatum>.from(v.map((x) => Metadatum.fromJson(x))))),
        title: titleValues.map[json["title"]],
        deleted: json["deleted"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "nextPageUrl": nextPageUrl,
        "subCards": List<dynamic>.from(subCards.map((x) => x.toJson())),
        "metadata": Map.from(metadata).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "title": titleValues.reverse[title],
        "deleted": deleted,
        "id": id,
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
    Title feedName;
    Title feedId;
    List<Kicker> kicker;
    MetadatumSource source;

    factory Metadatum.fromJson(Map<String, dynamic> json) => Metadatum(
        type: json["\u0024type"],
        feedName: titleValues.map[json["feedName"]],
        feedId: titleValues.map[json["feedId"]],
        kicker: List<Kicker>.from(json["kicker"].map((x) => Kicker.fromJson(x))),
        source: metadatumSourceValues.map[json["source"]],
    );

    Map<String, dynamic> toJson() => {
        "\u0024type": type,
        "feedName": titleValues.reverse[feedName],
        "feedId": titleValues.reverse[feedId],
        "kicker": List<dynamic>.from(kicker.map((x) => x.toJson())),
        "source": metadatumSourceValues.reverse[source],
    };
}

enum Title { MARKET_EN_US }

final titleValues = EnumValues({
    "market=en-us": Title.MARKET_EN_US
});

class Kicker {
    Kicker({
        this.feedName,
        this.id,
    });

    Title feedName;
    Title id;

    factory Kicker.fromJson(Map<String, dynamic> json) => Kicker(
        feedName: titleValues.map[json["feedName"]],
        id: titleValues.map[json["id"]],
    );

    Map<String, dynamic> toJson() => {
        "feedName": titleValues.reverse[feedName],
        "id": titleValues.reverse[id],
    };
}

enum MetadatumSource { BING_MSN }

final metadatumSourceValues = EnumValues({
    "bingMsn": MetadatumSource.BING_MSN
});

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
        this.isLocalContent,
    });

    Type type;
    SubCardSource source;
    String sourceId;
    String cmsId;
    DateTime publishedDateTime;
    Provider provider;
    List<Imagee> images;
    String subCardAbstract;
    int readTimeMin;
    List<Headline> headlines;
    List<Tag> tags;
    List<dynamic> algoTags;
    List<Category> categories;
    bool hasSyndicationRights;
    String title;
    TypeEnum subCardType;
    String url;
    Locale locale;
    CreatedBy createdBy;
    DateTime createdDateTime;
    DateTime updatedDateTime;
    bool deleted;
    Et et;
    String id;
    T t;
    bool isLocalContent;

    factory SubCard.fromJson(Map<String, dynamic> json) => SubCard(
        type: typeValues.map[json["\u0024type"]],
        source: subCardSourceValues.map[json["source"]],
        sourceId: json["sourceId"],
        cmsId: json["cmsId"],
        publishedDateTime: DateTime.parse(json["publishedDateTime"]),
        provider: Provider.fromJson(json["provider"]),
        images: json["images"] == null ? null : List<Imagee>.from(json["images"].map((x) => Imagee.fromJson(x))),
        subCardAbstract: json["abstract"],
        readTimeMin: json["readTimeMin"],
        headlines: List<Headline>.from(json["headlines"].map((x) => Headline.fromJson(x))),
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        algoTags: List<dynamic>.from(json["algoTags"].map((x) => x)),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        hasSyndicationRights: json["hasSyndicationRights"],
        title: json["title"],
        subCardType: typeEnumValues.map[json["type"]],
        url: json["url"],
        locale: localeValues.map[json["locale"]],
        createdBy: createdByValues.map[json["createdBy"]],
        createdDateTime: DateTime.parse(json["createdDateTime"]),
        updatedDateTime: DateTime.parse(json["updatedDateTime"]),
        deleted: json["deleted"],
        et: etValues.map[json["_et"]],
        id: json["id"],
        t: tValues.map[json["_t"]],
        isLocalContent: json["isLocalContent"] == null ? null : json["isLocalContent"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024type": typeValues.reverse[type],
        "source": subCardSourceValues.reverse[source],
        "sourceId": sourceId,
        "cmsId": cmsId,
        "publishedDateTime": publishedDateTime.toIso8601String(),
        "provider": provider.toJson(),
        "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
        "abstract": subCardAbstract,
        "readTimeMin": readTimeMin,
        "headlines": List<dynamic>.from(headlines.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "algoTags": List<dynamic>.from(algoTags.map((x) => x)),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "hasSyndicationRights": hasSyndicationRights,
        "title": title,
        "type": typeEnumValues.reverse[subCardType],
        "url": url,
        "locale": localeValues.reverse[locale],
        "createdBy": createdByValues.reverse[createdBy],
        "createdDateTime": createdDateTime.toIso8601String(),
        "updatedDateTime": updatedDateTime.toIso8601String(),
        "deleted": deleted,
        "_et": etValues.reverse[et],
        "id": id,
        "_t": tValues.reverse[t],
        "isLocalContent": isLocalContent == null ? null : isLocalContent,
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

    Product product;
    String label;
    CategorySource source;
    double score;
    Locale locale;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        product: productValues.map[json["product"]],
        label: json["label"],
        source: categorySourceValues.map[json["source"]],
        score: json["score"].toDouble(),
        locale: json["locale"] == null ? null : localeValues.map[json["locale"]],
    );

    Map<String, dynamic> toJson() => {
        "product": productValues.reverse[product],
        "label": label,
        "source": categorySourceValues.reverse[source],
        "score": score,
        "locale": locale == null ? null : localeValues.reverse[locale],
    };
}

enum Locale { EN_US }

final localeValues = EnumValues({
    "en-us": Locale.EN_US
});

enum Product { NEWS, FINANCE }

final productValues = EnumValues({
    "finance": Product.FINANCE,
    "news": Product.NEWS
});

enum CategorySource { INGESTION_RULE, SELECTION_ML_MODEL }

final categorySourceValues = EnumValues({
    "IngestionRule": CategorySource.INGESTION_RULE,
    "SelectionMLModel": CategorySource.SELECTION_ML_MODEL
});

enum CreatedBy { MICROPUBLISH }

final createdByValues = EnumValues({
    "micropublish": CreatedBy.MICROPUBLISH
});

enum Et { ARTIFACT_DATA }

final etValues = EnumValues({
    "ArtifactData": Et.ARTIFACT_DATA
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
    Imagee image;

    factory Headline.fromJson(Map<String, dynamic> json) => Headline(
        title: json["title"],
        subTitle: json["subTitle"],
        kicker: json["kicker"],
        imageCaption: json["imageCaption"] == null ? null : json["imageCaption"],
        image: json["image"] == null ? null : Imagee.fromJson(json["image"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitle,
        "kicker": kicker,
        "imageCaption": imageCaption == null ? null : imageCaption,
        "image": image == null ? null : image.toJson(),
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
        this.source,
        this.focalRegion,
        this.colorSamples,
    });

    int width;
    int height;
    int quality;
    String url;
    String attribution;
    String title;
    String caption;
    ImageeSource source;
    FocalRegion focalRegion;
    ColorSamples colorSamples;

    factory Imagee.fromJson(Map<String, dynamic> json) => Imagee(
        width: json["width"],
        height: json["height"],
        quality: json["quality"],
        url: json["url"],
        attribution: json["attribution"],
        title: json["title"],
        caption: json["caption"] == null ? null : json["caption"],
        source: imageSourceValues.map[json["source"]],
        focalRegion: json["focalRegion"] == null ? null : FocalRegion.fromJson(json["focalRegion"]),
        colorSamples: json["colorSamples"] == null ? null : ColorSamples.fromJson(json["colorSamples"]),
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "quality": quality,
        "url": url,
        "attribution": attribution,
        "title": title,
        "caption": caption == null ? null : caption,
        "source": imageSourceValues.reverse[source],
        "focalRegion": focalRegion == null ? null : focalRegion.toJson(),
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
        type: json["\u0024type"],
        values: List<ValueElement>.from(json["\u0024values"].map((x) => ValueElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "\u0024type": type,
        "\u0024values": List<dynamic>.from(values.map((x) => x.toJson())),
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
        hexColor: json["hexColor"],
    );

    Map<String, dynamic> toJson() => {
        "isDarkMode": isDarkMode == null ? null : isDarkMode,
        "hexColor": hexColor,
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

enum ImageeSource { MSN }

final imageSourceValues = EnumValues({
    "msn": ImageeSource.MSN
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
    ImageeSource source;

    factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        url: json["url"],
        source: imageSourceValues.map[json["source"]],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "source": imageSourceValues.reverse[source],
    };
}

enum SubCardSource { CMS }

final subCardSourceValues = EnumValues({
    "CMS": SubCardSource.CMS
});

enum TypeEnum { ARTICLE }

final typeEnumValues = EnumValues({
    "article": TypeEnum.ARTICLE
});

enum T { CONTENT_VIEW }

final tValues = EnumValues({
    "ContentView": T.CONTENT_VIEW
});

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
    String locale;

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        label: json["label"],
        weight: json["weight"].toDouble(),
        feedId: json["feedId"],
        locale: json["locale"],
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "weight": weight,
        "feedId": feedId,
        "locale": locale,
    };
}

enum Type { MSN_TAGS_DATA_MODEL_TAG_ENTITY_LIB_ARTIFACT_MSN_TAGS_DATA_MODEL }

final typeValues = EnumValues({
    "Msn.TagsDataModel.TagEntityLib.Artifact, Msn.TagsDataModel": Type.MSN_TAGS_DATA_MODEL_TAG_ENTITY_LIB_ARTIFACT_MSN_TAGS_DATA_MODEL
});

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
