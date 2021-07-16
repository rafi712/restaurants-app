import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:restaurants_app/model/restaurant.dart';
import 'package:restaurants_app/services/api_service.dart';

enum ResultState {
  loading,
  noData,
  hasData,
  error,
  none,
  noConnection,
}

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();

  late List<Restaurant> _restaurants;
  late ResultState _state;
  String? _query;
  String _message = '';

  String get query => _query!;
  String get message => _message;
  List<Restaurant> get restaurants => _restaurants;
  ResultState get state => _state;

  RestaurantProvider() {
    _fetchRestaurants();
  }

  RestaurantProvider.search() {
    _state = ResultState.none;
    notifyListeners();
  }

  void refresh() {
    _fetchRestaurants();
  }

  void searchRestaurants(String query) {
    _query = query;
    _fetchRestaurants();
  }

  Future<dynamic> _fetchRestaurants() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final hasConnection = await InternetConnectionChecker().hasConnection;

      if (!hasConnection) {
        _state = ResultState.noConnection;
        notifyListeners();
        return _message = 'No Connection';
      }
      
      final restaurantsList = _query == null
          ? await apiService.getAllRestaurants()
          : await apiService.searchRestaurant(query);

      if (restaurantsList.isEmpty) {
        _state = ResultState.noData;
        if (_query == null) {
          _message = 'No Restaurants Found!';
        }
        notifyListeners();
        return _query ?? _message;
      } else {
        _state = ResultState.hasData;
        _restaurants = restaurantsList;
        notifyListeners();
        return _restaurants;
      }
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
      return _message;
    }
  }
}
