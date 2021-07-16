import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:restaurants_app/model/restaurant_detail.dart';
import 'package:restaurants_app/provider/restaurants_provider.dart';
import 'package:restaurants_app/services/api_service.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();

  late RestaurantDetail _restaurant;
  late ResultState _state;
  String _message = '';
  bool _showAllReviews = false;

  String get message => _message;
  bool get showAllReviews => _showAllReviews;
  RestaurantDetail get restaurant => _restaurant;
  ResultState get state => _state;

  set showAllReviews(bool value) {
    _showAllReviews = value;
    notifyListeners();
  }

  RestaurantDetailProvider({required String id}) {
    _fetchDetail(id);
  }

  void refresh(String id) {
    _fetchDetail(id);
  }

  Future<dynamic> _fetchDetail(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      
      final hasConnection = await InternetConnectionChecker().hasConnection;

      if (!hasConnection) {
        _state = ResultState.noConnection;
        notifyListeners();
        return _message = 'No Connection';
      }
      
      final restaurantDetail = await apiService.getRestaurantDetail(id);
      _state = ResultState.hasData;
      _restaurant = restaurantDetail;
      notifyListeners();
      return _restaurant;

    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error: $e';
    }
  }
}
  
