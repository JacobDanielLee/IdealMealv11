import 'package:http/http.dart' as http;
import 'package:idealmealv11/dishes.dart';
import 'package:idealmealv11/restaurants.dart';

class Dish_Service {

  static List<Dishes> DishArray = [];
  static List<Restaurant> RestaurantsArray = [];

  static const String url = "https://idealmealrestaurants.s3.us-east-2.amazonaws.com/Dish+Data/Dishdata_v1.JSON";
  static const String url2 = "https://idealmealrestaurants.s3.us-east-2.amazonaws.com/Restaurant+Data/Restaurantdata_v2.txt";

  static Future<List<Dishes>> getDishes() async {
    try {
      final response = await http.get(url);

      DishArray = dishesFromJson(response.body);

      if (200 == response.statusCode) {
        List<Dishes> dishes = DishArray;
        return dishes;
      } else {
        print('something went wrong');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<List<Restaurant>> getRestaurants() async {
    try {
      final response = await http.get(url2);

      RestaurantsArray = restaurantFromJson(response.body);

      if (200 == response.statusCode) {
        List<Restaurant> restaurants = RestaurantsArray;
        return restaurants;
      } else {
        return List<Restaurant>();
      }
    } catch (e) {
      return List<Restaurant>();
    }
  }
}