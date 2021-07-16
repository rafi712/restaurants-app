import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:restaurants_app/model/restaurant.dart';
import 'package:restaurants_app/model/restaurant_detail.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<List<Restaurant>> getAllRestaurants() async {
    final response = await http.get(Uri.parse(_baseUrl + 'list'));

    if (response.statusCode == 200) {
      final result = (jsonDecode(response.body) as Map<String, dynamic>)['restaurants'] as List;
      final List<Restaurant> list = result.map((restaurant) => Restaurant.fromJson(restaurant)).toList();
      return list;
    } else {
      return [];
    }
  }

  Future<RestaurantDetail> getRestaurantDetail(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + 'detail/$id'));

    if (response.statusCode == 200) {
      final result = (jsonDecode(response.body) as Map<String, dynamic>)['restaurant'];
      return RestaurantDetail.fromJson(result);

    } else {
      throw Exception('Data not found!');
    }
  }

  Future<List<Restaurant>> searchRestaurant(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + 'search?q=$query'));

    if (response.statusCode == 200) {
      final result = (jsonDecode(response.body) as Map<String, dynamic>)['restaurants'] as List;
      final  list = result.map((restaurant) => Restaurant.fromJson(restaurant)).toList();
      return list;

    } else {
      throw Exception('error');
    }
  }

  
}
