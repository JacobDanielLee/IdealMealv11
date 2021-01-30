// To parse this JSON data, do
//
//     final dishes = dishesFromJson(jsonString);

import 'dart:convert';

List<Dishes> dishesFromJson(String str) => List<Dishes>.from(json.decode(str).map((x) => Dishes.fromJson(x)));

String dishesToJson(List<Dishes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dishes {
  Dishes({
    this.dishid,
    this.restaurantkey,
    this.restaurant,
    this.dish,
    this.dishdescription,
    this.menusection,
    this.calories,
    this.plantbased,
    this.vegan,
    this.vegetarian,
    this.pescaterian,
    this.polloterian,
    this.keto,
    this.lowCarb,
    this.price,
    this.undefined,
  });

  int dishid;
  int restaurantkey;
  String restaurant;
  String dish;
  dynamic dishdescription;
  String menusection;
  dynamic calories;
  dynamic plantbased;
  dynamic vegan;
  dynamic vegetarian;
  dynamic pescaterian;
  dynamic polloterian;
  dynamic keto;
  dynamic lowCarb;
  dynamic price;
  KetoEnum undefined;

  factory Dishes.fromJson(Map<String, dynamic> json) => Dishes(
    dishid: json["dishid"] == null ? null : json["dishid"],
    restaurantkey: json["restaurantkey"] == null ? null : json["restaurantkey"],
    restaurant: json["restaurant"] == null ? null : json["restaurant"],
    dish: json["dish"] == null ? null : json["dish"],
    dishdescription: json["dishdescription"],
    menusection: json["menusection"] == null ? null : json["menusection"],
    calories: json["calories"].toString(),
    plantbased: (json["plantbased"] == "1") ? (json["plantbased"] == true) : false,
    vegan: (json["vegan"] == 1) || (json["vegan"] == true) ? true : false,
    vegetarian: (json["vegetarian"] == 1) || (json["vegetarian"] == true) ? true : false,
    pescaterian: (json["pescaterian"] == 1) || (json["pescaterian"] == true) ? true : false,
    polloterian: (json["polloterian"] == "1") || (json["polloterian"] == "TRUE") ? true : false,
    keto: (json["keto"] == 1) || (json["keto"] == true) ? true : false,
    lowCarb: json["lowCarb"] == 1 ? true : false,
    price: json["price"].toString(),
    undefined: json["undefined"] == null ? null : ketoEnumValues.map[json["undefined"]],
  );

  Map<String, dynamic> toJson() => {
    "dishid": dishid == null ? null : dishid,
    "restaurantkey": restaurantkey == null ? null : restaurantkey,
    "restaurant": restaurant == null ? null : restaurant,
    "dish": dish == null ? null : dish,
    "dishdescription": dishdescription,
    "menusection": menusection == null ? null : menusection,
    "calories": calories,
    "plantbased": plantbased,
    "vegan": vegan,
    "vegetarian": vegetarian,
    "pescaterian": pescaterian,
    "polloterian": polloterian == null ? null : polloterian,
    "keto": keto,
    "lowCarb": lowCarb,
    "price": price,
    "undefined": undefined == null ? null : ketoEnumValues.reverse[undefined],
  };
}

enum KetoEnum { N_A }

final ketoEnumValues = EnumValues({
  "N/A": KetoEnum.N_A
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
