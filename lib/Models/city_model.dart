class LocModel {
    LocModel({
        required this.status,
        required this.msg,
        required this.results,
    });

    final int? status;
    final dynamic msg;
    final Results? results;

    factory LocModel.fromJson(Map<String, dynamic> json){ 
        return LocModel(
            status: json["status"],
            msg: json["msg"],
            results: json["results"] == null ? null : Results.fromJson(json["results"]),
        );
    }

}

class Results {
    Results({
        required this.data,
        required this.partialContent,
    });

    final List<Datum> data;
    final bool? partialContent;

    factory Results.fromJson(Map<String, dynamic> json){ 
        return Results(
            data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
            partialContent: json["partial_content"],
        );
    }

}

class Datum {
    Datum({
        required this.resultType,
        required this.resultObject,
        required this.scope,
    });

    final String? resultType;
    final ResultObject? resultObject;
    final String? scope;

    factory Datum.fromJson(Map<String, dynamic> json){ 
        return Datum(
            resultType: json["result_type"],
            resultObject: json["result_object"] == null ? null : ResultObject.fromJson(json["result_object"]),
            scope: json["scope"],
        );
    }

}

class ResultObject {
    ResultObject({
        required this.locationId,
        required this.name,
        required this.latitude,
        required this.longitude,
        required this.timezone,
        required this.locationString,
        required this.photo,
        required this.defaultOptions,
        required this.geoType,
        required this.locationSubtype,
        required this.hasRestaurantCoverpage,
        required this.hasAttractionCoverpage,
        required this.hasCuratedShoppingList,
        required this.showAddress,
        required this.preferredMapEngine,
        required this.description,
        required this.isLocalizedDescription,
        required this.ancestors,
        required this.parentDisplayName,
        required this.guideCount,
    });

    final String? locationId;
    final String? name;
    final String? latitude;
    final String? longitude;
    final String? timezone;
    final String? locationString;
    final Photo? photo;
    final List<DefaultOption> defaultOptions;
    final String? geoType;
    final String? locationSubtype;
    final bool? hasRestaurantCoverpage;
    final bool? hasAttractionCoverpage;
    final bool? hasCuratedShoppingList;
    final bool? showAddress;
    final String? preferredMapEngine;
    final String? description;
    final bool? isLocalizedDescription;
    final List<Ancestor> ancestors;
    final String? parentDisplayName;
    final String? guideCount;

    factory ResultObject.fromJson(Map<String, dynamic> json){ 
        return ResultObject(
            locationId: json["location_id"],
            name: json["name"],
            latitude: json["latitude"],
            longitude: json["longitude"],
            timezone: json["timezone"],
            locationString: json["location_string"],
            photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
            defaultOptions: json["default_options"] == null ? [] : List<DefaultOption>.from(json["default_options"]!.map((x) => DefaultOption.fromJson(x))),
            geoType: json["geo_type"],
            locationSubtype: json["location_subtype"],
            hasRestaurantCoverpage: json["has_restaurant_coverpage"],
            hasAttractionCoverpage: json["has_attraction_coverpage"],
            hasCuratedShoppingList: json["has_curated_shopping_list"],
            showAddress: json["show_address"],
            preferredMapEngine: json["preferred_map_engine"],
            description: json["description"],
            isLocalizedDescription: json["is_localized_description"],
            ancestors: json["ancestors"] == null ? [] : List<Ancestor>.from(json["ancestors"]!.map((x) => Ancestor.fromJson(x))),
            parentDisplayName: json["parent_display_name"],
            guideCount: json["guide_count"],
        );
    }

}

class Ancestor {
    Ancestor({
        required this.subcategory,
        required this.name,
        required this.abbrv,
        required this.locationId,
    });

    final List<DefaultOption> subcategory;
    final String? name;
    final dynamic abbrv;
    final String? locationId;

    factory Ancestor.fromJson(Map<String, dynamic> json){ 
        return Ancestor(
            subcategory: json["subcategory"] == null ? [] : List<DefaultOption>.from(json["subcategory"]!.map((x) => DefaultOption.fromJson(x))),
            name: json["name"],
            abbrv: json["abbrv"],
            locationId: json["location_id"],
        );
    }

}

class DefaultOption {
    DefaultOption({
        required this.key,
        required this.name,
    });

    final String? key;
    final String? name;

    factory DefaultOption.fromJson(Map<String, dynamic> json){ 
        return DefaultOption(
            key: json["key"],
            name: json["name"],
        );
    }

}

class Photo {
    Photo({
        required this.images,
        required this.isBlessed,
        required this.uploadedDate,
        required this.caption,
        required this.id,
        required this.helpfulVotes,
        required this.publishedDate,
        required this.user,
    });

    final Images? images;
    final bool? isBlessed;
    final String? uploadedDate;
    final String? caption;
    final String? id;
    final String? helpfulVotes;
    final String? publishedDate;
    final User? user;

    factory Photo.fromJson(Map<String, dynamic> json){ 
        return Photo(
            images: json["images"] == null ? null : Images.fromJson(json["images"]),
            isBlessed: json["is_blessed"],
            uploadedDate: json["uploaded_date"],
            caption: json["caption"],
            id: json["id"],
            helpfulVotes: json["helpful_votes"],
            publishedDate: json["published_date"],
            user: json["user"] == null ? null : User.fromJson(json["user"]),
        );
    }

}

class Images {
    Images({
        required this.small,
        required this.thumbnail,
        required this.original,
        required this.large,
        required this.medium,
    });

    final Large? small;
    final Large? thumbnail;
    final Large? original;
    final Large? large;
    final Large? medium;

    factory Images.fromJson(Map<String, dynamic> json){ 
        return Images(
            small: json["small"] == null ? null : Large.fromJson(json["small"]),
            thumbnail: json["thumbnail"] == null ? null : Large.fromJson(json["thumbnail"]),
            original: json["original"] == null ? null : Large.fromJson(json["original"]),
            large: json["large"] == null ? null : Large.fromJson(json["large"]),
            medium: json["medium"] == null ? null : Large.fromJson(json["medium"]),
        );
    }

}

class Large {
    Large({
        required this.width,
        required this.url,
        required this.height,
    });

    final String? width;
    final String? url;
    final String? height;

    factory Large.fromJson(Map<String, dynamic> json){ 
        return Large(
            width: json["width"],
            url: json["url"],
            height: json["height"],
        );
    }

}

class User {
    User({
        required this.userId,
        required this.memberId,
        required this.type,
    });

    final dynamic userId;
    final String? memberId;
    final String? type;

    factory User.fromJson(Map<String, dynamic> json){ 
        return User(
            userId: json["user_id"],
            memberId: json["member_id"],
            type: json["type"],
        );
    }

}
