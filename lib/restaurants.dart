// To parse this JSON data, do
//
//     final restaurant = restaurantFromJson(jsonString);

import 'dart:convert';

List<Restaurant> restaurantFromJson(String str) => List<Restaurant>.from(json.decode(str).map((x) => Restaurant.fromJson(x)));

String restaurantToJson(List<Restaurant> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Restaurant {
  Restaurant({
    this.priKey,
    this.name,
    this.type,
    this.cuisine,
    this.website,
    this.address,
    this.phoneNumber,
    this.imageUrl,
    this.plantbased,
    this.vegan,
    this.vegetarian,
    this.pescaterian,
    this.polloterian,
    this.keto,
    this.lowCarb,
    this.categoryList,
    this.validLink
  });

  int priKey;
  String name;
  Type type;
  String cuisine;
  String website;
  String address;
  String phoneNumber;
  String imageUrl;
  var categoryList = [];
  var validLink;
  int plantbased;
  int vegan;
  int vegetarian;
  int pescaterian;
  int polloterian;
  int keto;
  int lowCarb;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    priKey: json["res.Id"],
    name: json["name"],
    type: json["type"] == null ? null : typeValues.map[json["type"]],
    cuisine: json["cuisine"] == null ? null : json["cuisine"],
    website: json["website"] == null ? null : json["website"],
    address: json["address"] == null ? null : json["address"],
    phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "res.Id": priKey,
    "name": name,
    "type": type == null ? null : typeValues.reverse[type],
    "cuisine": cuisine == null ? null : cuisine,
    "website": website == null ? null : website,
    "address": address == null ? null : address,
    "phoneNumber": phoneNumber == null ? null : phoneNumber,
    "imageUrl" : imageUrl == null ? null : imageUrl,
  };
}

enum Type { FAST_CASUAL, SIT_DOWN, FAST_FOOD, TAKE_OUT, BEVERAGES, DESSERTS, BAKERY }

final typeValues = EnumValues({
  "Bakery": Type.BAKERY,
  "Beverages": Type.BEVERAGES,
  "Desserts": Type.DESSERTS,
  "Fast Casual": Type.FAST_CASUAL,
  "Fast Food": Type.FAST_FOOD,
  "Sit Down": Type.SIT_DOWN,
  "Take Out": Type.TAKE_OUT
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
