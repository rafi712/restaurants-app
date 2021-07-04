import 'dart:convert';


class Restaurant {
  String id, name, description, pictureId, city;
  num rating;
  List<String> foods, drinks;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.foods,
    required this.drinks,
  });

  factory Restaurant.fromJson(Map<String, dynamic> object) {
    List<String> foods = [];
    List<String> drinks = [];
    object['menus']['foods'].forEach((food) => foods.add(food['name']));
    object['menus']['drinks'].forEach((drink) => drinks.add(drink['name']));

    return Restaurant(
      id : object['id'],
      name : object['name'],
      description : object['description'],
      pictureId : object['pictureId'],
      city : object['city'],
      rating : object['rating'],
      foods: foods,
      drinks: drinks,
    );
  }  
}

List<Restaurant> getRestaurant(String? json) {
    if (json == null) {
      return [];
    }

    final List parsed = (jsonDecode(json) as Map<String, dynamic>)['restaurants'];
    return parsed.map((restaurant) => Restaurant.fromJson(restaurant)).toList();
  }
