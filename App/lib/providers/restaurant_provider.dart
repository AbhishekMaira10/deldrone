import 'package:deldrone_customer/models/restaurants.dart';
import 'package:deldrone_customer/services/restaurants_service.dart';
import 'package:flutter/material.dart';

class RestaurantProvider with ChangeNotifier {
  RestaurantServices _restaurantServices = RestaurantServices();
  List<RestaurantModel> restaurants = [];

  RestaurantProvider.initialize() {
    _loadRestaurants();
  }

  _loadRestaurants() async {
    restaurants = await _restaurantServices.getRestaurants();
    notifyListeners();
  }
}
